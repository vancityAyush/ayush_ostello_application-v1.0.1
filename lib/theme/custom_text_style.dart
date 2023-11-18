import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeAvenirBlack900 =>
      theme.textTheme.bodyLarge!.avenir.copyWith(
        color: appTheme.black900,
        fontSize: 17.fSize,
      );
  // Headline text style
  static get headlineLargeAvenir =>
      theme.textTheme.headlineLarge!.avenir.copyWith(
        fontSize: 30.fSize,
        fontWeight: FontWeight.w800,
      );
  // Label text style
  static get labelLarge13 => theme.textTheme.labelLarge!.copyWith(
        fontSize: 13.fSize,
      );
  static get labelLargeAvenirRed500 =>
      theme.textTheme.labelLarge!.avenir.copyWith(
        color: appTheme.red500,
      );
  static get labelLargeBluegray500 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray500,
      );
  // Title text style
  static get titleMedium16 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
      );
  static get titleMediumAvenir => theme.textTheme.titleMedium!.avenir.copyWith(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumAvenirBlack900 =>
      theme.textTheme.titleMedium!.avenir.copyWith(
        color: appTheme.black900,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleMediumAvenirOnPrimary =>
      theme.textTheme.titleMedium!.avenir.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleMediumOnPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get titleMediumRed500 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.red500,
        fontSize: 16.fSize,
      );
  static get titleSmallAvenirPrimary =>
      theme.textTheme.titleSmall!.avenir.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallGray400 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray400,
      );
  static get titleSmallGray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallGreenA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.greenA700,
        fontWeight: FontWeight.w700,
      );
}

extension on TextStyle {
  TextStyle get avenir {
    return copyWith(
      fontFamily: 'Avenir',
    );
  }

  TextStyle get plusJakartaSans {
    return copyWith(
      fontFamily: 'Plus Jakarta Sans',
    );
  }
}
