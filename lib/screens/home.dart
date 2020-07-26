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
  final dataService = JournalDataService();
  List<Journal> jorunalz = List();
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
            for (Journal journal in snapshot.data) {
              if(journal.userEmail == widget.data.email)
                jorunalz.add(journal);
            }
            return _buildScaffold();
          }
          return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildFetchingDataScreen() {
    if (widget.data.cost > widget.data.budget) {
      m = "You are not doing well";
    } else
      m = "You are doing well";
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
                                      builder: (context) => TaskListScreen(index)));
                            },
                            trailing: _buildDeleteButton(jorunalz[index].id))),
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
                        m,
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
                SizedBox(height: 30.0),
                new Center(
                  child: new Text("Tap to see more",
                      style: new TextStyle(fontSize: 5.0, color: Colors.white)),
                ),
                SizedBox(height: 60.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 30.0, color: Colors.white)),
                ),
                Center(
                    child: Icon(
                  icon,
                  size: 90.0,
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
        dataService.deleteJournal(id: index.toString());
        setState(() {});
      },
    );
  }
}
