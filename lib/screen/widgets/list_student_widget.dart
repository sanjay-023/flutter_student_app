import 'package:flutter/material.dart';

import 'package:studentapp/db/functions/db_function.dart';
import 'package:studentapp/screen/student_detail_screen.dart';
import 'package:studentapp/screen/widgets/delete_alert_widget.dart';
import 'package:studentapp/screen/widgets/image_profile.dart';
import 'package:get/get.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final datas = Get.find<StudentController>();
    return Scaffold(
      body: Obx(
        () => datas.studentDataController.isEmpty
            ? const Center(
                child: Text(
                  'No Data found',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              )
            : ListView.separated(
                itemBuilder: (ctx, intex) {
                  final dataAtIndex = datas.studentDataController[intex];

                  return ListTile(
                    leading: CommonCircleAvatar(
                        radius: 40,
                        img: dataAtIndex.img,
                        size: const Size(50, 50)),
                    trailing: IconButton(
                        onPressed: () {
                          //deleteStudent(intex);
                          delete(ctx, intex);
                        },
                        icon: const Icon(Icons.delete)),
                    title: Text(dataAtIndex.name.toUpperCase()),
                    onTap: () {
                      Get.to(StudentDetailScreen(
                          name: dataAtIndex.name,
                          batch: dataAtIndex.batch,
                          phone: dataAtIndex.phone,
                          email: dataAtIndex.email,
                          intex1: intex,
                          img: dataAtIndex.img));
                    },
                  );
                },
                separatorBuilder: (ctx, intex) {
                  return const Divider();
                },
                itemCount: datas.studentDataController.length),
      ),
    );
  }

  void searchList() {}
}
