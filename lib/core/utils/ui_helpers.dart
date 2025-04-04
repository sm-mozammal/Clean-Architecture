import 'package:clean_architecture_riverpod/core/constants/app_colors.dart';
import 'package:clean_architecture_riverpod/core/services/navigation_service.dart';
import 'package:clean_architecture_riverpod/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

/// Contains useful constants and helper methods for UI spacing
class UIHelper {
  UIHelper._();

  static double screenWidth() =>
      MediaQuery.of(NavigationService.context).size.width;
  static double screenHeight() =>
      MediaQuery.of(NavigationService.context).size.height;

  /// Vertical spacing (percentage-based)
  static Widget verticalSpaceSmall =
      SizedBox(height: screenHeight() * 0.01); // 1% of screen height
  static Widget verticalSpaceMedium =
      SizedBox(height: screenHeight() * 0.02); // 2% of screen height
  static Widget verticalSpaceMediumLarge =
      SizedBox(height: screenHeight() * 0.025); // 2.5%
  static Widget verticalSpaceSemiLarge =
      SizedBox(height: screenHeight() * 0.04); // 4%
  static Widget verticalSpaceLarge =
      SizedBox(height: screenHeight() * 0.06); // 6%
  static Widget verticalSpaceExtraLarge =
      SizedBox(height: screenHeight() * 0.1); // 10%

  /// Horizontal spacing (percentage-based)
  static Widget horizontalSpaceToSmall =
      SizedBox(width: screenWidth() * 0.01); // 1% of screen width
  static Widget horizontalSpaceSmall =
      SizedBox(width: screenWidth() * 0.02); // 2% of screen width
  static Widget horizontalSpaceMedium =
      SizedBox(width: screenWidth() * 0.04); // 4%
  static Widget horizontalSpaceSemiLarge =
      SizedBox(width: screenWidth() * 0.06); // 6%
  static Widget horizontalSpaceLarge =
      SizedBox(width: screenWidth() * 0.08); // 8%

  /// Custom spacing
  static Widget horizontalSpace(double width) =>
      SizedBox(width: SizeConfig.width(width));
  static Widget verticalSpace(double height) =>
      SizedBox(height: SizeConfig.width(height));

  /// Safe area padding (e.g., for notch areas)
  static double safePadding() =>
      MediaQuery.of(NavigationService.context).padding.top;

  /// Custom divider
  static Widget customDivider({double width = double.infinity}) => Container(
        height: screenHeight() * 0.0006, // Scaled divider height
        color: AppColors.c000000,
        width: width,
      );

  /// Default padding size
  static double defaultPadding() => screenWidth() * 0.05; // 5% of screen width
}
