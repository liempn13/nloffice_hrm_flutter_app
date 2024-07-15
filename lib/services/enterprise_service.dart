import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nloffice_hrm/constant/app_strings.dart';
import 'package:nloffice_hrm/model/enterprise/enterprises_model.dart';

Future<List<Enterprises>> fetchListData() async {
  final response =
      await http.get(Uri.parse('${AppStrings.baseUrlApi}/enterprises'));
  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((data) => Enterprises.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}
