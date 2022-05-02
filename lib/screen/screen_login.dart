import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color.fromARGB(255, 255, 94, 0),
          Color.fromARGB(255, 245, 122, 15),
          Color.fromARGB(255, 253, 166, 37)
        ])),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Welcome Back',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  )),
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            TextField(
                              controller: _usernamecontroller,
                              decoration: InputDecoration(
                                  hintText: 'Username',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                                controller: _passwordcontroller,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)))),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                checkLogin(context);
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(250, 40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text('Forgot Password'))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    const _defusername = 'sanjay023';
    const _defpassword = 'Sanjay';
    final _username = _usernamecontroller.text;
    final _password = _passwordcontroller.text;
    FocusManager.instance.primaryFocus?.unfocus();
    if (_username == _defusername && _password == _defpassword) {
      final _sharedprfns = await SharedPreferences.getInstance();
      await _sharedprfns.setBool(SAVE_KEY, true);

      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return const ScreenHome();
      }));
    } else {
      _usernamecontroller.clear();
      _passwordcontroller.clear();
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          content: Text('Username or Password does not match'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
