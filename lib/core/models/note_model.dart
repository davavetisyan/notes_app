class NoteModel {
  final String? title;
  final String? content;
  final int? color;

  NoteModel({this.title, this.content, this.color});

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      title: json['title'],
      content: json['content'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'color': color,
      };
}
