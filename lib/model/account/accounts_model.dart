import 'dart:convert';
import 'dart:ffi';

class Accounts {
  Accounts(
      {this.accountId,
      this.enterpriseId,
      this.permission,
      this.accountStatus,
      this.username,
      this.password});
  String? accountId;
  int? enterpriseId;
  Int8? permission; // mặc định 0 là superadmin, 1 là admin, 2 là nhân viên
  Int8? accountStatus;
  String? username;
  String? password;
  factory Accounts.formJson(Map<String, dynamic> json) => Accounts(
      accountId: json["account_id"],
      enterpriseId: json["enterprise_id"],
      permission: json["permission"],
      accountStatus: json["account_status"],
      username: json["username"],
      password: json["password"]);
  Map<String, dynamic> toJson() => {
        "account_id": accountId,
        "enterprise_id": enterpriseId,
        "permission": permission,
        "account_status": accountStatus,
        "username": username,
        "password": password
      };
}

//
ResponseLogin responseLoginFromJson(String str) =>
    ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
  ResponseLogin(
      {this.result, this.message, this.data, this.laravelValidationError});

  bool? result;
  String? message;
  Accounts? data;
  LaravelValidationError? laravelValidationError;

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
      result: json["result"],
      message: json["message"],
      data: json["data"] != null ? Accounts.formJson(json["data"]) : null,
      laravelValidationError: json["error"] != null
          ? LaravelValidationError.formjson(json["error"])
          : null);

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "data": data!.toJson(),
      };
}

class LaravelValidationError {
  // kiểm tra người dùng nhập đăng nhập với API
  final String? email;
  final String? password;

  LaravelValidationError({this.email, this.password});

  factory LaravelValidationError.formjson(Map<String, dynamic> json) {
    return LaravelValidationError(
        email: json["email"] != null ? json["email"][0] : null,
        password: json["password"] != null ? json["password"][0] : null);
  }
}
