import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nloffice_hrm/constant/app_strings.dart';
import 'package:nloffice_hrm/model/diploma/diplomas_model.dart';

Future<List<Diplomas>> fetchListData() async {
  final response =
      await http.get(Uri.parse('${AppStrings.baseUrlApi}/diplomas'));
  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((data) => Diplomas.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}
