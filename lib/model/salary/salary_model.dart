import 'dart:ffi';


class Salarys {
  Salarys(
      {this.salaryId,
      this.salaryName,
      this.salary,
      this.allowance,
      this.status});
  int? salaryId;
  String? salaryName;
  double? salary; //hệ số lương
  double? allowance; //hệ số phụ cấp
  Int8? status;
  //status
  //Salary();
  factory Salarys.fromJson(Map<String, dynamic> json) => Salarys(
      salaryId: json["salary_id"],
      salaryName: json["salary_name"],
      salary: json["salary"],
      allowance: json["allowance"],
      status: json["salary_status"]);
  Map<String, dynamic> toJson() => {
        "salary_id": salaryId,
        "salary_name": salaryName,
        "salary": salary,
        "allowance": allowance,
        "status": status
      };
}
