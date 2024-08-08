import 'package:crud_project/screens/home_screen.dart';
import 'package:crud_project/services/api_service.dart';
import 'package:crud_project/widgets/modal_widget.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  String idx, name, content;

  final nameController = TextEditingController();
  final contentController = TextEditingController();

  DetailScreen(
      {super.key,
      required this.idx,
      required this.name,
      required this.content});

  deletePost(String idx) {
    ApiService.deletePost(idx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          IconButton(
              onPressed: () {
                showModifyModal(
                  context,
                  idx,
                  name,
                  content,
                  nameController,
                  contentController,
                );
              },
              icon: const Icon(Icons.menu_book_rounded)),
          IconButton(
              onPressed: () {
                deletePost(idx);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: Column(
        children: [Text(content)],
      ),
    );
  }
}
