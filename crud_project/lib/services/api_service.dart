import 'dart:convert';

import 'package:crud_project/models/board_model.dart';

import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "http://192.168.51.4:1080";

  static Future<List<BoardModel>> getBoardList() async {
    List<BoardModel> boardInstances = [];
    final url = Uri.parse('$baseUrl/getList');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> boards = jsonDecode(response.body);
      for (var board in boards) {
        boardInstances.add(BoardModel.fromJson(board));
      }
      return boardInstances;
    }
    throw Error();
  }

  static Future<String> insertPost(String name, String content) async {
    final url = Uri.parse('$baseUrl/insert');
    Map data = {'name': name, 'content': content};
    var body = json.encode(data);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 200) {
      var responseBody = response.body;
      return responseBody;
    }
    throw Error();
  }

  static Future<String> modifyPost(
      String idx, String name, String content) async {
    final url = Uri.parse('$baseUrl/modify');
    Map data = {'idx': idx, 'name': name, 'content': content};
    var body = json.encode(data);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 200) {
      var responseBody = response.body;
      return responseBody;
    }
    throw Error();
  }

  static Future<String> deletePost(String idx) async {
    final url = Uri.parse('$baseUrl/delete/$idx');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = response.body;
      return responseBody;
    }
    throw Error();
  }
}
