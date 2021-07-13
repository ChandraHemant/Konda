import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:konda_app/Screens/ProfileUpdate.dart';
import 'package:konda_app/Screens/UserRegister.dart';
import 'package:konda_app/MainMenu.dart';
import 'package:konda_app/Service/ApiService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String mobileno, otpcode, name;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  saveIntro(String first) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("first", first);
    });
  }

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  bool visible = false;

  bool viewVisible = true;

  bool hideVisible = false;

  loadProgress() {
    setState(() {
      visible = true;
    });
    check();
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      if(mobileno!=null && otpcode!=null) {
        verfyOtp();
      }else{
        loginRegister();
      }
    }else{
      setState(() {
        visible = false;
      });
    }
  }

  resendOtp() async
  {
    final response = await http.post(ApiService.BASE_URL + "User_ResendOtp",
        body: {"mobile": mob});

    final data = jsonDecode(response.body);
    bool value = data['error'];
    String success = data['success'];

    if (!value) {
      setState(() {
        visible = false;
        viewVisible = false;
        hideVisible = true;
      });
      print("Successfully: " + success);
      loginSuccessToast("OTP Successfully Sended Check Your Inbox!");
    } else {
      setState(() {
        visible = false;
      });
      print("fail");
      print("Success: " + success);
      loginFailedToast("Oops somthing went wrong! Please try again later");
    }
  }

  verfyOtp() async
  {
    final response = await http.post(ApiService.BASE_URL + "User_VerifyOtp",
        body: {"mobile": mobileno, "otp": otpcode});

    final data = jsonDecode(response.body);
    bool value = data['error'];
    String success = data['success'];
    String uemail = data['uemail'];
    String uname = data['uname'];
    String umobile = data['umobile'];
    String uid = data['uid'];
    print("Verify");
    if (!value) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(uemail, umobile, uname, uid);
        visible = false;
        viewVisible = false;
        hideVisible = true;
      });
      print("Success: " + success);
      loginSuccessToast("Successfully logged in!");
      if(uemail==null || uemail=="" || uemail==" ") {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => ProfileUpdate()));
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MainMenu(signOut)));
      }
    } else {
      setState(() {
        visible = false;
      });
      print("fail");
      print("Oops Somthing went wrong! Please try again later");
      loginFailedToast(success);
    }
  }

  loginRegister() async {
    final response = await http.post(ApiService.BASE_URL + "User_Signin",
        body: {"mobile": mobileno, "name": name});

    print("login register");
    final data = jsonDecode(response.body);
    bool value = data['error'];
    String success = data['success'];
    String mobile = data['mobile'];

    if (!value) {
      setState(() {
        saveMobile(mobile);
        visible = false;
        viewVisible = false;
        hideVisible = true;
      });
      print("Success: " + success);
      loginSuccessToast("Please Verify Mobile Number With OTP!");
    } else {
      setState(() {
        visible = false;
      });
      print("fail");
      print("Success: " + success);
      loginFailedToast("Something Went Wrong! Please try again later");
    }
  }

  loginSuccessToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  }

  loginFailedToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  savePref(String email, String mobile, String name, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("name", name);
      preferences.setString("email", email);
      preferences.setString("id", id);
      preferences.setString("mobile", mobile);
    });
  }

  saveMobile(String mobile) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("mobile", mobile);
      mob = preferences.getString('mobile');
      preferences.commit();
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("mobile", null);
      preferences.setString("name", null);
      preferences.setString("email", null);
      preferences.setString("id", null);
      preferences.setString("otp", null);
      _loginStatus = LoginStatus.notSignIn;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Login(),
        ),
      );
    });
  }

  String value,mob;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getString("id");

      if (value != null) {
        _loginStatus = LoginStatus.signIn;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MainMenu(signOut)));
      } else {
        _loginStatus = LoginStatus.notSignIn;
      }
    });
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: roundedButton(
                    "No", Color(0xFF212121), const Color(0xFFFFFFFF)),
              ),
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: roundedButton(
                    " Yes ", const Color(0xFFFFC107), const Color(0xFFFFFFFF)),
              ),
            ],
          ),
        ) ??
        false;
  }

  Widget roundedButton(String buttonLabel, Color bgColor, Color textColor) {
    var loginBtn = new Container(
      padding: EdgeInsets.all(5.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF696969),
            offset: Offset(1.0, 6.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: new TextStyle(
            color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
    return loginBtn;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    saveIntro("first");
  }

  // For OTP GENERATION

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return new WillPopScope(
            onWillPop: _onBackPressed,
            child: new Scaffold(
              body: Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(15.0),
                  children: <Widget>[
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        //            color: Colors.grey.withAlpha(20),

                        child: Form(
                          key: _key,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/icons/konda.png",height: 170,),
                              SizedBox(
                                height: 25,
                              ),

                              SizedBox(
                                height: 50,
                                child: Text(
                                  "USER LOGIN",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
                                ),
                              ),

                              Visibility(
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  visible: visible,
                                  child: Container(
                                      margin:
                                          EdgeInsets.only( bottom: 10),
                                      child: CircularProgressIndicator())),

                              //card for User Name TextFormField
                              Card(
                                elevation: 6.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    validator: (e) {
                                      if (e.isEmpty) {
                                        return "Please enter user name";
                                      }
                                    },
                                    onSaved: (e) => name = e,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    decoration: InputDecoration(
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, right: 15),
                                          child: Icon(Icons.person_outline_outlined),
                                        ),
                                        contentPadding: EdgeInsets.all(8),
                                        labelText: "Enter User Name"),
                                  ),
                                ),
                              ),
                              //card for Mobile TextFormField
                              Card(
                                elevation: 6.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    validator: (e) {
                                      String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                      RegExp regExp = new RegExp(patttern);
                                      if (e.isEmpty) {
                                        return "Please enter mobile number";
                                      }
                                      else if (!regExp.hasMatch(e)) {
                                        return 'Please enter valid mobile number';
                                      }
                                    },
                                    onSaved: (e) => mobileno = e,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    decoration: InputDecoration(
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, right: 15),
                                          child: Icon(Icons.phone_iphone_rounded),
                                        ),
                                        contentPadding: EdgeInsets.all(8),
                                        labelText: "Enter Mobile Number"),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                              ),

                              Column(children: [
                                Visibility(
                                  visible : hideVisible,
                                  child: Card(
                                    elevation: 6.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        validator: (e) {
                                          String patttern = r'(^(?:[+0]9)?[0-9]{6}$)';
                                          RegExp regExp = new RegExp(patttern);
                                          if (e.isEmpty) {
                                            return "Please enter otp number";
                                          }
                                          else if (!regExp.hasMatch(e)) {
                                            return 'Please enter valid otp number';
                                          }
                                        },
                                        obscureText: _secureText,
                                        onSaved: (e) => otpcode = e,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        decoration: InputDecoration(
                                          labelText: "Enter OTP",
                                          prefixIcon: Padding(
                                            padding:
                                            EdgeInsets.only(left: 20, right: 15),
                                            child: Icon(
                                              Icons.messenger_outline,
                                            ),
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: showHide,
                                            icon: Icon(_secureText
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                          ),
                                          contentPadding: EdgeInsets.all(8),
                                        ),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 12,
                                ),


                                Visibility(
                                  visible: hideVisible,
                                  child: Container(
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Don't have an OTP?"),

                                          FlatButton(
                                            child: Row(
                                              children: [
                                                Text("RESEND OTP",
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                    ))],

                                            ),
                                            onPressed: () {
                                              resendOtp();
                                            }             ,

                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                              ]),

                              Padding(
                                padding: EdgeInsets.all(14.0),
                              ),

                              new Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Visibility(
                                      visible : viewVisible,
                                      child: GestureDetector(
                                        onTap:() {
                                          loadProgress();
                                        },
                                        child: Container(
                                          height: 56.0,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(23.0),
                                            gradient: LinearGradient(
                                              colors: [Color(0xFFFB415B), Color(0xFFEE5623)],
                                              begin: Alignment.centerRight,
                                              end: Alignment.centerLeft,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "LOGIN",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: hideVisible,
                                      child: GestureDetector(
                                        onTap:() {
                                          loadProgress();
                                        },
                                        child: Container(
                                          height: 56.0,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(23.0),
                                            gradient: LinearGradient(
                                              colors: [Color(0xFF558B2F), Color(0xFF7CB342)],
                                              begin: Alignment.centerRight,
                                              end: Alignment.centerLeft,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "VERIFY OTP",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
        break;

      case LoginStatus.signIn:
        return MainMenu(signOut);
//        return ProfilePage(signOut);
        break;
    }
  }
}
