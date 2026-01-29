import 'package:badihi/core/extensions/app_mode_colors_extension.dart';
import 'package:badihi/core/extensions/extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/presentation/components/custom_app_bar.dart';
import 'package:badihi/presentation/components/custom_text_form_field.dart';
import 'package:badihi/presentation/components/main_button.dart';
import 'package:flutter/material.dart';

class RestorePasswordPage extends StatefulWidget {
  const RestorePasswordPage({super.key});

  @override
  State<RestorePasswordPage> createState() => _RestorePasswordPageState();
}

class _RestorePasswordPageState extends State<RestorePasswordPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppModeColorsExtension>();
    GlobalKey<FormState> restorePasswordFormKey = GlobalKey();
    TextEditingController restorePasswordPassword = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "إنشاء كلمة مرور جديدة",
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          margin: const EdgeInsets.fromLTRB(
            AppSpacing.spacing2XL,
            AppSpacing.spacing2XL,
            AppSpacing.spacing2XL,
            AppSpacing.spacing4XL,
          ),
          child: GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: restorePasswordFormKey,
                  child: CustomTextFormField(
                    controller: restorePasswordPassword,
                    labelText: "كلمة المرور الجديدة*",
                    placeholderText: "",
                    prefixIcon: "assets/images/icons/passcode-lock.svg",
                    isPasswordField: true,
                    fieldname: 'password',
                  ),
                ),
                SizedBox(height: AppSpacing.spacingSM),
                Text(
                  'يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل',
                  style: TextStyle(
                    color: colors!.textTertiary /* Colors-Text-text-tertiary_hover */,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.43,
                  ),
                ),
                Spacer(),
                MainButton(
                    text: "تأكيد كلمة المرور الجديدة",
                    isLoading: _isLoading,
                    onTap: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 2));

                      setState(() => _isLoading = false);
                      // if (_formKey.currentState!.validate()) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(content: Text('Form is valid!')),
                      //   );
                      // }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
