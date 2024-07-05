import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nloffice_hrm/services/dio_interceptor.dart';
import 'package:nloffice_hrm/services/store.dart';

class DemoAPI {
  late final Dio _dio;
  DemoAPI() {
    _dio = Dio();
    _dio.interceptors.add(DioInterceptor());
  }
  final String _loginUrl = 'url api login';
  final String _dataUrl = 'url api login pase';

  Map<String, dynamic> get _loginData => {
        "email": "nhutlam000@gmail.com",
        "password": "123456",
      };
  Future<void> _saveToken(Map<String, dynamic> data) async {
    final token = data['data']['Token'];
    await Store.setToken(token);
  }

  String _getResult(Map<String, dynamic> json) {
    debugPrint("data received is $json");
    final List<dynamic> list = json['data'];
    return 'Received${list.length} objects';
  }

  Future<bool> dioLogin() async {
    final response = await _dio.post(
      _loginUrl,
      data: _loginData,
    );
    if (response.statusCode == 200) {
      await _saveToken(response.data);
      return true;
    }
    return false;
  }

  Future<String> dioGetData() async {
    try {
      final respose = await _dio.get(
        _dataUrl,
      );
      if (respose.statusCode == 200) {
        return _getResult(respose.data);
      }
      return respose.data as String;
    } on DioError catch (e) {
      return e.response?.data ?? 'Error ocurred';
    }
  }
}
