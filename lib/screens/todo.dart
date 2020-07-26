import 'package:flutter/material.dart';
import '../Models/todos_model.dart';
import '../services/todos_data_service.dart';

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List<Todos> _todoItems = [];
  TodosDataService _service = TodosDataService();
  // Timer _timer;
  // int _start = 10;

  // This will be called each time the + button is pressed

  Widget _buildTodoList() {
    return new ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (context, index) {
        return _buildTodoItem(_todoItems[index]);
      },
    );
  }

  Widget _buildTodoItem(Todos todos) {
    return ListTile(
        title: GestureDetector(
          onTap: () {
            todos.completed = !todos.completed;

            _service.updateTodos(id: todos.id, todo: todos);
          },
          child: Text(
            todos.task,
            style: TextStyle(
                color: Colors.grey,
                wordSpacing: 2,
                decoration: todos.completed
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
            textAlign: TextAlign.center,
          ),
        ),
        onTap: () => _promptRemoveTodoItem(todos.id));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FutureBuilder<Object>(
          future: _service.getAllTodos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _todoItems = snapshot.data;

              return _buildTodoList();
            }
            return CircularProgressIndicator();
          }),
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: _pushAddTodoScreen,
          backgroundColor: Colors.black,
          tooltip: 'Add task',
          child: const Icon(
            Icons.add,
            color: Colors.grey,
          )),
    );
  }

  void _removeTodoItem(String id) async {
    await _service.deleteTodos(id: id);
    setState(() => _todoItems.removeWhere((element) => element.id == id));
  }

// Show an alert dialog asking the user to confirm that the task is done
  void _promptRemoveTodoItem(String id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.black,
              title: Text(
                'Mark "${_todoItems.where((element) => element.id == id)}" as done?',
                style: TextStyle(color: Colors.grey),
              ),
              actions: <Widget>[
                FlatButton(
                    child: Text(
                      'CANCEL',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () => Navigator.of(context).pop()),
                FlatButton(
                    child: Text(
                      'MARK AS DONE',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () {
                      _removeTodoItem(id);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  void _addTodoItem(String task) {
    // Only add the task if the user actually entered something
    if (task != null && task.isNotEmpty) {
      Todos todo =
          Todos(completed: false, task: task, userEmail: 'hi@email.com');
      _service.createTodos(todo: todo);
      setState(() => _todoItems.add(todo));
    }
  }

  void _pushAddTodoScreen() {
    // Push this page onto the stack
    Navigator.of(context).push(
        // MaterialPageRoute will automatically animate the screen entry, as well
        // as adding a back button to close it
        new MaterialPageRoute(builder: (context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Have something to do ?'),
          backgroundColor: Colors.black,
        ),
        body: new TextField(
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
          autofocus: true,
          onSubmitted: (val) {
            _addTodoItem(val);
            Navigator.pop(context); // Close the add todo screen
          },
          decoration: new InputDecoration(
              fillColor: Colors.grey,
              hintText: 'Enter something to do...',
              contentPadding: const EdgeInsets.all(16.0)),
        ),
        backgroundColor: Colors.black,
      );
    }));
  }
}
