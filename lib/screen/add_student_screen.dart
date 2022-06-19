import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:studentapp/db/functions/db_function.dart';
import 'package:studentapp/db/model/data_model.dart';
import 'package:studentapp/screen/widgets/botton_sheet.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({Key? key}) : super(key: key);

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _namecontroller = TextEditingController();

  final _batchcontroller = TextEditingController();

  final _phonecontroller = TextEditingController();

  final _emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  child: const Text(
                    "Add Student",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 253, 226, 186),
                    borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: _namecontroller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    hintText: 'Enter Student Name',
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 253, 226, 186),
                    borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: _batchcontroller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    hintText: 'Enter Batch Number',
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 253, 226, 186),
                    borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: _phonecontroller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    hintText: 'Enter Phone Number',
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 253, 226, 186),
                    borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: _emailcontroller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    hintText: 'Enter Email Id ',
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return CusBottomSheet(context);
                        });
                  },
                  icon: const Icon(Icons.image),
                  label: const Text('Upload Image')),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    onAddStudenButtonClicked(context);
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(250, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void onAddStudenButtonClicked(BuildContext context) {
    final controller = Get.find<StudentController>();
    final _nametext = _namecontroller.text;
    final _batchtext = _batchcontroller.text;
    final _phonetext = _phonecontroller.text;
    final _emailtext = _emailcontroller.text;

    if (_nametext.isEmpty ||
        _phonetext.isEmpty ||
        _batchtext.isEmpty ||
        _emailtext.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Required Field is Empty'),
        backgroundColor: Color.fromARGB(255, 242, 24, 8),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Successfully Added'),
          backgroundColor: Color.fromARGB(255, 3, 141, 8)));
      _namecontroller.clear();
      _batchcontroller.clear();
      _phonecontroller.clear();
      _emailcontroller.clear();
      FocusManager.instance.primaryFocus?.unfocus();
    }

    final _student = StudentModel(
        name: _nametext,
        batch: _batchtext,
        phone: _phonetext,
        email: _emailtext,
        img: controller.img);

    controller.addStudent(_student);
  }
}
