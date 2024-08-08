class BoardModel {
  final String idx, name, content;

  BoardModel.fromJson(Map<String, dynamic> json)
      : idx = json['idx'],
        name = json['name'],
        content = json['content'];
}
