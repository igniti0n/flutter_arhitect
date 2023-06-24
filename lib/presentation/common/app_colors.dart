import 'package:flutter/material.dart';

class AppColors {
  // Globals
  static final Color primaryPlus2 = HexColor.fromHex('#55800A');
  static final Color primaryPlus1 = HexColor.fromHex('#75AF0E');
  static final Color primary = HexColor.fromHex('#ACEF34');
  static final Color primaryMinus1 = HexColor.fromHex('#BFF363');
  static final Color primaryMinus2 = HexColor.fromHex('#D2F792');
  static final Color primaryMinus3 = HexColor.fromHex('#E6FAC1');

  static final Color secondaryPlus2 = HexColor.fromHex('#AD1455');
  static final Color secondaryPlus1 = HexColor.fromHex('#DB1A6B');
  static final Color secondary = HexColor.fromHex('#E94187');
  static final Color secondaryMinus1 = HexColor.fromHex('#EE6DA3');
  static final Color secondaryMinus2 = HexColor.fromHex('#F39BC0');
  static final Color secondaryMinus3 = HexColor.fromHex('#F9C8DD');

  //Text
  static final Color text1 = HexColor.fromHex('#151717');
  static final Color text2 = HexColor.fromHex('#2B2E25');
  static final Color text3 = HexColor.fromHex('#737373');
  static final Color text4 = HexColor.fromHex('#A7A7A7');
  static final Color text5 = HexColor.fromHex('#C7C7D1');
  static final Color white = HexColor.fromHex('#ffffff');
  static final Color orange = HexColor.fromHex('#F2994A');

  //Border
  static final Color border1 = HexColor.fromHex('#93DF0B');
  static final Color border2 = HexColor.fromHex('#85B927');
  static final Color border3 = HexColor.fromHex('#5A6448');
  static final Color border4 = HexColor.fromHex('#B7BAB2');
  static final Color border5 = HexColor.fromHex('#94988D');
  static final Color border6 = HexColor.fromHex('#61645E');
  static final Color border7 = HexColor.fromHex('#F4F8F7');
  static final Color cardBorder =
      HexColor.fromHex('#35333A'); //Color.fromRGBO(48, 248, 248, 0.08);

  //Icon
  static final Color icon1 = HexColor.fromHex('#93DF0B');
  static final Color icon2 = HexColor.fromHex('#85B927');
  static final Color icon3 = HexColor.fromHex('#5A6448');
  static final Color icon4 = HexColor.fromHex('#B7BAB2');
  static final Color icon5 = HexColor.fromHex('#94988D');
  static final Color icon6 = HexColor.fromHex('#61645E');
  static final Color icon7 = HexColor.fromHex('#F4F8F7');
  static final Color iconRed = HexColor.fromHex('#EB5757');

  //Background
  static final Color background1 = HexColor.fromHex('#16141B');
  static final Color background2 = HexColor.fromHex('#1F1D24');
  static final Color background3 = HexColor.fromHex('#24222A');
  static final Color background4 = HexColor.fromHex('#2A282F');
  static final Color background5 = HexColor.fromHex('#2F2D35');
  static final Color background6 = HexColor.fromHex('#F1F1F4');
  static final Color background7 = HexColor.fromHex('#FCFCFD');

  //Utility
  static final Color success = HexColor.fromHex('#1ED286');
  static final Color successMinus1 = HexColor.fromHex('#6CEAB5');
  static final Color successMinus2 = HexColor.fromHex('#C5F7E2');
  static final Color error = HexColor.fromHex('#E2412B');
  static final Color errorMinus1 = HexColor.fromHex('#F37C6C');
  static final Color errorMinus2 = HexColor.fromHex('#F7CBC5');
  static final Color warning = HexColor.fromHex('#FDAE37');
  static final Color warningMinus1 = HexColor.fromHex('#FED69A');
  static final Color warningMinus2 = HexColor.fromHex('#FFEBCC');
  static final Color info = HexColor.fromHex('#4DA2F0');
  static final Color infoMinus1 = HexColor.fromHex('#AAD3F8');
  static final Color infoMinus2 = HexColor.fromHex('#D9EBFC');

  static const Color skeletonDark = Color(0x48fefefe);

  static final Color testColor = HexColor.fromHex('#000000');
  static final Color darkBackground = HexColor.fromHex('#211F23');
  static final Color greyBackground = HexColor.fromHex('#282729');
  static final Color primaryDeactivated = HexColor.fromHex('#5A6448');
  static final Color darkTransparent = HexColor.fromHex('#131312');
  static final Color darkChipBackground = HexColor.fromHex('#f48f70d');
  static final Color darkFacilityTile = HexColor.fromHex('#EDEFF2');
  static const Color fillTransparent = Color.fromRGBO(244, 248, 247, 0.05);
  static const Color red = Color.fromRGBO(235, 87, 87, 1);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    final hexString = hexColorString;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
/*     var tmpHexColorString = hexColorString.replaceAll('#', '');
    if (tmpHexColorString.length == 6) {
      tmpHexColorString = '0xFF$tmpHexColorString';
    } else {
      tmpHexColorString = '0x$tmpHexColorString';
    }
    return Color(int.parse(tmpHexColorString)); */
  }
}
