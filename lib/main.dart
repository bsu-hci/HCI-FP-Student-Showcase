import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CCSC MW',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'CCSC MW'),
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
  String scoreValue;
  List<String> names = [];
  TextEditingController notesText = new TextEditingController();

  void _submitStudentScore() {
    setState(() {
      if (dropdownValue == null || scoreValue == null) {
        errorMessage =
            "Sorry, you need to select a student and a rating to submit a score.";
      }
      errorMessage = "";
      names.add(dropdownValue +
          " | Score: " +
          scoreValue +
          " | Notes: " +
          notesText.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(80.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Column(
                  children: <Widget>[
                    Text('Select a student:', style: TextStyle(fontSize: 20)),
                    DropdownButton<String>(
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
                    ),
                    RaisedButton(
                      onPressed: () => {},
                      child: const Text("Click here to download submission",
                          style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      width: 300,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Flexible(
                            child: Text('Select a student:',
                                style: TextStyle(fontSize: 20)),
                          ),
                          new Flexible(
                            child: DropdownButton<String>(
                              value: scoreValue,
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
                                  scoreValue = newValue;
                                });
                              },
                              items: <String>[
                                '5 - Excellent',
                                '4 - Good',
                                '3 - Fair',
                                '2 - Poor',
                                '1 - Very Poor'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Row(children: <Widget>[
                      new Flexible(
                        child: TextField(
                          controller: notesText,
                          maxLines: 2,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 3.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 3.0),
                              ),
                              hintText:
                                  "Enter your any notes for the student here."),
                        ),
                      )
                    ]),
                    const SizedBox(height: 30),
                    Text(errorMessage, style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 30),
                    RaisedButton(
                      onPressed: _submitStudentScore,
                      child:
                          const Text('Submit', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: <Widget>[
                    Text('Completed Students', style: TextStyle(fontSize: 20)),
                    Expanded(
                      child: ListView.builder(
                          itemCount: names.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                onTap: () {},
                                title: Text(names[index]),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
