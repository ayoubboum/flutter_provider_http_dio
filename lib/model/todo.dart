class TodosList {
  final List<Todo> todos;

  TodosList({
    this.todos,
  });

  factory TodosList.fromJson(List<dynamic> parsedJson) {
    List<Todo> todos = List<Todo>();
    todos = parsedJson.map((i) => Todo.fromJson(i)).toList();
    return TodosList(
      todos: todos,
    );
  }
}

class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo({this.userId, this.id, this.title, bool completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
