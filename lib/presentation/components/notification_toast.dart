import 'package:badihi/core/extensions/app_mode_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toastification/toastification.dart';

void showToast({
  required BuildContext context,
  required String message,
  bool isError = false,
}) {
  final colors = Theme.of(context).extension<AppModeColorsExtension>();

  toastification.show(
    padding: const EdgeInsets.all(0),
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.flat,
    backgroundColor: colors!.bgPrimary,
    title: Text(
      message,
      style: TextStyle(
        color: colors.fgPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.43,
      ),
    ),
    alignment: Alignment.topCenter,
    borderSide: BorderSide(color: colors.borderSecondaryAlt),
    borderRadius: BorderRadius.circular(12),
    icon: Padding(
      padding: const EdgeInsets.all(12),
      child: SvgPicture.asset(
        isError ? "assets/images/icons/alert-triangle.svg" : "assets/images/icons/check.svg",
        width: 16,
        height: 16,
        colorFilter: ColorFilter.mode(
          isError ? colors.fgErrorSecondary : colors.fgSuccessSecondary,
          BlendMode.srcIn,
        ),
      ),
    ),
    closeButton: ToastCloseButton(
      buttonBuilder: (context, closeToast) {
        return IconButton(
          icon: Icon(
            Icons.close,
            size: 16,
            color: colors.fgQuaternary,
          ),
          onPressed: closeToast,
        );
      },
    ),
    dragToClose: true,
  );
}
