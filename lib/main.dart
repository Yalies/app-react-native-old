import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yalies/widgets/studentList.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Yalies",
        theme: ThemeData(primaryColor: Color.fromRGBO(15, 77, 146, 1)),
        home: StudentList());
  }
}
