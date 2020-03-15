import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String stateText;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fever',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fever'),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.topCenter,
          child: ListView(
            children: <Widget>[
              (stateText != null) ? Text(stateText) : Container(),
              SizedBox(height: 4.0),
              RaisedButton(
                child: Text('What is your temperature?'),
                onPressed: () {
                  showPickerNumber(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showPickerNumber(BuildContext context) {
  Picker(
      adapter: NumberPickerAdapter(data: [
        NumberPickerColumn(
            begin: 970,
            end: 1050,
            postfix: Text(""),
            suffix: Text(" F"),
            onFormatValue: (v) {
              return (v / 10).toString();
            }),
      ]),
      hideHeader: true,
      title: Text("Please Select"),
      selectedTextStyle: TextStyle(color: Colors.blue),
      onConfirm: (Picker picker, List value) {
        print(value.toString());
        print(picker.getSelectedValues());
      }).showDialog(context);
}
