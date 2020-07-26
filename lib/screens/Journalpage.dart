import 'package:flutter/material.dart';
import 'package:map_project/models/journal_model.dart';
import 'package:map_project/services/journal_data_service.dart';


class Journals extends StatefulWidget {
  Journals({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _Journals createState() => _Journals();
}

@override
class _Journals extends State<Journals> {
  String value = "";
  double pi = 3.1416;
  List<Journal> jorunalz;
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final dataService = JournalDataService();
  Future<List<Journal>> _futureData;
  @override
  void initState() {
    super.initState();
    _futureData = dataService.getAllJournals();
  }

  void loadJournal() async {
    jorunalz = await _futureData;
  }

  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: myController2,
                  ),
                  TextField(
                    maxLines: 6,
                    decoration:
                        InputDecoration(labelText: 'Enter your Journal'),
                    controller: myController,
                  ),
                ])),
        floatingActionButton: FloatingActionButton(
          // When the user presses the button, show an alert dialog containing
          // the text that the user has entered into the text field.
          onPressed: () async {
            Journal x = new Journal();

            x.title = myController2.text;
            x.text = myController.text;
            await dataService.createJournal(journal: x);
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Retrieve the text the that user has entered by using the
                  // TextEditingController.

                  content: Text(myController.text),
                );
              },
            );
          },
          tooltip: 'Journal Added',
          child: Icon(Icons.text_fields),
        ));
  }
}
