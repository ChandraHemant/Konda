import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:konda_app/Screens/HomeScreen.dart';
import 'package:konda_app/Screens/Movies.dart';
import 'package:konda_app/Screens/MyList.dart';
import 'package:konda_app/Screens/PrivacyPolicy.dart';
import 'package:konda_app/Screens/Profile.dart';
import 'package:konda_app/Screens/Search.dart';
import 'package:konda_app/Widgets/profile_list_item.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konda_app/constants.dart';
import 'dart:io';
import 'package:flutter_share/flutter_share.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class MainMenu extends StatefulWidget {
  final VoidCallback signOut;

  MainMenu(this.signOut);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {


  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  int _currentIndex = 0;
  PageController _pageController;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int currentIndex = 0;

  // String selectedIndex = 'TAB: 0';

  String email = "", name = "", id = "", mob = "";
  TabController tabController;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
      email = preferences.getString("email");
      name = preferences.getString("name");
      mob = preferences.getString("mobile");

      print("id: " + id);
      print("user: " + email);
      print("name: " + name);
      print("mobile: " + mob);
    });
  }

  savePref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setBool('clickFun',false);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    _pageController = PageController();
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


  /*<--------Upper Part Of Drawer-------------->*/

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);
    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: SpacingUnit.w * 15,
            width: SpacingUnit.w * 15,
            margin: EdgeInsets.only(top: SpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/icons/konda.png"),// picked file
                            fit: BoxFit.fill)),
                  ),
              ],
            ),
          ),
          SizedBox(height: SpacingUnit.w * 1),
          Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: SpacingUnit.w * 0.5),
          Text(
            mob,
            style: TitleTextStyle,
          ),
          SizedBox(height: SpacingUnit.w * 0.5),
          Text(
            email,
            style: CaptionTextStyle,
          ),
          SizedBox(height: SpacingUnit.w * 2),
          Padding(
            padding: const EdgeInsets.only(bottom:18.0),
            child: Container(
              height: SpacingUnit.w * 4,
              width: SpacingUnit.w * 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SpacingUnit.w * 3),
                color: Theme.of(context).accentColor,
              ),
              child: Center(
                child: Text(
                  'Upgrade to PRO',
                  style: ButtonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    var header = Row(
      children: <Widget>[
        profileInfo,
        SizedBox(width: SpacingUnit.w * 3),
      ],
    );

    /*<--------------Drawer----------->*/

    return new WillPopScope(
        onWillPop: _onBackPressed,
        child: new Scaffold(
          drawer: new Drawer(
            child: Column(
              children: <Widget>[
                SizedBox(height: SpacingUnit.w * 5),
                header,
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Privacy()));
                        },
                        child: ProfileListItem(
                          icon: LineAwesomeIcons.user_shield,
                          text: 'Privacy',
                        ),
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.history,
                        text: 'Purchase History',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.question_circle,
                        text: 'Help & Support',
                      ),
                      /* ProfileListItem(
                        icon: LineAwesomeIcons.cog,
                        text: 'Settings',
                      ),*/
                      GestureDetector(
                        onTap: () {
                          share();
                        },
                        child: ProfileListItem(
                          icon: LineAwesomeIcons.user_plus,
                          text: 'Invite a Friend',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            actions: <Widget>[
              Image(
                image: AssetImage('assets/images/logos.png'),
              ),
              IconButton(
                onPressed: () {
                  signOut();
                },
                icon: Icon(Icons.lock_open),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                icon: Icon(Icons.account_circle),
              ),
            ],
          ),
          body: SizedBox.expand(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: <Widget>[
                HomeScreen(),
                Movies(),
                Search(),
                MyList(),
              ],
            ),
          ),


          /*<-------------Bottom Navigation---------->*/


          bottomNavigationBar: BottomNavyBar(
            backgroundColor: DarkPrimaryColor,
            selectedIndex: _currentIndex,
            showElevation: true,
            // use this to remove appBar's elevation
            onItemSelected: (index) => setState(() {
              savePref();
              _currentIndex = index;
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300), curve: Curves.ease);
            }),
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                activeColor: Colors.amberAccent,
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.play_circle_fill),
                  title: Text('Movies'),
                  activeColor: Colors.purpleAccent),
              BottomNavyBarItem(
                  icon: Icon(Icons.search),
                  title: Text('Search'),
                  activeColor: Colors.orangeAccent),
              BottomNavyBarItem(
                  icon: Icon(Icons.library_add),
                  title: Text('PlayList'),
                  activeColor: Colors.blue),
            ],
          ),
        ));
  }

  callToast(String msg) {
    Fluttertoast.showToast(
        msg: "$msg",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

}

Future<void> share() async {
  await FlutterShare.share(
      title: 'KONDA',
      text: 'Enjoy With KONDA',
      linkUrl: 'https://play.google.com/store/apps/details?id=in.co.konda.htkc.konda_app',
      chooserTitle: 'Share With Your Friends...');
}
/*Future<void> shareFile() async {
  List<dynamic> docs = await DocumentsPicker.pickDocuments;
  if (docs == null || docs.isEmpty) return null;

  await FlutterShare.shareFile(
    title: 'Example share',
    text: 'Example share text',
    filePath: docs[0] as String,
  );
}*/

