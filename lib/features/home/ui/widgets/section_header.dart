import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.onTapSeeAll,
  });

  final String title;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: textTheme.titleMedium?.copyWith(fontSize: 22)),
        TextButton(
          onPressed: onTapSeeAll,
          child: Text(context.localizations.seeAll,
              style: textTheme.titleMedium?.copyWith(
                color: AppColors.themeColor,
              )),
        ),
      ],
    );
  }
}
