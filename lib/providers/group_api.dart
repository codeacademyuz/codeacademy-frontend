import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/group.dart';

class GroupApi with ChangeNotifier {
  List<Group> _groups = [];
  List<Group> get groups {
    return [..._groups];
  }

  Future<List<Group>> getGroup(int id) async {
    Uri url = Uri.parse('https://lmsapi.pythonanywhere.com/group/$id/');
    http.Response response = await http.get(url);
    List dataFromJson = jsonDecode(response.body);
    _groups = dataFromJson.map((e) => Group.getGroup(e)).toList();

    return _groups;
  }
}
