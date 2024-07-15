// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:nloffice_hrm/constant/app_strings.dart';
// import 'package:nloffice_hrm/model/account/accounts_model.dart';

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nloffice_hrm/constant/app_strings.dart';
import 'package:nloffice_hrm/model/account/accounts_model.dart';
import 'package:http/http.dart' as http;

var _dio = Dio(BaseOptions(
  baseUrl: AppStrings.baseUrlApi,
  responseType: ResponseType.json,
));

Future<List<Accounts>> fetchListData() async {
  final response =
      await http.get(Uri.parse('${AppStrings.baseUrlApi}/accounts'));
  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((data) => Accounts.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

Future<Accounts?> createAccount({required Accounts accounts}) async {
  Accounts? retrievedAccount;
  try {
    Response response = await _dio.post(
      '${AppStrings.baseUrlApi}/accounts',
      // data: accounts.toJson(),
    );

    print('Account created: ${response.data}');

    retrievedAccount = Accounts.fromJson(response.data);
  } catch (e) {
    print('Error creating Account: $e');
  }

  return retrievedAccount;
}

Future<Accounts?> updateAccount({
  required Accounts account,
  required String id,
}) async {
  Accounts? updatedAccount;

  try {
    Response response = await _dio.put(
      AppStrings.baseUrlApi + '/accounts/$id',
      // data: account.toJson(),
    );

    print('User updated: ${response.data}');

    updatedAccount = Accounts.fromJson(response.data);
  } catch (e) {
    print('Error updating Account: $e');
  }

  return updatedAccount;
}

Future<Accounts?> changePassword({
  required Accounts account,
  required String id,
}) async {
  Accounts? updatedAccount;

  try {
    Response response = await _dio.put(
      AppStrings.baseUrlApi + '/accounts/$id',
      // data: account.toJson(),
    );

    print('User updated: ${response.data}');

    updatedAccount = Accounts.fromJson(response.data);
  } catch (e) {
    print('Error updating Account: $e');
  }

  return updatedAccount;
}
