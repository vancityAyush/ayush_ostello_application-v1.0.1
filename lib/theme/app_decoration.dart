import 'package:flutter/material.dart';
import 'package:ayush_s_application5/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA70001,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // Outline decorations
  static BoxDecoration get outlinePrimaryContainer => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primaryContainer,
          width: 2.h,
        ),
      );
  static BoxDecoration get outlinePrimaryContainer1 => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primaryContainer,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder29 => BorderRadius.circular(
        29.h,
      );

  // Custom borders
  static BorderRadius get customBorderTL48 => BorderRadius.vertical(
        top: Radius.circular(48.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder14 => BorderRadius.circular(
        14.h,
      );
  static BorderRadius get roundedBorder18 => BorderRadius.circular(
        18.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
