import 'dart:convert';
import 'package:yalies/services/webservice.dart';
import 'package:yalies/utils/constants.dart';

class StudentModel {
  final String access_code,
      address,
      birthday,
      building_code,
      college,
      email,
      entryway;
  final String first_name,
      major,
      netid,
      phone,
      pronoun,
      residence,
      room,
      state,
      last_name,
      image;
  final int floor, id, image_id, suite, upi, year;
  final bool leave;

  StudentModel(
      {this.access_code,
      this.address,
      this.birthday,
      this.building_code,
      this.college,
      this.email,
      this.entryway,
      this.first_name,
      this.floor,
      this.id,
      this.image_id,
      this.last_name,
      this.leave,
      this.major,
      this.netid,
      this.phone,
      this.pronoun,
      this.residence,
      this.room,
      this.state,
      this.suite,
      this.upi,
      this.year,
      this.image});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return new StudentModel(
        access_code: json["access_code"],
        address: json["address"],
        birthday: json["birthday"],
        building_code: json["building_code"],
        college: json["college"],
        email: json["email"],
        entryway: json["entryway"],
        floor: json["floor"],
        first_name: json["first_name"],
        id: json["id"],
        image_id: json["image_id"],
        leave: json["leave"],
        major: json["major"],
        netid: json["netid"],
        phone: json["phone"],
        pronoun: json["pronoun"],
        residence: json["residence"],
        room: json["room"],
        state: json["state"],
        suite: json["suite"],
        last_name: json["last_name"],
        upi: json["upi"],
        year: json["year"],
        image: json["image"]);
  }

  static Resource<List<StudentModel>> get all {
    return Resource(
        url: Constants.API_URL,
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result.toList();
          return list.map((model) => StudentModel.fromJson(model)).toList();
        });
  }
}
