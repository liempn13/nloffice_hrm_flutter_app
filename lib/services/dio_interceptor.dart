import 'package:dio/dio.dart';
import 'package:nloffice_hrm/constant/app_strings.dart';
import 'package:nloffice_hrm/services/store.dart';

Dio dio() {
  var dio = Dio(BaseOptions(
      baseUrl: AppStrings.baseUrlApi, responseType: ResponseType.json));
  return dio;
}
