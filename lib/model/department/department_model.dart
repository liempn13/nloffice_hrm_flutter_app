class Departments // phòng ban
{
  Departments(
      {this.departmentID,
      this.departmentName,
      this.enterpriseID,
      this.departmentStatus});
  String? departmentID;
  String? departmentName;
  int? enterpriseID;
  int? departmentStatus;
  //status
  factory Departments.fromJson(Map<String, dynamic> json) => Departments(
      departmentID: json["department_id"],
      departmentName: json["deparment_name"],
      enterpriseID: json["enterprise_id"],
      departmentStatus: json["deparment_status"]);
  Map<String, dynamic> toJson() => {
        "deparment_id": departmentID,
        "deparment_name": departmentName,
        "enterprise_id": enterpriseID,
        "deparment_status": departmentStatus
      };
}
