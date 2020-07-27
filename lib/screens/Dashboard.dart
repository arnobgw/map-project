import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:map_project/screens/financial.dart';
import 'package:map_project/services/user_data_service.dart';

import '../Models/user_model.dart';

class Dashboard extends StatefulWidget {
  final User data;
  const Dashboard(this.data);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 8.0),
        child: GridView.count(
          crossAxisCount: 1,
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Container(
              height: 500,
              width: 20,
              child: makeDashboardItem(
                  "Budget : " + widget.data.budget.toString(),
                  Icons.attach_money),
            ),
            makeDashboardItem2(
                "Cost : " + widget.data.cost.toString(), Icons.shopping_basket),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => SubPage2(widget.data)));
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Card makeDashboardItem2(String title, IconData icon) {
    return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 3.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.greenAccent, Colors.redAccent])),
          child: new InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 100.0),
                Center(
                    child: Icon(
                  icon,
                  size: 90.0,
                  color: Colors.white,
                )),
                SizedBox(height: 10.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 30.0, color: Colors.white)),
                )
              ],
            ),
          ),
        ));
  }

  Card makeDashboardItem(String title, IconData icon) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 5.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue, Colors.red])),
          child: new InkWell(
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubPage3(widget.data)));
              setState(() {});
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 100.0),
                Center(
                    child: Icon(
                  icon,
                  size: 50.0,
                  color: Colors.white,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 30.0, color: Colors.white)),
                )
              ],
            ),
          ),
        ));
  }
}

class SubPage2 extends StatefulWidget {
  final User data;
  const SubPage2(this.data);

  @override
  _SubPage2State createState() => _SubPage2State();
}

class _SubPage2State extends State<SubPage2> {
  final cost = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Insert Bill'),
        backgroundColor: Colors.redAccent,
      ),
      body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                controller: cost,
                decoration:
                    new InputDecoration(labelText: "Enter your spending"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.redAccent,
                child: Text('Submit'),
                onPressed: () async {
                  User user = widget.data;
                  user.cost += int.parse(cost.text);
                  await UserDataService().updateUser(id: user.id, user: user);
                  Navigator.pop(context);
                },
              )
            ],
          )),
    );
  }
}

class SubPage3 extends StatefulWidget {
  final User data;
  const SubPage3(this.data);

  @override
  _SubPage3State createState() => _SubPage3State();
}

class _SubPage3State extends State<SubPage3> {
  final cost = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Insert Bill'),
        backgroundColor: Colors.redAccent,
      ),
      body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                controller: cost,
                decoration:
                    new InputDecoration(labelText: "Enter your spending"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.redAccent,
                child: Text('Submit'),
                onPressed: () async {
                  User user = widget.data;
                  user.budget += int.parse(cost.text);
                  await UserDataService().updateUser(id: user.id, user: user);
                  Navigator.pop(context);
                },
              )
            ],
          )),
    );
  }
}
