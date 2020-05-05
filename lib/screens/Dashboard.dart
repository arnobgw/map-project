import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:map_project/screens/financial.dart';
import 'package:map_project/screens/settings.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 1,
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Container(
              height: 500,
              width: 20,
              child: makeDashboardItem("5000" + "", Icons.attach_money),
            ),
            makeDashboardItem2("2000", Icons.shopping_basket),
            makeDashboardItem3("600", Icons.expand_more),
            makeDashboardItem4("1000", Icons.receipt),
            makeDashboardItem2("50", Icons.local_bar),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToSubPage(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future navigateToSubPage2(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SubPage2()));
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
                SizedBox(height: 120.0),
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

  Card makeDashboardItem(String title, IconData icon) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(150.0),
        ),
        elevation: 3.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue, Colors.red])),
          child: new InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Financial()));
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

  Card makeDashboardItem3(String title, IconData icon) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 3.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.green, Colors.yellow])),
          child: new InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TableWidget()));
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

  Card makeDashboardItem4(String title, IconData icon) {
    return Card(
        elevation: 3.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue, Colors.green])),
          child: new InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Bills()));
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

class TableWidget extends StatefulWidget {
  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  bool _isBorderEnabled = false;
  var _actionIcon = Icons.border_all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          child: Text(
            'Income',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(_actionIcon),
            onPressed: () => setState(() {
              _isBorderEnabled == false
                  ? _isBorderEnabled = true
                  : _isBorderEnabled = false;

              _isBorderEnabled
                  ? _actionIcon = Icons.border_clear
                  : _actionIcon = Icons.border_all;
            }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 12),
        child: Table(
          border: _isBorderEnabled ? TableBorder.all() : null,
          defaultVerticalAlignment: TableCellVerticalAlignment.top,
          children: <TableRow>[
            ///First table row with 3 children
            TableRow(children: <Widget>[
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  margin: EdgeInsets.all(2),
                  color: Colors.red,
                  width: 48.0,
                  height: 48.0,
                  child: Center(
                    child: Text(
                      "500  \n Research",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  margin: EdgeInsets.all(2),
                  color: Colors.orange,
                  width: 48.0,
                  height: 48.0,
                  child: Center(
                    child: Text(
                      "200  \n Innates",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  margin: EdgeInsets.all(2),
                  color: Colors.blue,
                  width: 50.0,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "200 \n University Fund",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ),
              ),
            ]),

            ///Second table row with 3 children
            TableRow(children: <Widget>[
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  margin: EdgeInsets.all(2),
                  color: Colors.lightBlue,
                  width: 48.0,
                  height: 48.0,
                  child: Center(
                    child: Text(
                      "900 \n Grab",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  margin: EdgeInsets.all(2),
                  color: Colors.green,
                  width: 48.0,
                  height: 48.0,
                  child: Center(
                    child: Text(
                      "50 \n Allowance",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  margin: EdgeInsets.all(2),
                  color: Colors.blue,
                  width: 50.0,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "10 \n Coupons",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class Bills extends StatefulWidget {
  @override
  _BillsState createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  bool _isBorderEnabled = false;
  var _actionIcon = Icons.border_all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          child: Text(
            'Bills',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(_actionIcon),
            onPressed: () => setState(() {
              _isBorderEnabled == false
                  ? _isBorderEnabled = true
                  : _isBorderEnabled = false;

              _isBorderEnabled
                  ? _actionIcon = Icons.border_clear
                  : _actionIcon = Icons.border_all;
            }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 12),
        child: Table(
          border: _isBorderEnabled ? TableBorder.all() : null,
          defaultVerticalAlignment: TableCellVerticalAlignment.top,
          children: <TableRow>[
            ///First table row with 3 children
            TableRow(children: <Widget>[
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  margin: EdgeInsets.all(2),
                  color: Colors.red,
                  width: 48.0,
                  height: 48.0,
                  child: Center(
                    child: Text(
                      "500  \n Electricity",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  margin: EdgeInsets.all(2),
                  color: Colors.orange,
                  width: 48.0,
                  height: 48.0,
                  child: Center(
                    child: Text(
                      "200  \n Innates",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  margin: EdgeInsets.all(2),
                  color: Colors.blue,
                  width: 50.0,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "100 \n Water",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ),
              ),
            ]),

            ///Second table row with 3 children
            TableRow(children: <Widget>[
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  margin: EdgeInsets.all(2),
                  color: Colors.lightBlue,
                  width: 48.0,
                  height: 48.0,
                  child: Center(
                    child: Text(
                      "100 \n Repairment Shop",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  margin: EdgeInsets.all(2),
                  color: Colors.green,
                  width: 48.0,
                  height: 48.0,
                  child: Center(
                    child: Text(
                      "50 \n Gas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  margin: EdgeInsets.all(2),
                  color: Colors.blue,
                  width: 50.0,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "10 \n Coupons",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

Future navigateToSubPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
}

class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add '),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Setting()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              textColor: Colors.white,
              color: Colors.redAccent,
              height: 300,
              minWidth: 400,
              shape: CircleBorder(
                  side: BorderSide(
                      color: Colors.white,
                      width: 4.0,
                      style: BorderStyle.solid)),
              child: Text(
                'Scan Bill',
                style: new TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 30.0),
              ),
              onPressed: () {
                //Do something
              },
            ),
            MaterialButton(
              textColor: Colors.white,
              height: 300,
              minWidth: 400,
              color: Colors.blueAccent,
              child: Text(
                'Input Spending',
                style: new TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 30.0),
              ),
              onPressed: () {
                navigateToSubPage2(context);
              },
              shape: CircleBorder(
                  side: BorderSide(
                      color: Colors.white,
                      width: 4.0,
                      style: BorderStyle.solid)),
            )
          ],
        ),
      ),
    );
  }

  Future navigateToSubPage2(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SubPage2()));
  }
}

class SubPage2 extends StatelessWidget {
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
                onPressed: () {
                  navigateToSubPage2(context);
                },
              )
            ],
          )),
    );
  }

  Future navigateToSubPage2(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
  }
}
