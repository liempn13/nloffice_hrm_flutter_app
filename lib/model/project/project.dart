import 'dart:ffi';

class Projects {
  Projects(
      {this.projectId,
      this.projectName,
      this.projectStatus,
      this.departmentId});
  String? projectId;
  String? projectName;
  Int8? projectStatus;
  String? departmentId;
  factory Projects.fromJson(Map<String, dynamic> json) => Projects(
      projectId: json["project_id"],
      projectName: json["project_name"],
      projectStatus: json["project_status"],
      departmentId: json["deparment_id"]);
  Map<String, dynamic> toJson() => {
        "project_id": projectId,
        "project_name": projectName,
        "project_status": projectStatus,
        "deparment_id": departmentId,
      };
}
