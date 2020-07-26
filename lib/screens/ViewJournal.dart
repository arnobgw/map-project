import 'package:flutter/material.dart';
import 'package:map_project/models/journal_model.dart';
import 'package:map_project/models/user_model.dart';
import 'package:map_project/screens/Dashboard.dart';
import 'package:map_project/services/journal_data_service.dart';

class TaskListScreen extends StatefulWidget {
  final int data;
  const TaskListScreen(this.data);
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final dataService = JournalDataService();
  List<Journal> jorunalz;
  Future<List<Journal>> _futureData;
  String m;
  @override
  void initState() {
    super.initState();
    _futureData = dataService.getAllJournals();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Journal>>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            jorunalz = snapshot.data;
            return _buildScaffold();
          }
          return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching Data... Please wait'),
          ],
        ),
      ),
    );
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Journal"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(100),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    jorunalz[widget.data].title,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Lobster'),
                  ),
                  Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        jorunalz[widget.data].text,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
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
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Lobster'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Date  : " + DateTime.now().toString(),
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Lobster'),
                    ),
                  ),
                ])),
      ),
    );
  }
}
