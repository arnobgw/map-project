import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Finance'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
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
