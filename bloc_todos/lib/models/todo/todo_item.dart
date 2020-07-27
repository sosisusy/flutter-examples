class TodoItem {
  final int userId, id;
  final String title;
  final bool completed;

  TodoItem({this.id, this.userId, this.title, this.completed});
  factory TodoItem.fromJson(dynamic json) => TodoItem(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        completed: json["completed"],
      );

  TodoItem copuWith({int id, int userId, String title, bool completed}) {
    return TodoItem(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}
