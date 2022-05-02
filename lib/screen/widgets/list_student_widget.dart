import 'package:flutter/material.dart';

import 'package:studentapp/db/functions/db_function.dart';
import 'package:studentapp/db/model/data_model.dart';
import 'package:studentapp/screen/student_detail_screen.dart';
import 'package:studentapp/screen/widgets/delete_alert_widget.dart';
import 'package:studentapp/screen/widgets/image_profile.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
            itemBuilder: (ctx, intex) {
              final data = studentList[intex];

              return ListTile(
                leading: CommonCircleAvatar(
                    radius: 40, img: data.img, size: const Size(50, 50)),
                trailing: IconButton(
                    onPressed: () {
                      //deleteStudent(intex);
                      delete(ctx, intex);
                    },
                    icon: const Icon(Icons.delete)),
                title: Text(data.name.toUpperCase()),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return StudentDetailScreen(
                      name: data.name,
                      batch: data.batch,
                      phone: data.phone,
                      email: data.email,
                      intex1: intex,
                      img: data.img,
                    );
                  }));
                },
              );
            },
            separatorBuilder: (ctx, intex) {
              return const Divider();
            },
            itemCount: studentList.length);
      },
    );
  }

  void searchList() {}
}
