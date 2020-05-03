import 'package:flutter/material.dart';

import 'dart:async';

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List<String> _todoItems = [];
  Timer _timer;
  int _start = 10;

  // This will be called each time the + button is pressed

  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if (index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }

  Widget _buildTodoItem(String todoText, int index) {
    return new ListTile(
        title: new Text(
          todoText,
          style: TextStyle(
            color: Colors.grey,
            wordSpacing: 2,
          ),
          textAlign: TextAlign.center,
        ),
        onTap: () => _promptRemoveTodoItem(index));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildTodoList(),
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: _pushAddTodoScreen,
          backgroundColor: Colors.black,
          tooltip: 'Add task',
          child: new Icon(
            Icons.add,
            color: Colors.grey,
          )),
    );
  }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

// Show an alert dialog asking the user to confirm that the task is done
  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              backgroundColor: Colors.black,
              title: new Text(
                'Mark "${_todoItems[index]}" as done?',
                style: TextStyle(color: Colors.grey),
              ),
              actions: <Widget>[
                new FlatButton(
                    child: new Text(
                      'CANCEL',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () => Navigator.of(context).pop()),
                new FlatButton(
                    child: new Text(
                      'MARK AS DONE',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  void _addTodoItem(String task) {
    // Only add the task if the user actually entered something
    if (task.length > 0) {
      setState(() => _todoItems.add(task));
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
