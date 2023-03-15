import 'package:flutter/material.dart';

class AppColors {
  //Global colors
  static const Color brandPrimaryDefault = Color(0xFF00FF00);
  static const Color brandPrimaryDark = Color(0xFF008000);
  static const Color brandPrimaryLight = Color(0xFFCCFFCC);
  static const Color brandSecondaryDefault = Color(0xFF00FFFF);
  static const Color brandSecondaryDark = Color(0xFF008080);
  static const Color brandSecondaryLight = Color(0xFFCCFFFF);

  static const Color brandTertiary = Color(0xFF191919);
  static const LinearGradient brandGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Color(0xFF00FF00), Color(0xFF00FFFF)],
  );

  static const Color alertSuccessDark = Color(0xFF008000);
  static const Color alertSuccessLight = Color(0xFF00FF00);
  static const Color alertInformationDark = Color(0xFF008080);
  static const Color alertInformationLight = Color(0xFF00FFFF);
  static const Color alertWarningDark = Color(0xFFAF5400);
  static const Color alertWarningLight = Color(0xFFFFB26B);
  static const Color alertErrorDark = Color(0xFF8F0A00);
  static const Color alertErrorLight = Color(0xFFFF6B6B);

  static const Color white = Color(0xFFFFFFFF);
  static const Color greyLight100 = Color(0xFFF0F0F0);
  static const Color greyLight200 = Color(0xFFE0E0E0);
  static const Color greyLight300 = Color(0xFFD1D1D1);
  static const Color greyLight400 = Color(0xFFC2C2C2);
  static const Color greyLight500 = Color(0xFFB3B3B3);
  static const Color greyLight600 = Color(0xFFA3A3A3);
  static const Color greyLight700 = Color(0xFF949494);

  static const Color grey = Color(0xFF858585);
  static const Color greyDark100 = Color(0xFF757575);
  static const Color greyDark200 = Color(0xFF666666);
  static const Color greyDark300 = Color(0xFF575757);
  static const Color greyDark400 = Color(0xFF474747);
  static const Color greyDark500 = Color(0xFF383838);
  static const Color greyDark600 = Color(0xFF292929);
  static const Color greyDark700 = Color(0xFF191919);

  //Variables
  static const Color appBodyPrimaryBg = white;
  static const Color appBodySecondaryBg = Color(0xFFF6F6F6);

  static const Color appSectionDefaultBg = Colors.transparent;
  static const Color appSectionPrimaryBg = AppColors.greyLight100;
  static const Color appSectionSecondaryBg = AppColors.brandPrimaryDefault;
  static const Color appSectionTertiaryBg = AppColors.greyDark600;

  static const Color appTextPrimary = greyDark700;
  static const Color appTextSecondary = grey;
  static const Color appTextTertiary = white;

  static const Color appIconPrimary = brandPrimaryDefault;
  static const Color appIconWhite = white;
  static const Color appIconBlack = greyDark700;

  static const Color appLinkPrimary = alertSuccessDark;

  static const Color buttonPrimaryDefaultBg = brandPrimaryDefault;
  static const Color buttonPrimaryHoverBg = alertSuccessDark;
  static const Color buttonPrimaryDisabledBg = greyLight200;
  static const Color buttonPrimaryDefaultLabel = greyDark700;
  static const Color buttonPrimaryHoverLabel = white;
  static const Color buttonPrimaryDisabledLabel = greyDark300;
  static const Color buttonPrimaryDefaultIcon = greyDark700;
  static const Color buttonPrimaryHoverIcon = white;
  static const Color buttonPrimaryDisabledIcon = greyDark300;

  static const Color buttonSecondaryDefaultBg = greyDark700;
  static const Color buttonSecondaryHoverBg = greyDark700;
  static const Color buttonSecondaryDisabledBg = greyLight200;
  static const Color buttonSecondaryDefaultLabel = brandPrimaryDefault;
  static const Color buttonSecondaryHoverLabel = brandPrimaryLight;
  static const Color buttonSecondaryDisabledLabel = greyDark300;
  static const Color buttonSecondaryDefaultIcon = brandPrimaryDefault;
  static const Color buttonSecondaryHoverIcon = brandPrimaryLight;
  static const Color buttonSecondaryDisabledIcon = greyDark300;

  static const Color buttonTertiaryDefaultBg = white;
  static const Color buttonTertiaryHoverBg = brandPrimaryLight;
  static const Color buttonTertiaryDisabledBg = greyLight200;
  static const Color buttonTertiaryDefaultLabel = greyDark700;
  static const Color buttonTertiaryHoverLabel = greyDark700;
  static const Color buttonTertiaryDisabledLabel = greyDark300;
  static const Color buttonTertiaryDefaultIcon = greyDark700;
  static const Color buttonTertiaryHoverIcon = brandPrimaryDark;
  static const Color buttonTertiaryDisabledIcon = greyDark300;

  static const Color buttonOutlinedDefaultBg = white;
  static const Color buttonOutlinedHoverBg = greyLight100;
  static const Color buttonOutlinedDisabledBg = white;
  static const Color buttonOutlinedDefaultBorder = greyDark600;
  static const Color buttonOutlinedHoverBorder = greyDark600;
  static const Color buttonOutlinedDisabledBorder = grey;
  static const Color buttonOutlinedDefaultLabel = greyDark700;
  static const Color buttonOutlinedHoverLabel = greyDark700;
  static const Color buttonOutlinedDisabledLabel = greyDark200;
  static const Color buttonOutlinedDefaultIcon = brandPrimaryDark;
  static const Color buttonOutlinedHoverIcon = brandPrimaryDark;
  static const Color buttonOutlinedDisabledIcon = greyDark300;

  static const Color buttonTextOnlyDefaultBg = Colors.transparent;
  static const Color buttonTextOnlyHoverBg = brandPrimaryLight;
  static const Color buttonTextOnlyDisabledBg = Colors.transparent;
  static const Color buttonTextOnlyDefaultBorder = Colors.transparent;
  static const Color buttonTextOnlyHoverBorder = Colors.transparent;
  static const Color buttonTextOnlyDisabledBorder = Colors.transparent;
  static const Color buttonTextOnlyDefaultLabel = greyDark700;
  static const Color buttonTextOnlyHoverLabel = greyDark700;
  static const Color buttonTextOnlyDisabledLabel = greyDark200;
  static const Color buttonTextOnlyDefaultIcon = brandPrimaryDark;
  static const Color buttonTextOnlyHoverIcon = brandPrimaryDark;
  static const Color buttonTextOnlyDisabledIcon = greyDark300;

  static const Color inputDefaultBorder = greyLight400;
  static const Color inputActiveBorder = brandSecondaryLight;
  static const Color inputDisabledBorder = greyLight400;
  static const Color inputDefaultBg = white;
  static const Color inputActiveBg = white;
  static const Color inputDisabledBg = greyLight100;
  static const Color inputPlaceholderLabel = greyDark700;
  static const Color inputDefaultLabel = greyDark700;
  static const Color inputActiveLabel = greyDark700;
  static const Color inputFocusLabel = greyDark700;
  static const Color inputDisabledLabel = greyDark700;
  static const Color inputDefaultIcon = greyDark700;

  static const Color inputValidationSuccessBorder = brandPrimaryDefault;
  static const Color inputValidationSuccessActiveBorder = brandPrimaryDark;
  static const Color inputValidationSuccessDisabledBorder = greyLight300;
  static const Color inputValidationSuccessDefaultBg = white;
  static const Color inputValidationSuccessActiveBg = white;
  static const Color inputValidationSuccessDisabledBg = greyLight100;
  static const Color inputValidationSuccessPlaceholderLabel = brandPrimaryDark;
  static const Color inputValidationSuccessDefaultLabel = greyDark700;
  static const Color inputValidationSuccessActiveLabel = greyDark700;
  static const Color inputValidationSuccessFocusLabel = greyDark700;
  static const Color inputValidationSuccessDisabledLabel = greyDark200;
  static const Color inputValidationSuccessIcon = brandPrimaryDark;

  static const Color inputValidationErrorDefaultBorder = alertErrorLight;
  static const Color inputValidationErrorActiveBorder = alertErrorDark;
  static const Color inputValidationErrorDisabledBorder = greyLight300;
  static const Color inputValidationErrorDefaultBg = white;
  static const Color inputValidationErrorActiveBg = white;
  static const Color inputValidationErrorDisabledBg = greyLight100;
  static const Color inputValidationErrorPlaceholderLabel = alertErrorDark;
  static const Color inputValidationErrorDefaultLabel = greyDark700;
  static const Color inputValidationErrorActiveLabel = greyDark700;
  static const Color inputValidationErrorFocusLabel = greyDark700;
  static const Color inputValidationErrorDisabledLabel = greyDark200;
  static const Color inputValidationErrorIcon = alertErrorDark;
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    var tmpHexColorString = hexColorString.replaceAll('#', '');
    if (tmpHexColorString.length == 6) {
      tmpHexColorString = '0xFF$tmpHexColorString';
    } else {
      tmpHexColorString = '0x$tmpHexColorString';
    }
    return Color(int.parse(tmpHexColorString));
  }
}
