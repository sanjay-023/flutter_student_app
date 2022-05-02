import 'package:flutter/material.dart';
import 'package:studentapp/db/functions/db_function.dart';

void delete(ctx, intex) {
  showDialog(
      context: ctx,
      builder: (ctx1) {
        return AlertDialog(
          title: const Text('Are You Sure?'),
          content: const Text('Do you really want to delete these records?'),
          actions: [
            TextButton(
                onPressed: () {
                  deleteStudent(intex);
                  Navigator.of(ctx1).pop();
                },
                child: const Text('Yes')),
            TextButton(
                onPressed: () {
                  Navigator.of(ctx1).pop();
                },
                child: const Text('No'))
          ],
        );
      });
}
