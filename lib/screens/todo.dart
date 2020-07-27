import 'package:flutter/material.dart';
import 'package:map_project/Models/user_model.dart';
import '../Models/todos_model.dart';
import '../services/todos_data_service.dart';

class TodoList extends StatefulWidget {
  final User user;
  const TodoList(this.user);

  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List<Todos> _todoItems;
  TodosDataService _service = TodosDataService();

  Future<List<Todos>> _futureData;

  Widget _buildTodoList() {
    return new ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (context, index) {
        return _todoItems[index].userEmail == widget.user.email
            ? _buildTodoItem(_todoItems[index])
            : SizedBox.shrink();
      },
    );
  }

  Widget temp(String t) {
    return Text(
      "$t",
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }

  Widget _buildTodoItem(Todos todos) {
    return ListTile(
      title: GestureDetector(
        onTap: () async {
          todos.completed = !todos.completed;
          await _service.updateTodos(id: todos.id, todo: todos);
          update();
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
        onLongPress: () async {
          _promptRemoveTodoItem(todos.id, todos.task);
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _futureData = _service.getAllTodos();
    super.initState();
  }

  void update() {
    setState(() {
      _futureData = _service.getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FutureBuilder<Object>(
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _todoItems = snapshot.data;
              return _buildTodoList();
            }
            return Center(child: CircularProgressIndicator());
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

// Show an alert dialog asking the user to confirm that the task is done
  void _promptRemoveTodoItem(String id, String task) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.black,
              title: Text(
                'Delete "$task"?',
                style: TextStyle(color: Colors.grey),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'CANCEL',
                    style: TextStyle(color: Colors.grey),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                FlatButton(
                  child: Text(
                    'MARK AS DONE',
                    style: TextStyle(color: Colors.grey),
                  ),
                  onPressed: () async {
                    await _service.deleteTodos(id: id);
                    update();
                    Navigator.pop(context);
                  },
                )
              ]);
        });
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
          onSubmitted: (val) async {
            // Only add the task if the user actually entered something
            if (val != null && val.isNotEmpty) {
              Todos todo = Todos(
                  completed: false, task: val, userEmail: widget.user.email);
              await _service.createTodos(todo: todo);
              Navigator.pop(context);
              update();
            }
          },
          // Close the add todo screen

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
