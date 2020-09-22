import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app/models/studentModel.dart';
import 'package:app/services/webservice.dart';

class StudentListState extends State<StudentList> {
  List<StudentModel> _studentModels = List<StudentModel>();

  @override
  void initState() {
    super.initState();
    _populateStudentModels();
  }

  void _populateStudentModels() {
    Webservice().load(StudentModel.all).then((studentModels) => {
          setState(() => {_studentModels = studentModels})
        });
  }

  ListTile _buildItemsForListView(BuildContext context, int index) {
    return ListTile(
      title: Image.network(_studentModels[index].image),
      subtitle: Text(
          _studentModels[index].first_name +
              " " +
              _studentModels[index].last_name,
          style: TextStyle(fontSize: 18)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Yalies.io'),
        ),
        body: ListView.builder(
          itemCount: _studentModels.length,
          itemBuilder: _buildItemsForListView,
        ));
  }
}

class StudentList extends StatefulWidget {
  @override
  createState() => StudentListState();
}
