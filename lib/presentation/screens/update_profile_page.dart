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
  File? _selectedImage; // Store selected image without uploading

  final GlobalKey<FormState> updateProfileFormKey = GlobalKey();
  final TextEditingController updateProfileUsername = TextEditingController();
  final TextEditingController updateProfileFullName = TextEditingController();
  final TextEditingController updateProfileEmail = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current values
    updateProfileUsername.text = getIt<CacheHelper>().getString(ApiKey.username) ?? "";
    updateProfileFullName.text = getIt<CacheHelper>().getString(ApiKey.fullName) ?? "";
    updateProfileEmail.text = getIt<CacheHelper>().getString(ApiKey.email) ?? "";
  }

  @override
  void dispose() {
    updateProfileUsername.dispose();
    updateProfileFullName.dispose();
    updateProfileEmail.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
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

      // Just store the selected image, don't upload yet
      setState(() {
        _selectedImage = file;
      });
    } catch (e) {
      showToast(context: context, message: 'حدث خطأ أثناء اختيار الصورة', isError: true);
    }
  }

  Future<void> _saveProfile() async {
    // Check if there are any changes
    final String? currentUsername = getIt<CacheHelper>().getString(ApiKey.username);
    final String? currentFullname = getIt<CacheHelper>().getString(ApiKey.fullName);

    final bool hasTextChanges =
        (updateProfileUsername.text != currentUsername || updateProfileFullName.text != currentFullname);

    final bool hasImageChange = _selectedImage != null;

    if (!hasTextChanges && !hasImageChange) {
      showToast(
        context: context,
        message: "لم تقم بإجراء أي تغييرات",
        isError: true,
      );
      return;
    }

    // Validate form if there are text changes
    if (hasTextChanges && !updateProfileFormKey.currentState!.validate()) {
      return;
    }

    // Perform updates
    if (hasTextChanges && hasImageChange) {
      // Both text and image need to be updated
      // Option 1: Update both (you need a method that handles both)
      context.read<UpdateUserCubit>().updateUser(
            username: updateProfileUsername.text,
            fullName: updateProfileFullName.text,
          );
      context.read<UploadProfilePhotoCubit>().uploadProfilePhoto(_selectedImage!);
    } else if (hasTextChanges) {
      // Only text changes
      context.read<UpdateUserCubit>().updateUser(
            username: updateProfileUsername.text,
            fullName: updateProfileFullName.text,
          );
    } else if (hasImageChange) {
      // Only image change
      context.read<UploadProfilePhotoCubit>().uploadProfilePhoto(_selectedImage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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

                  // Clear selected image after successful update
                  setState(() {
                    _selectedImage = null;
                  });

                  // Optionally pop back
                  // Navigator.pop(context);
                } else if (state is UpdateUserLoading) {
                  setState(() {
                    _isLoading = true;
                  });
                } else if (state is UpdateUserFailure) {
                  showToast(context: context, message: state.errMessage, isError: true);
                }
              },
            ),
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
                setState(() {
                  _isLoading = false;
                });

                if (state is UploadProfilePhotoSuccess) {
                  showToast(
                    context: context,
                    message: "تم تحديث صورة الملف الشخصي بنجاح",
                  );
                  // Clear selected image after successful upload
                  setState(() {
                    _selectedImage = null;
                  });
                  // Optionally pop back
                  // Navigator.pop(context);
                } else if (state is UploadProfilePhotoLoading) {
                  setState(() {
                    _isLoading = true;
                  });
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
                    // Profile Image Section
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: context.appColors.fgDisabledSubtle,
                                ),
                                borderRadius: BorderRadius.circular(9999),
                              ),
                            ),
                            child: _selectedImage != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(
                                      _selectedImage!,
                                      width: 96,
                                      height: 96,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : getIt<CacheHelper>().getString(ApiKey.profileImage) != ""
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: Image.network(
                                          getIt<CacheHelper>().getString(ApiKey.profileImage) ?? "",
                                          width: 96,
                                          height: 96,
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
                          // Optional: Show indicator that new image is selected
                          if (_selectedImage != null)
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.spacingMD),

                    // Change Image Button
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
                        child: InkWell(
                          onTap: _isLoading ? null : _pickImage,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/icons/edit-05.svg',
                                  width: 20,
                                  height: 20,
                                  colorFilter:
                                      ColorFilter.mode(context.appColors.fgQuaternary_hover, BlendMode.srcIn),
                                ),
                                const SizedBox(width: AppSpacing.spacingXS),
                                Text(
                                  _selectedImage != null ? 'تم اختيار صورة جديدة' : 'تغيير صورة الملف الشخصي',
                                  style: TextStyle(
                                    color: context.appColors.textSecondary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 1.43,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppSpacing.spacing4XL),

                    // Form
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
                          const SizedBox(height: AppSpacing.spacingXL),
                          CustomTextFormField(
                            controller: updateProfileFullName,
                            labelText: 'الاسم',
                            placeholderText: "اكتب اسمك",
                            prefixIcon: "user-01",
                            fieldname: 'name',
                            defaultValue: getIt<CacheHelper>().getString(ApiKey.fullName) ?? "الإسم",
                          ),
                          const SizedBox(height: AppSpacing.spacingXL),
                          CustomTextFormField(
                            controller: updateProfileEmail,
                            labelText: 'البريد الإلكتروني',
                            placeholderText: "example@badihi.com",
                            prefixIcon: "mail-01",
                            fieldname: 'email',
                            isEnabled: false,
                            defaultValue: getIt<CacheHelper>().getString(ApiKey.email) ?? "الإيميل",
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSpacing.spacingSM),

                    Row(
                      children: [
                        Text(
                          'لا يمكنك تغيير البريد الإلكتروني، يمكنك ',
                          style: TextStyle(
                            color: context.appColors.textTertiary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.43,
                          ),
                        ),
                        ContactUsByEmail(btnText: "التواصل معنا"),
                      ],
                    ),

                    const SizedBox(height: AppSpacing.spacingXL),

                    // Delete Account Button
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: _isLoading
                            ? null
                            : () {
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
                            BlocBuilder<DeleteUserCubit, DeleteUserState>(
                              builder: (context, state) {
                                return state is DeleteUserLoading
                                    ? SizedBox(
                                        width: 15,
                                        height: 15,
                                        child: CustomCircularProgressIndicator(),
                                      )
                                    : SvgPicture.asset(
                                        'assets/images/icons/trash-01.svg',
                                        width: 20,
                                        height: 20,
                                        colorFilter:
                                            ColorFilter.mode(context.appColors.borderError, BlendMode.srcIn),
                                      );
                              },
                            ),
                            const SizedBox(width: AppSpacing.spacingXS),
                            Text(
                              'حذف الحساب',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: context.appColors.textErrorPrimary,
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

        // Save Button
        bottomNavigationBar: Container(
          margin: const EdgeInsets.fromLTRB(
              AppSpacing.spacing2XL, 0, AppSpacing.spacing2XL, AppSpacing.spacing4XL),
          child: MainButton(
            text: "حفظ التعديلات",
            isLoading: _isLoading,
            onTap: _saveProfile,
          ),
        ),
      ),
    );
  }
}
