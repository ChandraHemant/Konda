import 'dart:convert';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konda_app/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:konda_app/MainMenu.dart';
import 'package:konda_app/Screens/HomeScreen.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:konda_app/Screens/UserLogin.dart';
import 'package:konda_app/Screens/UserRegister.dart';
import 'package:konda_app/Service/ApiService.dart';
import 'package:konda_app/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

String u_id = '';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: DarkTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: ProfileUpdate(),
          );
        },
      ),
    );
  }
}

class ProfileUpdate extends StatefulWidget {
  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {

  File _image;
  final picker = ImagePicker();

  bool click;
  bool visible = false;

  String name, email, mobile, password;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  _imgFromCamera() async {
    var pickedImage = await picker.getImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  _imgFromGallery() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  savePref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setBool('clickFun',true);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }


  Future uploadImage()async{
    final uri = Uri.parse(ApiService.BASE_URL+"Profile_image_upload");
    var request = http.MultipartRequest('POST',uri);
    request.fields['u_id'] = u_id;
    var pic = await http.MultipartFile.fromPath("image", _image.path);
    request.files.add(pic);
    var response = await request.send();
    if (response.statusCode == 200) {
      print('Image Uploded');
    }else{
      print('Image Not Uploded');
    }
  }


  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  loadProgress(){

    setState(() {
      visible = true;
    });
    check();
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      save();
    }
  }

  save() async {
    final response = await http
        .post(ApiService.BASE_URL+"User_Signup", body: {
      "name": name,
      "email": email,
      "mobile": mobile,
      "password": password
    });

    final data = jsonDecode(response.body);
    bool value = data['error'];
    String success = data['success'];
    if (!value) {
      setState(() {
        visible = false;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>Login()));
      });
      print("Success: "+success);
      registerSuccessToast("Successfuly Registered...!");
    } else {
      setState(() {
        visible = false;
      });
      print("Success: "+success);
      registerFailedToast("Something Went Wrong...!");
    }
  }

  registerSuccessToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  }

  registerFailedToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  TextEditingController u_name = TextEditingController();
  TextEditingController u_pass = TextEditingController();


  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      u_id = preferences.getString("id");
      click = preferences.getBool('clickFun');
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Login(),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: click ? AppBar(
        title:
        Text(
          'Update Profile',
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            )),
      ) : PreferredSize(preferredSize: Size(0.0, 0.0),child: Container(),),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            Center(
              child: Container(
                padding: const EdgeInsets.all(8.0),

                child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Stack(alignment: Alignment.center, children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: _image == null  //profilePhoto which is File object
                                          ? AssetImage(
                                          "assets/icons/konda.png")
                                          : FileImage(_image), // picked file
                                      fit: BoxFit.fill)),
                            ),
                          ),

                        Padding(
                          padding: const EdgeInsets.only(left: 100, top: 120),
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: SpacingUnit.w * 2.5,
                              width: SpacingUnit.w * 2.5,
                              decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                shape: BoxShape.circle,
                              ),
                              child: GestureDetector(
                                onTap: () {

                                  _showPicker(context);
                                  //    choiceImage();

                                },
                                child: Icon(
                                  LineAwesomeIcons.retro_camera,
                                  color: DarkPrimaryColor,
                                  size: ScreenUtil().setSp(SpacingUnit.w * 2),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),

                      SizedBox(
                        height: 25,
                      ),


                      SizedBox(
                        height: 50,
                        child: Text(
                          "USER PROFILE",
                          style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                      ),

                      Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: visible,
                          child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: CircularProgressIndicator()
                          )
                      ),
                      buildTextField("Enter Your Mobile No."),
                      SizedBox(
                        height: 20.0,
                      ),
                      buildTextField("Enter OTP"),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(height: 20.0),
                      buildButtonContainer(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Skip at the time?"),

                              FlatButton(
                                child: Row(
                                  children: [
                                    Text("CLICK HERE",
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ))],

                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context, MaterialPageRoute(builder: (context) => MainMenu(signOut)));
                                }

                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: hintText == "Enter Your Mobile No."
            ? Icon(Icons.phone_android_outlined)
            : Icon(Icons.messenger_outline),
      ),
    );
  }

  Widget buildButtonContainer() {
    return GestureDetector(
      onTap: (){

        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Container(
        //onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
            "UPDATE",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
