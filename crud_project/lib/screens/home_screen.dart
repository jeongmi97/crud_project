import 'package:crud_project/models/board_model.dart';
import 'package:crud_project/screens/add_screen.dart';
import 'package:crud_project/services/api_service.dart';
import 'package:crud_project/widgets/boards_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<BoardModel>> boards = ApiService.getBoardList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CRUD PROJECT',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddScreen(),
                    ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: boards,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [Expanded(child: makeList(snapshot))],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<BoardModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var board = snapshot.data![index];
        return Boards(idx: board.idx, name: board.name, content: board.content);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
    );
  }
}
