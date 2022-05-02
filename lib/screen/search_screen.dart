import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:studentapp/db/functions/db_function.dart';
import 'package:studentapp/screen/student_detail_screen.dart';
import 'package:studentapp/screen/widgets/image_profile.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  // final controller = Get.find<StudentDataController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 251, 213, 156),
                  ),
                  child: TextField(
                    onChanged: (value) => getSearchResult(value),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Search',
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Obx(
                () {
                  if (searchData.isEmpty) {
                    return const Center(
                      child: SizedBox(
                        child: Text('No Data Found'),
                      ),
                    );
                  } else {
                    return Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, intex) {
                              final data = searchData[intex];
                              return ListTile(
                                leading: CommonCircleAvatar(
                                    radius: 40,
                                    img: data.img,
                                    size: const Size(50, 50)),
                                title: Text(data.name.toUpperCase()),
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (ctx) {
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
                            separatorBuilder: (context, intex) {
                              return const Divider();
                            },
                            itemCount: searchData.length));
                  }
                },
              )
            ],
          ),
        ));
  }
}
