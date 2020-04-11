import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

class Financial extends StatefulWidget {
  Financial({Key key}) : super(key: key);
  @override
  _FinancialState createState() => _FinancialState();
}

class _FinancialState extends State<Financial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateToSubPage(context);
          },
          child: Icon(Icons.add),
        ),
        drawer: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20.0),
          child: Table(
            border: TableBorder.all(color: Colors.black),
            children: [
              TableRow(children: [
                Text('Date'),
                Text('Amount (RM)'),
                Text('Where'),
              ]),
              TableRow(children: [
                Text('23/01/2020'),
                Text('200'),
                Text('Aeon Skt'),
              ]),
              TableRow(children: [
                Text('23/01/2020'),
                Text('200'),
                Text('Aeon Skt'),
              ]),
              TableRow(children: [
                Text('23/01/2020'),
                Text('200'),
                Text('Aeon Skt'),
              ]),
              TableRow(children: [
                Text('23/01/2020'),
                Text('200'),
                Text('Aeon Skt'),
              ]),
              TableRow(children: [
                Text('23/01/2020'),
                Text('200'),
                Text('Aeon Skt'),
              ])
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            //ROW 1
            children: [
              SizedBox(
                height: 5,
              ),
              Text('Spendings Last Week'),
              Container(
                child: Echarts(
                  option: '''
    {
      xAxis: {
         
        type: 'category',
        data: ['2002', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      },
      yAxis: {
        type: 'value'
      },
       color: ['#3398DB'],
      series: [{
        data: [8200, 2000, 901, 934, 1290, 1330, 1320],
        type: 'bar'
      }]
    }
  ''',
                ),
                width: 400,
                height: 300,
                alignment: Alignment.center,
              ),
              Text('Spendings Last Week'),
              Container(
                child: Echarts(
                  option: '''
    {
      xAxis: {
        type: 'category',
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      },
      yAxis: {
        type: 'value'
      },
      series: [{
        data: [8200, 2000, 901, 934, 1290, 1330, 1320],
        type: 'line'
        
     
      }]
    }
  ''',
                ),
                width: 400,
                height: 300,
                alignment: Alignment.center,
              ),
              Text('Spendings by Type'),
              Container(
                child: Echarts(
                  option: '''
    {
      xAxis: {
        
        type: 'category',
        data: ['Heavy (1000+)', 'Mid(<1000)', 'Light(<100)']
      },
      yAxis: {
        type: 'value'
      },
      series: [{
        data: [8200, 2000, 901],
        type: 'pie'
      }]
    }
  ''',
                ),
                width: 400,
                height: 300,
                alignment: Alignment.center,
              ),
            ],
          ),

          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
  }
}

class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Page'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              textColor: Colors.white,
              color: Colors.redAccent,
              child: Text('Scan document'),
              onPressed: () {
                // TODO
              },
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.redAccent,
              child: Text('Input Spending'),
              onPressed: () {
                navigateToSubPage2(context);
              },
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
        title: Text('Sub Page'),
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
