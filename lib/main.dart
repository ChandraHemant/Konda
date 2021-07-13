import 'dart:async';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konda_app/Screens/Intro.dart';
import 'package:konda_app/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Container(
      color: Colors.transparent,
      child: Text(
        details.toString(),
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.transparent,
        ),
      ),
    );
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(DarkPrimaryColor);
    return ThemeProvider(

      initTheme: DarkTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{
//----------------------------------------------------------------------------------------------//
  void handleTimeout() async {

    Navigator.pushReplacement( context,  MaterialPageRoute(builder: (context)=>OnboardingScreenOne()));

  }
//----------------------------------------------------------------------------------------------//
  startTimeout() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, handleTimeout);
  }
//----------------------------------------------------------------------------------------------//
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    startTimeout();
  }
//----------------------------------------------------------------------------------------------//

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/images/logos.png", height: 100.0,),

                    SizedBox(height: 30.0,),

                    SpinKitThreeBounce(color: Colors.blue),
                  ],
                ),
                )
              ],
            ),
          );
        },
      ),
    );

  }

}
