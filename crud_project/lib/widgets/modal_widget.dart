import 'package:crud_project/screens/home_screen.dart';
import 'package:crud_project/services/api_service.dart';
import 'package:flutter/material.dart';

Future<dynamic> showModifyModal(
    BuildContext context,
    String idx,
    String name,
    String content,
    TextEditingController nameController,
    TextEditingController contentController) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Post Modify'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController = TextEditingController(text: name),
                decoration: const InputDecoration(hintText: 'Post Name'),
              ),
              TextField(
                controller: contentController =
                    TextEditingController(text: content),
                decoration: const InputDecoration(hintText: 'Post Content'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              nameController.text = '';
              contentController.text = '';
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              ApiService.modifyPost(
                  idx, nameController.text, contentController.text);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}
