import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nloffice_hrm/constant/app_strings.dart';
import 'package:nloffice_hrm/model/profile/profiles_model.dart';

Future<List<Profiles>> fetchListData() async {
  final response =
      await http.get(Uri.parse('${AppStrings.baseUrlApi}/profiles'));
  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((data) => Profiles.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}
