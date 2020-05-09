// Define the class Todo here. The attributes are given. Complete the rest.

import 'task.dart';

class Todo {
  String title;
  List<Task> items;

  Todo(this.title, [this.items]);
  Todo.copy(Todo from)
      : this(
          from.title,
          <Task>[
            for (int i = 0; i < from.items.length; i++)
              Task.copy(from.items[i]),
          ],
        );

  double get progress =>
      (items.fold(0, (sum, item) => item.completed ? sum + 1 : sum) /
          items.length) *
      100;
}
