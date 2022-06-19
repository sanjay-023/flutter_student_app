import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentapp/screen/home_screen.dart';
import 'package:studentapp/screen/screen_login.dart';

import '../main.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color.fromARGB(255, 255, 94, 0),
          Color.fromARGB(255, 245, 122, 15),
          Color.fromARGB(255, 253, 166, 37)
        ])),
        child: Image.asset(
          'asset/images/studentapp-logo.png',
          width: 50,
          height: 50,
        ),
      ),
    );
  }

  Future<void> gotologin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => LoginScreen()));
  }

  void checkUserLoggedIn() async {
    final _sharedprfns = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedprfns.getBool(SAVE_KEY);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotologin();
    } else {
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      //   return const ScreenHome();
      // }));
      Get.off(const ScreenHome());
    }
  }
}
