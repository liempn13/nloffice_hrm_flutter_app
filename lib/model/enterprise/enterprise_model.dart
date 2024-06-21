import 'dart:ffi';

class Enterprises // Doanh nghiệp
{
  Enterprises(
      {this.enterpriseId,
      this.name,
      this.licenseNum,
      this.email,
      this.phone,
      this.assignDate,
      this.enterpriseStatus});
  String? enterpriseId;
  String? name;
  String? licenseNum; // số giấy phép
  String? email;
  String? phone;
  DateTime? assignDate;
  Int8? enterpriseStatus;
  factory Enterprises.formJson(Map<String, dynamic> json) => Enterprises(
      enterpriseId: json["enteprise_id"],
      name: json["name"],
      licenseNum: json["license_num"],
      email: json["email"],
      phone: json["phone"],
      assignDate: json["assign_date"],
      enterpriseStatus: json["enterprise_status"]);
  Map<String, dynamic> toJson() => {
        "enteprise_id": enterpriseId,
        "name": name,
        "license_num": licenseNum,
        "email": email,
        "phone": phone,
        "assign_date": assignDate,
        "enterprise_status": enterpriseStatus
      };
}
