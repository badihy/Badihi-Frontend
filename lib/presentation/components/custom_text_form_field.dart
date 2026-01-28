import 'package:badihy/core/extensions/app_mode_colors_extension.dart';
import 'package:badihy/core/theme/app_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final String placeholderText;
  final String prefixIcon;
  final String? suffixIcon;
  final String? Function(String?)? validator;
  final bool isPasswordField;
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.placeholderText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.validator,
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

    // Clear error as soon as user starts typing
    widget.controller.addListener(() {
      if (_hasError) {
        setState(() {
          _hasError = false;
        });
      }
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppModeColorsExtension>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label above field
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

        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPasswordField && _isObscured,
          validator: widget.validator != null
              ? (value) {
                  final result = widget.validator!(value);
                  setState(() {
                    _hasError = result != null;
                  });
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
              borderSide: BorderSide(
                width: 1,
                color: colors.borderPrimary,
              ),
              borderRadius: BorderRadius.circular(AppRadius.radiusMD),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: colors.borderBrand,
              ),
              borderRadius: BorderRadius.circular(AppRadius.radiusMD),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: colors.borderErrorSubtle,
              ),
              borderRadius: BorderRadius.circular(AppRadius.radiusMD),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: colors.textErrorPrimary,
              ),
              borderRadius: BorderRadius.circular(AppRadius.radiusMD),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                widget.prefixIcon,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  colors.fgQuaternary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            suffixIcon: _hasError
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      "assets/images/icons/alert-circle.svg",
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(
                        colors.fgErrorSecondary,
                        BlendMode.srcIn,
                      ),
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
                          setState(() {
                            _isObscured = !_isObscured;
                          });
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
      ],
    );
  }
}
