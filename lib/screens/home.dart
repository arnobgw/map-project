import 'package:flutter/material.dart';
import 'package:map_project/models/journal_model.dart';
import 'package:map_project/screens/Dashboard.dart';
import 'package:map_project/services/journal_data_service.dart';

import '../Models/user_model.dart';
import 'ViewJournal.dart';

class Home extends StatefulWidget {
  final User data;
  const Home(this.data);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Journal> jorunalz = List();
  bool check = false;

  Future<List<Journal>> _futureData;
  String m;

  @override
  void initState() {
    _futureData = dataService.getAllJournals();
    super.initState();
  }

  void update() {
    setState(() {
      _futureData = dataService.getAllJournals();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Journal>>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            jorunalz = snapshot.data;
            if (jorunalz.length > 0)
              return _buildScaffold();
            else {
              check = true;
              return _buildScaffold();
            }
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
    if (widget.data.cost > widget.data.budget) {
      m = "Not doing well";
    } else
      m = "Doing Well";
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Text(
                    'Journals',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.grey[700],
                    ),
                  ),
                  Container(
                    height: 200,
                    color: Colors.white,
                    child: check
                        ? Text("No Journal Posted Yet.")
                        : ListView.separated(
                            itemCount: jorunalz.length,
                            separatorBuilder: (context, index) => Divider(
                              color: Colors.blueGrey,
                            ),
                            itemBuilder: (context, index) => ListTile(
                                title: Text(
                                  jorunalz[index].title,
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(
                                  "by ${jorunalz[index].userName}",
                                  style: TextStyle(color: Colors.black38),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TaskListScreen(index)));
                                },
                                trailing: jorunalz[index].userEmail ==
                                        widget.data.email
                                    ? _buildDeleteButton(jorunalz[index].id)
                                    : null),
                          ),
                  ),
                  Container(
                      margin: new EdgeInsets.all(3.0),
                      width: 400,
                      height: 100,
                      padding: EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Colors.black, Colors.black45])),
                      child: Text(
                        "Happiness : " + m,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Lobster'),
                      )),
                  makeDashboardItem4(
                      "Debit : " +
                          (widget.data.budget - widget.data.cost).toString(),
                      Icons.shopping_basket),
                ],
              ),
            )));
  }

  Card makeDashboardItem4(String title, IconData icon) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 3.0,
        margin: new EdgeInsets.all(3.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue, Colors.red])),
          child: new InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Dashboard(widget.data)));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 60.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 30.0, color: Colors.white)),
                ),
                Center(
                    child: Icon(
                  icon,
                  size: 60.0,
                  color: Colors.white,
                )),
              ],
            ),
          ),
        ));
  }

  Widget _buildDeleteButton(String index) {
    return IconButton(
      icon: Icon(
        Icons.delete_forever,
        color: Colors.red,
        size: 35,
      ),
      onPressed: () async {
        await dataService.deleteJournal(id: index);
        update();
      },
    );
  }
}

final dataService = JournalDataService();
