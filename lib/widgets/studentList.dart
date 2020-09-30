import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yalies/models/student.dart';
import 'package:yalies/services/api.dart';

class StudentListState extends State<StudentList> {
    List<Student> _students = List<Student>();

    @override
    void initState() {
        super.initState();
        _populateStudents();
    }

    void _populateStudents() {
        API().load(Student.all).then((students) => {
            setState(() => {_students = students})
        });
    }

    ListTile _buildItemsForListView(BuildContext context, int index) {
        return ListTile(
            title: Image.network(_students[index].image),
            subtitle: Text(
                _students[index].first_name +
                " " +
                _students[index].last_name,
            style: TextStyle(fontSize: 18)),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Yalies'),
            ),
            body: ListView.builder(
                itemCount: _students.length,
                itemBuilder: _buildItemsForListView,
            )
        );
    }
}

class StudentList extends StatefulWidget {
  @override
  createState() => StudentListState();
}
