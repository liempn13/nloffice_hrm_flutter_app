import 'dart:ffi';

class Departments // phòng ban
{
  Departments({this.departmentID, this.departmentName, this.departmentStatus});
  String? departmentID;
  String? departmentName;
  Int8? departmentStatus;
  //status
  factory Departments.fromJson(Map<String, dynamic> json) => Departments(
      departmentID: json["department_id"],
      departmentName: json["deparment_name"],
      departmentStatus: json["deparment_status"]);
  Map<String, dynamic> toJson() => {
        "deparment_id": departmentID,
        "deparment_name": departmentName,
        "deparment_status": departmentStatus
      };
}
