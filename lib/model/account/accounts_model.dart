import 'dart:convert';
import 'dart:ffi';

class Accounts {
  int? accountId;
  int? enterpriseId;
  int? permission; // mặc định 0 là superadmin, 1 là admin, 2 là nhân viên
  int? accountStatus;
  String? username;
  String? password;
  Accounts(
      {this.accountId,
      this.enterpriseId,
      this.permission,
      this.accountStatus,
      this.username,
      this.password});

  factory Accounts.fromJson(Map<String, dynamic> json) {
    return Accounts(
      accountId: json["account_id"],
      enterpriseId: json["enterprise_id"],
      permission: json["permission"],
      accountStatus: json["account_status"],
      username: json["username"].toString(),
      password: json["password"].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["account_id"] = accountId;
    map["enterprise_id"] = enterpriseId;
    map["permission"] = permission;
    map["account_status"] = accountStatus;
    map["username"] = username;
    map["password"] = password;
    return map;
  }
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
      data: json["data"] != null ? Accounts.fromJson(json["data"]) : null,
      laravelValidationError: json["error"] != null
          ? LaravelValidationError.fromJson(json["error"])
          : null);

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        // "data": data!.toJson(),
      };
}

class LaravelValidationError {
  // kiểm tra người dùng nhập đăng nhập với API
  final String? username;
  final String? password;

  LaravelValidationError({this.username, this.password});

  factory LaravelValidationError.fromJson(Map<String, dynamic> json) {
    return LaravelValidationError(
        username: json["username"] != null ? json["username"][0] : null,
        password: json["password"] != null ? json["password"][0] : null);
  }
}
