class Todos {
  String id;
  String userEmail;
  String task;
  bool completed;

  Todos({this.id, this.userEmail, this.task, this.completed});
  Todos.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'].toString(),
            userEmail: json['userEmail'].toString(),
            task: json['task'],
            completed: json['completed']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'userEmail': userEmail, 'task': task, 'completed': completed};
}
