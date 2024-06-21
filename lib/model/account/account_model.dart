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
  String? enterpriseId;
  Int8? permission;
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
