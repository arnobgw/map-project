import 'package:flutter/material.dart';
import 'package:map_project/models/journal_model.dart';
import 'package:map_project/models/user_model.dart';
import 'package:map_project/screens/Dashboard.dart';
import 'package:map_project/services/journal_data_service.dart';

import 'ViewJournal.dart';

class Home extends StatefulWidget {
  final User data;
  const Home(this.data);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dataService = JournalDataService();
  List<Journal> jorunalz;
  Future<List<Journal>> _futureData;

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
        body: Container(
            color: Colors.black,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 300,
                    color: Colors.black,
                    child: ListView.separated(
                      itemCount: jorunalz.length,
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.blueGrey,
                      ),
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          jorunalz[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          jorunalz[index].text,
                          style: TextStyle(color: Colors.grey),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TaskListScreen()));
                        },
                        trailing: CircleAvatar(
                          child: Text(
                            ':)',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: new EdgeInsets.all(20.0),
                      width: 500,
                      height: 100,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Colors.redAccent, Colors.green])),
                      child: Text(
                        "Overall Happiness Index is High ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Lobster'),
                      )),
                  makeDashboardItem4(
                      "Total Money Left : " +
                          (widget.data.budget - widget.data.cost).toString(),
                      Icons.shopping_basket),
                ],
              ),
            )));
  }

  Card makeDashboardItem4(String title, IconData icon) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(150.0),
        ),
        elevation: 3.0,
        margin: new EdgeInsets.all(20.0),
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
                SizedBox(height: 40.0),
                new Center(
                  child: new Text("Tap to see more",
                      style:
                          new TextStyle(fontSize: 10.0, color: Colors.white)),
                ),
                SizedBox(height: 60.0),
                Center(
                    child: Icon(
                  icon,
                  size: 90.0,
                  color: Colors.white,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 50.0, color: Colors.white)),
                )
              ],
            ),
          ),
        ));
  }
}
