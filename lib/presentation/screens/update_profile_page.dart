import 'dart:io';

import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/cache/cache_helper.dart';
import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/cubit/users/delete_user_cubit.dart';
import 'package:badihi/cubit/users/update_user_cubit.dart';
import 'package:badihi/cubit/users/upload_profile_photo_cubit.dart';
import 'package:badihi/presentation/components/confirmation_bottom_sheet.dart';
import 'package:badihi/presentation/components/contact_us_by_email.dart';
import 'package:badihi/presentation/components/custom_app_bar.dart';
import 'package:badihi/presentation/components/custom_bottom_sheet.dart';
import 'package:badihi/presentation/components/custom_circular_progress_indicator.dart';
import 'package:badihi/presentation/components/custom_text_form_field.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:badihi/presentation/components/notification_toast.dart';
import 'package:badihi/presentation/screens/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> updateProfileFormKey = GlobalKey();
    TextEditingController updateProfileUsername = TextEditingController();
    TextEditingController updateProfileFullName = TextEditingController();
    TextEditingController updateProfileEmail = TextEditingController();
    File? selectedImage;

    Future<void> pickImage(BuildContext context) async {
      const int maxFileSizeInBytes = 4 * 1024 * 1024; // 4 MB

      try {
        final ImagePicker picker = ImagePicker();

        final XFile? image = await picker.pickImage(
          source: ImageSource.gallery,
        );

        if (image == null) return;

        final File file = File(image.path);
        final int size = await file.length();
        final String name = image.name;
        final String extension = name.split('.').last.toLowerCase();

        const allowedExtensions = ['jpg', 'jpeg', 'png'];

        if (!allowedExtensions.contains(extension)) {
          showToast(context: context, message: 'صيغة الصورة غير مدعومة', isError: true);
          return;
        }

        if (size > maxFileSizeInBytes) {
          showToast(context: context, message: 'حجم الصورة يجب ألا يزيد عن 4 ميجابايت', isError: true);
          return;
        }

        setState(() {
          selectedImage = file;
        });

        context.read<UploadProfilePhotoCubit>().uploadProfilePhoto(file);
      } catch (e) {
        showToast(context: context, message: 'حدث خطأ أثناء اختيار الصورة', isError: true);
      }
    }

    return Scaffold(
      appBar: CustomAppBar(appBarTitle: "تعديل بيانات الحساب"),
      body: MultiBlocListener(
        listeners: [
          BlocListener<UpdateUserCubit, UpdateUserState>(
            listener: (context, state) async {
              setState(() {
                _isLoading = false;
              });
              if (state is UpdateUserSuccess) {
                showToast(context: context, message: "تم تعديل بياناتك الشخصية بنجاح");
                getIt<CacheHelper>().setString(ApiKey.username, state.currentUser.data!.username!);
                getIt<CacheHelper>().setString(ApiKey.fullName, state.currentUser.data!.fullName!);
              } else if (state is UpdateUserLoading) {
                setState(() {
                  _isLoading = true;
                });
              } else if (state is UpdateUserFailure) {
                showToast(context: context, message: state.errMessage, isError: true);
              }
            },
          ),
          // Delete User Listener
          BlocListener<DeleteUserCubit, DeleteUserState>(
            listener: (context, state) async {
              if (state is DeleteUserSuccess) {
                await getIt<CacheHelper>().clearUserData();

                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return LoginPage();
                    },
                  ),
                );
                showToast(
                  context: context,
                  message: "تم حذف حسابك بنجاح",
                );
              } else if (state is DeleteUserFailure) {
                showToast(
                  context: context,
                  message: state.errMessage,
                  isError: true,
                );
              }
            },
          ),
          BlocListener<UploadProfilePhotoCubit, UploadProfilePhotoState>(
            listener: (context, state) async {
              if (state is UploadProfilePhotoSuccess) {
                showToast(
                  context: context,
                  message: "تم تحديث صورة الملف الشخصي بنجاح",
                );
              } else if (state is UploadProfilePhotoFailure) {
                showToast(
                  context: context,
                  message: state.errMessage,
                  isError: true,
                );
              }
            },
          ),
        ],
        child: BlocBuilder<UpdateUserCubit, UpdateUserState>(
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.fromLTRB(
                AppSpacing.spacing2XL,
                AppSpacing.spacing5XL,
                AppSpacing.spacing2XL,
                AppSpacing.spacing4XL,
              ),
              child: ListView(
                children: [
                  BlocBuilder<UploadProfilePhotoCubit, UploadProfilePhotoState>(
                    builder: (context, state) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: context.appColors.fgDisabledSubtle,
                              ),
                              borderRadius: BorderRadius.circular(9999),
                            ),
                          ),
                          child: state is UploadProfilePhotoLoading
                              ? SizedBox(
                                  width: 65,
                                  height: 65,
                                  child: CustomCircularProgressIndicator(),
                                )
                              : getIt<CacheHelper>().getString(ApiKey.profileImage) != ""
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        getIt<CacheHelper>().getString(ApiKey.profileImage) ?? "",
                                        width: 65,
                                        height: 65,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: SvgPicture.asset(
                                        'assets/images/icons/user-01.svg',
                                        width: 35,
                                        height: 35,
                                        colorFilter: ColorFilter.mode(
                                            context.appColors.fgSecondaryHover, BlendMode.srcIn),
                                      ),
                                    ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: AppSpacing.spacingMD),
                  Align(
                    alignment: Alignment.center,
                    child: Material(
                      color: context.appColors.bgPrimary,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: context.appColors.borderPrimary,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: BlocBuilder<UploadProfilePhotoCubit, UploadProfilePhotoState>(
                        builder: (context, state) {
                          return InkWell(
                            onTap: () => state is UploadProfilePhotoLoading ? null : pickImage(context),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/icons/edit-05.svg',
                                    width: 20,
                                    height: 20,
                                    colorFilter: ColorFilter.mode(
                                        context.appColors.fgQuaternary_hover, BlendMode.srcIn),
                                  ),
                                  SizedBox(width: AppSpacing.spacingXS),
                                  Text(
                                    'تغيير صورة الملف الشخصي',
                                    style: TextStyle(
                                      color: context
                                          .appColors.textSecondary /* Colors-Text-text-secondary-(700) */,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 1.43,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.spacing4XL),
                  Form(
                    key: updateProfileFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          controller: updateProfileUsername,
                          labelText: 'اسم المستخدم',
                          placeholderText: "اسم المستخدم",
                          prefixIcon: "user-circle",
                          fieldname: 'username',
                          defaultValue: getIt<CacheHelper>().getString(ApiKey.username) ?? "اسم المستخدم",
                        ),
                        SizedBox(height: AppSpacing.spacingXL),
                        CustomTextFormField(
                          controller: updateProfileFullName,
                          labelText: 'الاسم',
                          placeholderText: "اكتب اسمك",
                          prefixIcon: "user-01",
                          fieldname: 'name',
                          defaultValue: getIt<CacheHelper>().getString(ApiKey.fullName) ?? "الإسم",
                        ),
                        SizedBox(height: AppSpacing.spacingXL),
                        CustomTextFormField(
                          controller: updateProfileEmail,
                          labelText: 'البريد الإلكتروني',
                          placeholderText: "example@badihi.com",
                          prefixIcon: "mail-01",
                          fieldname: 'email',
                          defaultValue: getIt<CacheHelper>().getString(ApiKey.email) ?? "الإيميل",
                          isEnabled: false,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.spacingSM),
                  Row(
                    children: [
                      Text(
                        'لا يمكنك تغيير البريد الإلكتروني، يمكنك ',
                        style: TextStyle(
                          color: context.appColors.textTertiary /* Colors-Text-text-tertiary-(600) */,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.43,
                        ),
                      ),
                      ContactUsByEmail(btnText: "التواصل معنا"),
                    ],
                  ),
                  SizedBox(height: AppSpacing.spacingXL),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        showCustomBottomSheet(
                          context,
                          ConfirmationBottomSheet(
                            onConfirm: () {
                              context.read<DeleteUserCubit>().deleteUser();
                            },
                            iconName: "trash-01",
                            titleText: "هل أنت متأكد أنك تريد حذف الحساب؟",
                            subTitleText:
                                "سيتم حذف بياناتك وتقدمك بشكل نهائي، لا يمكن التراجع عن هذا الإجراء.",
                            buttonText1: "لا، إلغاء",
                            buttonText2: "نعم، حذف الحساب",
                            isMainButton: false,
                          ),
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/trash-01.svg',
                            width: 20,
                            height: 20,
                            colorFilter: ColorFilter.mode(context.appColors.borderError, BlendMode.srcIn),
                          ),
                          SizedBox(width: AppSpacing.spacingXS),
                          Text(
                            'حذف الحساب',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: context
                                  .appColors.textErrorPrimary /* Colors-Text-text-error-primary-(600) */,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1.43,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(AppSpacing.spacing2XL, 0, AppSpacing.spacing2XL, AppSpacing.spacing4XL),
        child: MainButton(
          text: "حفظ التعديلات",
          isLoading: _isLoading,
          onTap: () {
            final String? currentUsername = getIt<CacheHelper>().getString(ApiKey.username);
            final String? currentFullname = getIt<CacheHelper>().getString(ApiKey.fullName);
            if (updateProfileUsername.text != currentUsername ||
                updateProfileFullName.text != currentFullname) {
              if (updateProfileFormKey.currentState!.validate()) {
                context.read<UpdateUserCubit>().updateUser(
                      username: updateProfileUsername.text,
                      fullName: updateProfileFullName.text,
                    );
              }
            } else {
              showToast(
                context: context,
                message: "برجاء تغيير اسم المستخدم أو الأسم لحفظ التعديلات",
                isError: true,
              );
            }
          },
        ),
      ),
    );
  }
}
