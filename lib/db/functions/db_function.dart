import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentapp/db/model/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
RxList<StudentModel> searchData = <StudentModel>[].obs;
void addStudent(StudentModel value) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  studentDb.add(value);
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}

void getAllStudents() async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDb.values);
  studentListNotifier.notifyListeners();
}

void deleteStudent(int intex) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');

  studentDb.deleteAt(intex);
  getAllStudents();
}

void editStudent(int intex, StudentModel value) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  studentDb.putAt(intex, value);
  getAllStudents();
}

void getSearchResult(String value) {
  searchData.clear();

  for (var intex in studentListNotifier.value) {
    if (intex.name.toString().toLowerCase().contains(
          value.toLowerCase(),
        )) {
      StudentModel data = StudentModel(
          name: intex.name,
          batch: intex.batch,
          phone: intex.phone,
          email: intex.email,
          img: intex.img);
      searchData.add(data);
    }
  }
}

String img = '';
// File? imag;

class getImage extends GetxController {
  takePhoto(ImageSource source) async {
    final pickImage = await ImagePicker().pickImage(source: source);
    if (pickImage == null) {
      return;
    } else {
      // imag = File(pickImage.path);
      update();
      final bytes = File(pickImage.path).readAsBytesSync();
      img = base64Encode(bytes);
    }
  }
}
