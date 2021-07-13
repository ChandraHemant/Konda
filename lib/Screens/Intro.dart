import 'package:konda_app/MainMenu.dart';
import 'package:konda_app/Screens/HomeScreen.dart';
import 'package:konda_app/Screens/UserLogin.dart';
import 'package:konda_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:konda_app/Widgets/slanding_clipper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'dart:math' as math;

String initScreen;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

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
            home: OnboardingScreenOne(),
          );
        },
      ),
    );
  }
}


/*<-----------Screen 1----------->*/

class OnboardingScreenOne extends StatefulWidget {
  @override
  _OnboardingScreenOne createState() => _OnboardingScreenOne();
}

enum FirstTime { First, notFirst}

class _OnboardingScreenOne extends State<OnboardingScreenOne> {
  FirstTime _FirstTime = FirstTime.First;


  String value, id;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getString("first");

      id = preferences.getString("id");
      _FirstTime = value == 'first' ? FirstTime.notFirst : FirstTime.First;
    });
  }


  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("mobile",null);
      preferences.setString("name",null);
      preferences.setString("email",null);
      preferences.setString("id",null);
      preferences.setString("otp",null);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
          builder: (_) => Login(),
      ),);

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    //it will helps to return the size of the screen
    Size size = MediaQuery.of(context).size;
    switch (_FirstTime) {
      case FirstTime.First:
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Container(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        width: size.width,
                        height: 100,
                        image: AssetImage('assets/images/logos.png'),
                      ),
                      ClipPath(
                        clipper: SlandingClipper(),
                        child: Container(
                          height: size.height * 0.6,
                          color: black,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: size.height * 0.65,
                  child: Container(
                    width: size.width,
                    padding: EdgeInsets.all(appPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Konda",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "Konda Present New Indian Movies App",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: appPadding / 4),
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            border: Border.all(color: black, width: 2),
                            shape: BoxShape.circle,
                            color: white),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: appPadding / 4),
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            border: Border.all(color: black, width: 2),
                            shape: BoxShape.circle,
                            color: yellow),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: appPadding / 4),
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            border: Border.all(color: black, width: 2),
                            shape: BoxShape.circle,
                            color: yellow),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: appPadding * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => OnboardingScreenThree(),
                                )
                            );
                          },
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: appPadding),
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => OnboardingScreenTwo(),
                              ),
                            );
                          },
                          backgroundColor: white,
                          child: Icon(
                            Icons.navigate_next_rounded,
                            color: black,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
        break;

      case FirstTime.notFirst:
        print("user id ");
        print(id);
        if(id==null) {
          return Login();
        }else{
          return MainMenu(signOut);
        }
        break;
    }
  }
}

/*<-----------Screen 2----------->*/

class OnboardingScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RotatedBox(
                  quarterTurns: 2,
                  child: ClipPath(
                    clipper: SlandingClipper(),
                    child: Container(
                      height: size.height * 0.5,
                      color: black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:120.0),
                  child: Image(
                    width: size.width,
                    height: size.height*0.2,
                    image: AssetImage('assets/images/movie1.png'),
                  ),
                ),
              ],
            ),
            Positioned(
              top: size.height * 0.05,
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(appPadding),
                child: Padding(
                  padding: const EdgeInsets.only(top:80.0,left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CG Movies',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: white,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        "Konda also present Chhattisgarhi Movies",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: appPadding / 4),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: white),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: appPadding / 4),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: yellow),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: appPadding / 4),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: appPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => OnboardingScreenThree(),
                        )
                        );
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: appPadding),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => OnboardingScreenThree(),
                          ),
                        );
                      },
                      backgroundColor: white,
                      child: Icon(
                        Icons.navigate_next_rounded,
                        color: black,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*<-----------Screen 3----------->*/

class OnboardingScreenThree extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  width: size.width*0.6,
                  height: size.height*0.6,
                  image: AssetImage('assets/images/tv.png'),
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: ClipPath(
                    clipper: SlandingClipper(),
                    child: Container(
                      height: size.height * 0.4,
                      color: black,
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: size.height * 0.70,
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(appPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Premium Movies',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: white,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      'Konda Presents Premium Movies',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: appPadding / 9),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: white),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: appPadding / 9),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: white),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: appPadding / 9),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: appPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () => print('Skip'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: appPadding),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) =>Login()));
                        },
                      backgroundColor: white,
                      child: Icon(
                        Icons.done_rounded,
                        color: black,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
