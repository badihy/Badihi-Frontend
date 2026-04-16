import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExpandedFaq extends StatefulWidget {
  final String question;
  final String answer;
  final bool isExpanded;
  final bool showDivider;
  const ExpandedFaq({
    super.key,
    required this.question,
    required this.answer,
    this.isExpanded = false,
    this.showDivider = false,
  });

  @override
  State<ExpandedFaq> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ExpandedFaq> {
  bool _isExpanded = false;
  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        margin: EdgeInsets.all(AppSpacing.spacingMD),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.question,
                    style: TextStyle(
                      color: context.appColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.50,
                    ),
                  ),
                ),
                AnimatedRotation(
                  turns: _isExpanded ? .5 : 0.0, // 180 degrees when expanded
                  duration: const Duration(milliseconds: 300),
                  child: SvgPicture.asset(
                    _isExpanded
                        ? 'assets/images/icons/plus-circle.svg'
                        : 'assets/images/icons/minus-circle.svg',
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(context.appColors.fgQuaternary, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
            // Animated expansion
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: ConstrainedBox(
                constraints: _isExpanded ? const BoxConstraints() : const BoxConstraints(maxHeight: 0),
                child: Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.spacingXS),
                  child: Text(
                    widget.answer,
                    style: TextStyle(
                      color: context.appColors.textTertiary,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.50,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
