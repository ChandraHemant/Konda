import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const SpacingUnit = 10;

//colors used in this app
const Color white = Colors.white;
const Color black = Colors.black;
const Color yellow = Color(0xFFFFD54F);

//default app padding
const double appPadding = 20.0;
const DarkPrimaryColor = Color(0xFF212121);
const DarkSecondaryColor = Color(0xFF373737);
const LightPrimaryColor = Color(0xFFFFFFFF);
const LightSecondaryColor = Color(0xFFF3F7FB);
const AccentColor = Color(0xFFFFC107);

final TitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(SpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final CaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(SpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);

final ButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(SpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: DarkPrimaryColor,
);

final DarkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'SFProText',
  primaryColor: DarkPrimaryColor,
  canvasColor: DarkPrimaryColor,
  backgroundColor: DarkSecondaryColor,
  accentColor: AccentColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
        color: LightSecondaryColor,
      ),
  textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: LightSecondaryColor,
        displayColor: LightSecondaryColor,
      ),
);

final LightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'SFProText',
  primaryColor: LightPrimaryColor,
  canvasColor: LightPrimaryColor,
  backgroundColor: LightSecondaryColor,
  accentColor: AccentColor,
  iconTheme: ThemeData.light().iconTheme.copyWith(
        color: DarkSecondaryColor,
      ),
  textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: DarkSecondaryColor,
        displayColor: DarkSecondaryColor,
      ),
);
