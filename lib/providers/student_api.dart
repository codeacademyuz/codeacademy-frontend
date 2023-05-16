import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/student.dart';

class StudentApi with ChangeNotifier {
  List<Student> _students = [];
  List<Student> get students {
    return _students;
  }

  Future<void> getStudent({int? groupId}) async {
    String path = groupId != null ? '/get-students-from-group/$groupId/' : 'student/all/';
    Uri url = Uri(
      scheme: 'https',
      host: 'codeschooluzapi.pythonanywhere.com',
      path: path,
    );

    http.Response response = await http.get(url);
    // print(response.body);

    List dataFromJson = jsonDecode(response.body);

    _students = dataFromJson.map((e) => Student.getStudent(e)).toList();
    // print(_students);
    notifyListeners();
  }

  Future<void> deleteStudent({int? groupId}) async {
    String path = groupId != null ? '/get-students-from-group/$groupId/' : 'student/all/';
    Uri url = Uri(
      scheme: 'https',
      host: 'codeschooluzapi.pythonanywhere.com',
      path: path,
    );
    // ignore: unused_local_variable
    http.Response response = await http.post(url);
  }
}
