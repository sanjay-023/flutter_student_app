import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentapp/screen/screen_login.dart';

import '../add_student_screen.dart';
import '../home_screen.dart';

class ScreenDrawer extends StatelessWidget {
  const ScreenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [buildHeader(context), buildItems(context)],
        ),
      ),
    );
  }

  buildHeader(BuildContext context) => Container(
        color: Colors.orange,
        padding: const EdgeInsets.only(top: 80, bottom: 30),
        child: Column(
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage('asset/images/avtar.jpg'),
              radius: 70,
            ),
            SizedBox(
              height: 15,
              width: 400,
            ),
            Text(
              'Sanjay D',
              style: TextStyle(fontSize: 30, color: Colors.white),
            )
          ],
        ),
      );
  buildItems(BuildContext context) => Column(
        children: [
          ListTile(
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 20),
            ),
            leading: const Icon(
              Icons.home,
              size: 30,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return const ScreenHome();
              }));
            },
          ),
          ListTile(
            title: const Text(
              'Add student',
              style: TextStyle(fontSize: 20),
            ),
            leading: const Icon(
              Icons.add,
              size: 30,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return AddStudentScreen();
              }));
            },
          ),
          ListTile(
            title: const Text(
              'Signout',
              style: TextStyle(fontSize: 20),
            ),
            leading: const Icon(
              Icons.exit_to_app,
              size: 30,
            ),
            onTap: () async {
              final _sharedprfns = await SharedPreferences.getInstance();
              _sharedprfns.clear();

              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (ctx) {
                return LoginScreen();
              }), (route) => false);
            },
          )
        ],
      );
}
