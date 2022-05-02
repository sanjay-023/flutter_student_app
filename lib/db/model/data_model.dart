import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  late final String name;

  @HiveField(1)
  final String batch;

  @HiveField(2)
  final String phone;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String img;

  StudentModel(
      {required this.name,
      required this.batch,
      required this.phone,
      required this.email,
      required this.img});
}
