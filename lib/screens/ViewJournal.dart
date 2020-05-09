import 'package:flutter/material.dart';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:map_project/models/todo.dart';
import 'package:map_project/models/Task.dart';
import 'package:map_project/models/mock_Data.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Journal"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.black,
            padding: EdgeInsets.all(35),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Journal Title",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Lobster'),
                  ),
                  Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "In following code segment after inspection we see that the things we are looking for , first elements are after what we will learn header , these elements are declared as ul as we can see from the website . So we will need to find ul’s . soup.news.fund(“ul”) does that for us . in the next line of code we declare the specific division we are looking for . Then we have find all the lists inside the ul , so we will use find.all operator to find them . Next we will encode the next in a desired format . Repeat the same process for course description .",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Lobster'),
                      )),
                  Container(
                    padding: EdgeInsets.all(40),
                    child: Text(
                      "Mood : " + "Happy",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Lobster'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Date  : " + "11-04-2020",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Lobster'),
                    ),
                  ),
                ])),
      ),
    );
  }
}
