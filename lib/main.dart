import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CCSC MW - Judge Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'CCSC MW - Judge Panel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String errorMessage = "";
  String dropdownValue;
  List<String> names = ['Michael H.', 'Larry K.', 'Tina S.', 'George G.'];
  var completedStudents = new List();
  TextEditingController scoreTextField = new TextEditingController();

  void _doNothing() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Column(
              children: <Widget>[
                Text('Select a student:', style: TextStyle(fontSize: 20)),
                Container(
                    width: 200,
                    margin: const EdgeInsets.all(20.0),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>[
                        'Michael H.',
                        'Larry K.',
                        'Tina S.',
                        'George G.'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                RaisedButton(
                  onPressed: _doNothing,
                  child: const Text("Click here to download submission",
                      style: TextStyle(fontSize: 20)),
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  width: 150.0,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Flexible(
                        child: TextFormField(
                          controller: scoreTextField,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Score out of 5',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: _doNothing,
                  child: const Text('Submit', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: <Widget>[],
            ),
          ),
        ],
      ),
    );
  }
}
