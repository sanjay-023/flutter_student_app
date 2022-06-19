import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentapp/db/functions/db_function.dart';
import 'package:get/get.dart';

Widget CusBottomSheet(context) {
  final controller = Get.find<StudentController>();
  return SizedBox(
    height: 150,
    child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Choose From",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    controller.takePhoto(ImageSource.camera);
                    Get.back();
                  },
                  icon: const Icon(Icons.camera),
                  color: Colors.orange,
                ),
                const Text("Camera")
              ],
            ),
            const SizedBox(
              width: 70,
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    controller.takePhoto(ImageSource.gallery);
                    Get.back();
                  },
                  icon: const Icon(Icons.image),
                  color: Colors.orange,
                ),
                const Text('Gallery'),
              ],
            )
          ],
        )
      ],
    ),
  );
}
