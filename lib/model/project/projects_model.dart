class Projects {
  Projects(
      {this.projectId,
      this.projectName,
      this.projectStatus,
      this.enterpriseId,
      this.departmentId});
  String? projectId;
  String? projectName;
  int? projectStatus;
  int? enterpriseId;
  String? departmentId;
  factory Projects.fromJson(Map<String, dynamic> json) => Projects(
      projectId: json["project_id"],
      projectName: json["project_name"],
      projectStatus: json["project_status"],
      enterpriseId: json["enterprise_id"],
      departmentId: json["deparment_id"]);
  Map<String, dynamic> toJson() => {
        "project_id": projectId,
        "project_name": projectName,
        "project_status": projectStatus,
        "enterprise_id": enterpriseId,
        "deparment_id": departmentId,
      };
}
