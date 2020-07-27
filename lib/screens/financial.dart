import 'package:flutter/material.dart';
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
        appBar: AppBar(
          title: Text('Add '),
          backgroundColor: Colors.redAccent,
          actions: <Widget>[
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.settings),
              onPressed: () {
                
              },
            ),
          ],
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
}
