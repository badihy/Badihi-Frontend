import 'package:badihi/core/extensions/app_mode_colors_extension.dart';
import 'package:badihi/core/extensions/extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/cubit/auth/forget_password_cubit.dart';
import 'package:badihi/cubit/auth/login_cubit.dart';
import 'package:badihi/cubit/auth/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final String placeholderText;
  final String prefixIcon;
  final String? suffixIcon;
  final String fieldname;
  final bool isPasswordField;
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.placeholderText,
    required this.prefixIcon,
    this.suffixIcon,
    this.fieldname = 'email',
    this.isPasswordField = false,
    required this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscured = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();

    // Clear error as soon as user types
    widget.controller.addListener(() {
      if (_hasError) {
        setState(() => _hasError = false);
      }
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  // Validators
  String? emailValidator(String? value) {
    // Get register cubit state for checking email errors
    final registerState = context.read<RegisterCubit>().state; // rebuilds on state change
    final forgetPasswordState = context.read<ForgetPasswordCubit>().state; // rebuilds on state change
    if (value == null || value.isEmpty) return 'برجاء إدخال البريد الإلكتروني';
    if (!value.isValidEmail) return 'تأكد من إدخال بريد إلكتروني صحيح';
    // Search for better way to handle this error messages
    if (registerState is RegisterFailure && registerState.errMessage.startsWith('D')) {
      return 'هذا البريد الإلكتروني مستخدم بالفعل';
    }
    if (forgetPasswordState is ForgetPasswordFailure &&
        (forgetPasswordState.errMessage.startsWith('C') || forgetPasswordState.errMessage.startsWith('U'))) {
      return 'البريد الإلكتروني غير مسجل';
    }

    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'برجاء إدخال كلمة المرور';
    if (!value.isValidPassword) return 'يجب أن تكون كلمة المرور 8 أحرف على الأقل';
    return null;
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) return 'يرجى إدخال الاسم';
    if (!value.isValidName) return 'تأكد من إدخال إسم صحيح';
    return null;
  }

  // Select validator based on fieldname
  String? Function(String?)? getValidator() {
    switch (widget.fieldname) {
      case 'email':
        return emailValidator;
      case 'password':
        return passwordValidator;
      case 'name':
        return nameValidator;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppModeColorsExtension>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            color: colors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.43,
          ),
        ),
        SizedBox(height: AppSpacing.spacingSM),
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              setState(() {
                _hasError = true;
              });
            }
          },
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.isPasswordField && _isObscured,
            validator: getValidator() != null
                ? (value) {
                    final result = getValidator()!(value);
                    if (_hasError != (result != null)) {
                      setState(() => _hasError = result != null);
                    }
                    return result;
                  }
                : null,
            decoration: InputDecoration(
              labelText: widget.placeholderText,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelStyle: TextStyle(
                color: colors.textPlaceholder,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
              errorStyle: TextStyle(
                color: colors.textErrorPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.43,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: _hasError ? colors.borderErrorSubtle : colors.borderPrimary),
                borderRadius: BorderRadius.circular(AppRadius.radiusMD),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: colors.borderBrand),
                borderRadius: BorderRadius.circular(AppRadius.radiusMD),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: colors.borderErrorSubtle),
                borderRadius: BorderRadius.circular(AppRadius.radiusMD),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: colors.textErrorPrimary),
                borderRadius: BorderRadius.circular(AppRadius.radiusMD),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  widget.prefixIcon,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(colors.fgQuaternary, BlendMode.srcIn),
                ),
              ),
              suffixIcon: _hasError
                  ? Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        "assets/images/icons/alert-circle.svg",
                        width: 16,
                        height: 16,
                        colorFilter: ColorFilter.mode(colors.fgErrorSecondary, BlendMode.srcIn),
                      ),
                    )
                  : widget.isPasswordField
                      ? IconButton(
                          icon: Icon(
                            _isObscured ? Icons.visibility_off : Icons.visibility,
                            color: AppColors.gray500,
                            size: 18,
                          ),
                          onPressed: () {
                            setState(() => _isObscured = !_isObscured);
                          },
                        )
                      : null,
              contentPadding: EdgeInsets.zero,
            ),
            cursorColor: colors.textPrimary,
            style: TextStyle(
              color: colors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.50,
            ),
          ),
        ),
      ],
    );
  }
}
