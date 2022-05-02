import 'package:flutter/material.dart';
import 'package:studentapp/db/functions/db_function.dart';
import 'package:studentapp/db/model/data_model.dart';
import 'package:studentapp/screen/home_screen.dart';
import 'package:studentapp/screen/widgets/image_profile.dart';

class EditStudentScreen extends StatelessWidget {
  EditStudentScreen(
      {Key? key,
      required this.name,
      required this.batch,
      required this.phone,
      required this.email,
      required this.intex2,
      required this.img})
      : super(key: key);
  final String name;
  final String batch;
  final String phone;
  final String email;
  final int intex2;
  final String img;
  final _nameController = TextEditingController();
  final _batchConntroller = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = name;
    _batchConntroller.text = batch;
    _phoneController.text = phone;
    _emailController.text = email;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        CommonCircleAvatar(
                            radius: 45, img: img, size: Size(60, 60)),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          name,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 20),
                        child: Row(
                          children: const [
                            Text(
                              'Personal Details',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 101, 101, 101)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Name',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              TextField(
                                style: const TextStyle(fontSize: 20),
                                controller: _nameController,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Batch Number',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              TextField(
                                controller: _batchConntroller,
                                style: const TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Phone Number',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              TextField(
                                controller: _phoneController,
                                style: const TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Email',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              TextField(
                                controller: _emailController,
                                style: const TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            onSaveButtonClicked(context);
                          },
                          child: Text('Save'))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void onSaveButtonClicked(BuildContext context) {
    final _nameText = _nameController.text;
    final _batchText = _batchConntroller.text;
    final _phoneText = _phoneController.text;
    final _emailText = _emailController.text;

    final _editStudent = StudentModel(
        name: _nameText,
        batch: _batchText,
        phone: _phoneText,
        email: _emailText,
        img: img);

    editStudent(intex2, _editStudent);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) {
      return const ScreenHome();
    }), (route) => false);
  }
}
