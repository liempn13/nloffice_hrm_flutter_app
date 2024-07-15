import 'dart:convert';

import 'package:nloffice_hrm/constant/app_strings.dart';
import 'package:nloffice_hrm/model/decision/decisions_model.dart';
import 'package:http/http.dart' as http;

Future<List<Decisions>> fetchListData() async {
  final response =
      await http.get(Uri.parse('${AppStrings.baseUrlApi}/decisions'));
  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((data) => Decisions.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}
