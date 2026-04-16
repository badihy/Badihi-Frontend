import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:flutter/material.dart';

void showCustomBottomSheet(BuildContext context, Widget content) {
  showModalBottomSheet(
    isScrollControlled: true, // Make the bottom sheet stretchable based on content
    showDragHandle: false, // Disable the default drag handle
    context: context,
    builder: (BuildContext context) {
      return ModalBottomSheet(content: content);
    },
  );
  // ).whenComplete(() {
  // if (context.read<UserCubit>().isCardIndexSelected()) {
  // Reset bottom sheet state when closed
  // context.read<UserCubit>().setBottomSheetState(false);
  // Reset selected card state when closed
  // context.read<UserCubit>().setSelectedCardByIndex(null);
  // }
  // });
}

class ModalBottomSheet extends StatelessWidget {
  final Widget content;
  ModalBottomSheet({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(AppSpacing.spacingXL, 14, AppSpacing.spacingXL, 20),
        decoration: BoxDecoration(
          color: context.appColors.bgPrimary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Ensures the Column sizes according to content
          children: [
            // Custom drag handle
            GestureDetector(
              onVerticalDragUpdate: (details) {
                // Optional: Handle drag movement (if needed)
              },
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(top: 8, bottom: 30),
                  width: 55,
                  height: 8,
                  decoration: ShapeDecoration(
                    color: context.appColors.fgDisabledSubtle,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ),
            /* ---------- Start Your Bottom Sheet Content Here ---------- */
            content,
            /* ---------- End Your Bottom Sheet Content Here ------------ */
          ],
        ),
      ),
    );
  }
}
