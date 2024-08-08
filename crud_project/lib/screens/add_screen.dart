import 'package:crud_project/screens/home_screen.dart';
import 'package:crud_project/services/api_service.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});

  final nameController = TextEditingController();
  final contentController = TextEditingController();

  insertPost() {
    var name = nameController.text;
    var content = contentController.text;
    ApiService.insertPost(name, content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Write Post'),
        ),
        body: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'name'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(labelText: 'content'),
            ),
            TextButton(
                onPressed: () {
                  insertPost();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                child: const Text('Add'))
          ],
        ));
  }
}
