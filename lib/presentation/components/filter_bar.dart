import 'package:badihi/presentation/models/get_all_categories.dart';
import 'package:flutter/material.dart';
import 'package:badihi/core/extensions/context_extensions.dart';

class FilterBar extends StatelessWidget {
  final List<Map<String, dynamic>> filters;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const FilterBar({
    super.key,
    required this.filters,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isActive = index == selectedIndex;
          final category = filters[index];

          return InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: () => onChanged(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: isActive ? context.appColors.bgBrandPrimary : context.appColors.bgPrimary,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  width: 1,
                  color: isActive ? context.appColors.borderBrandAlt : context.appColors.borderPrimary,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                category.values.last,
                style: TextStyle(
                  color: isActive ? context.appColors.textBrandTertiary : context.appColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
