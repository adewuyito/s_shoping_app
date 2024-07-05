
import 'package:flutter/material.dart';
import 'package:s_shoping_app/common/extentions/text_extention.dart';
import 'package:s_shoping_app/utils/constants/colors.dart';
import 'package:s_shoping_app/utils/constants/sizes.dart';

import '../../utils/helpers/helper_function.dart';

class SectionWidget extends StatelessWidget {
  final bool withPadding;
  final bool withLabel;
  final String label;
  final String? secondry;
  final List<Widget> children;

  const SectionWidget({
    super.key,
    required this.children,
    this.secondry,
    this.withLabel = false,
    this.label = "",
    this.withPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunctions.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            withPadding ? CSizes.defaultSpacing : CSizes.defaultNoPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          withLabel
              ? Row(
                  children: [
                    label.toText(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: isDark ? CColors.mainBlack : CColors.mainWhite,
                    ),
                    const SizedBox(width: 15),
                    if (secondry != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: CColors.mainBlack,
                        ),
                        child: secondry!.toText(
                          color: CColors.mainWhite,
                          fontSize: 12,
                        ),
                      ),
                  ],
                )
              : const SizedBox(),
          const SizedBox(height: CSizes.defaultSpacing),
          ...children,
        ],
      ),
    );
  }
}
