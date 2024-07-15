import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nloffice_hrm/constant/app_strings.dart';
import 'package:nloffice_hrm/model/project/projects_model.dart';

Future<List<Projects>> fetchListData() async {
  final response =
      await http.get(Uri.parse('${AppStrings.baseUrlApi}/projects'));
  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((data) => Projects.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}
