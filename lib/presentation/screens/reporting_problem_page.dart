import 'dart:io';

import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/cubit/reports/report_problem_cubit.dart';
import 'package:badihi/presentation/components/horizontal_progress_bar.dart';
import 'package:badihi/presentation/components/custom_app_bar.dart';
import 'package:badihi/presentation/components/custom_text_form_field.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:badihi/presentation/components/notification_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ReportingProblemPage extends StatefulWidget {
  const ReportingProblemPage({super.key});

  @override
  State<ReportingProblemPage> createState() => _ReportingProblemPageState();
}

class _ReportingProblemPageState extends State<ReportingProblemPage> {
  bool _isLoading = false;
  final GlobalKey<FormState> reportingProblemFormKey = GlobalKey();
  final TextEditingController reportingProblemSubject = TextEditingController();
  final TextEditingController reportingProblemMessage = TextEditingController();

  double uploadProgress = 0;
  File? selectedImage;
  String? fileName;
  int? fileSizeInBytes;

  Future<void> pickImage(BuildContext context) async {
    const int maxFileSizeInBytes = 2 * 1024 * 1024; // 2 MB

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
        showToast(context: context, message: 'حجم الصورة يجب ألا يزيد عن 2 ميجابايت', isError: true);
        return;
      }

      setState(() {
        selectedImage = file;
        fileName = name;
        fileSizeInBytes = (size / 1024).toInt();
        uploadProgress = 0;
      });
      simulateUpload();
    } catch (e) {
      showToast(context: context, message: 'حدث خطأ أثناء اختيار الصورة', isError: true);
    }
  }

  Future<void> simulateUpload() async {
    setState(() => uploadProgress = 0);

    await Future.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;
    setState(() => uploadProgress = 0.3);

    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    setState(() => uploadProgress = 0.7);

    await Future.delayed(const Duration(milliseconds: 700));
    if (!mounted) return;
    setState(() => uploadProgress = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: "الإبلاغ عن مشكلة"),
      body: Container(
        margin: const EdgeInsets.fromLTRB(
          AppSpacing.spacing2XL,
          AppSpacing.spacing2XL,
          AppSpacing.spacing2XL,
          AppSpacing.spacing4XL,
        ),
        child: BlocListener<ReportProblemCubit, ReportProblemState>(
          listener: (context, state) {
            setState(() {
              _isLoading = false;
            });
            if (state is ReportProblemSuccess) {
              showToast(context: context, message: "تم إرسال المشكلة بنجاح");
              reportingProblemSubject.clear();
              reportingProblemMessage.clear();
            } else if (state is ReportProblemFailure) {
              showToast(context: context, message: state.errMessage, isError: true);
            } else if (state is ReportProblemLoading) {
              setState(() {
                _isLoading = true;
              });
            }
          },
          child: ListView(
            children: [
              Text(
                'أدخل عنوان المشكلة ووصفها، ويمكنك إرفاق صورة، وسيتم التواصل معك عبر البريد الإلكتروني.',
                style: TextStyle(
                  color: context.appColors.textSecondary /* Colors-Text-text-secondary-(700) */,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 1.56,
                ),
              ),
              SizedBox(height: AppSpacing.spacing3XL),
              Form(
                key: reportingProblemFormKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      labelText: "العنوان*",
                      placeholderText: "اكتب عنوان المشكلة",
                      fieldname: "problemTitle",
                      controller: reportingProblemSubject,
                    ),
                    SizedBox(height: AppSpacing.spacingXL),
                    CustomTextFormField(
                      labelText: "الوصف*",
                      placeholderText: "اكتب وصف المشكلة",
                      fieldname: "problemDescription",
                      controller: reportingProblemMessage,
                      isTextArea: true,
                    ),
                    SizedBox(height: AppSpacing.spacingXL),
                    Material(
                      clipBehavior: Clip.antiAlias,
                      color: context.appColors.bgPrimary,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: context.appColors.borderSecondary,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () => pickImage(context),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: context.appColors.bgPrimary /* Colors-Background-bg-primary */,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color:
                                          context.appColors.borderPrimary /* Colors-Border-border-primary */,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x0C0A0C12),
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/icons/upload-cloud-02.svg',
                                  width: 20,
                                  height: 20,
                                  colorFilter:
                                      ColorFilter.mode(context.appColors.fgSecondary, BlendMode.srcIn),
                                ),
                              ),
                              SizedBox(height: AppSpacing.spacingLG),
                              Text(
                                'تحميل صورة للمشكلة',
                                style: TextStyle(
                                  color: context.appColors
                                      .textBrandSecondary /* Colors-Text-text-brand-secondary-(700) */,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  height: 1.43,
                                ),
                              ),
                              SizedBox(height: AppSpacing.spacingXS),
                              Text(
                                'PNG, JPG أو JPEG بحد أقصى 2 ميجا للملف',
                                style: TextStyle(
                                  color: context.appColors.textTertiary /* Colors-Text-text-tertiary-(600) */,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 1.50,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: AppSpacing.spacingXL),
                    // Upload file progress bar
                    selectedImage == null
                        ? SizedBox()
                        : Container(
                            padding: const EdgeInsets.all(AppSpacing.spacingXL),
                            decoration: ShapeDecoration(
                              color: context.appColors.bgPrimary /* Colors-Background-bg-primary */,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color:
                                      context.appColors.borderSecondary /* Colors-Border-border-secondary */,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/page.svg',
                                      width: 32,
                                      height: 40,
                                      colorFilter:
                                          ColorFilter.mode(context.appColors.borderPrimary, BlendMode.srcIn),
                                    ),
                                    Positioned(
                                      left: -5,
                                      top: 15,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                                        decoration: ShapeDecoration(
                                          color: context.appColors.fgBrandPrimary /* Colors-Brand-600 */,
                                          shape:
                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                                        ),
                                        child: Text(
                                          'IMG',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: context.appColors.fgWhite /* Colors-Foreground-fg-white */,
                                            fontSize: 10,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: AppSpacing.spacingLG),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            fileName ?? "",
                                            style: TextStyle(
                                              color: context.appColors
                                                  .textSecondary /* Colors-Text-text-secondary-(700) */,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              height: 1.43,
                                            ),
                                          ),
                                          Material(
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectedImage = null;
                                                  fileName = null;
                                                  // fileSize = null;
                                                });
                                              },
                                              child: SvgPicture.asset(
                                                'assets/images/icons/trash-01.svg',
                                                width: 16,
                                                height: 16,
                                                colorFilter: ColorFilter.mode(
                                                    context.appColors.fgQuaternary, BlendMode.srcIn),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      uploadProgress == 1.0
                                          ? Row(
                                              children: [
                                                Text(
                                                  '$fileSizeInBytes كيلو بايت من $fileSizeInBytes كيلو بايت',
                                                  style: TextStyle(
                                                    color: context.appColors
                                                        .textTertiary /* Colors-Text-text-tertiary-(600) */,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.43,
                                                  ),
                                                ),
                                                SizedBox(width: AppSpacing.spacingMD),
                                                Container(
                                                  height: 20,
                                                  width: 1,
                                                  color: context.appColors.borderPrimary,
                                                ),
                                                SizedBox(width: AppSpacing.spacingMD),
                                                SvgPicture.asset(
                                                  'assets/images/icons/check-circle.svg',
                                                  width: 16,
                                                  height: 16,
                                                  colorFilter: ColorFilter.mode(
                                                      context.appColors.fgSuccessPrimary, BlendMode.srcIn),
                                                ),
                                                SizedBox(width: AppSpacing.spacingXS),
                                                Text(
                                                  'اكتمل',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: context.appColors
                                                        .textSuccessPrimary /* Colors-Text-text-success-primary-(600) */,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.43,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : SizedBox(),
                                      HorizontalProgressBar(progress: uploadProgress)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(AppSpacing.spacing2XL, 0, AppSpacing.spacing2XL, AppSpacing.spacing4XL),
        child: MainButton(
          text: "إرسال",
          isLoading: _isLoading,
          onTap: () {
            if (reportingProblemFormKey.currentState!.validate()) {
              context.read<ReportProblemCubit>().reportProblem(
                    subject: reportingProblemSubject.text,
                    message: reportingProblemMessage.text,
                    image: selectedImage,
                  );
            }
          },
        ),
      ),
    );
  }
}
