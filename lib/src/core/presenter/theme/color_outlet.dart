import 'dart:ui';

abstract class ColorOutlet {
  //#region Colors
  static const Color primary = Color(0xFF111114);
  static const Color secondary = Color(0xFF7988A0);
  static const Color accent = Color(0xFFFF4977);
  static const Color secondaryLight = Color(0xFFEBF2FD);

  //#endregion

  //#region status colors
  static const Color taskOnTime = Color(0xFF7988A0);
  static const Color taskLate = Color(0xFFFFD663);
  static const Color taskVeryLate = Color(0xFFFF4977);
  static const Color taskError = Color(0xFFCC4B27);

  //#endregion

  //#region splash inkwell
  static const Color onSelection = Color(0x0affffff);

  //#endregion
}
