import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:studentapp/db/functions/db_function.dart';
import 'package:studentapp/db/model/data_model.dart';

import 'package:studentapp/screen/add_student_screen.dart';
import 'package:studentapp/screen/search_screen.dart';
import 'package:studentapp/screen/widgets/screen_drawer.dart';

import 'widgets/list_student_widget.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return SearchScreen();
                }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      drawer: const ScreenDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return AddStudentScreen();
          }));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        child: Column(
          children: const [
            SizedBox(
              height: 20,
            ),
            Expanded(child: ListStudentWidget())
          ],
        ),
      ),
    );
  }
}
