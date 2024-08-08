import 'package:crud_project/screens/detail_screen.dart';
import 'package:crud_project/services/api_service.dart';
import 'package:flutter/material.dart';

class Boards extends StatelessWidget {
  String idx, name, content;

  Boards(
      {super.key,
      required this.idx,
      required this.name,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                idx: idx,
                name: name,
                content: content,
              ),
            ));
      },
      child: Row(
        children: [
          Text(idx),
          const SizedBox(
            width: 40,
          ),
          Text(name),
          const SizedBox(
            width: 40,
          ),
          Text(content),
        ],
      ),
    );
  }
}
