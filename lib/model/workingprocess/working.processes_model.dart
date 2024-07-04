class WorkingProcesses {
  WorkingProcesses(
      {this.workingprocessId,
      this.profileId,
      this.workingprocessWorkplace,
      this.workingprocessContent,
      this.workingprocessStarttime,
      this.workingprocessEndtime,
      this.enterpriseId,
      this.workingprocessStatus});
  String? workingprocessId;
  String? profileId;
  String? workingprocessWorkplace;
  String? workingprocessContent;
  DateTime? workingprocessStarttime;
  DateTime? workingprocessEndtime;
  int? enterpriseId;
  int? workingprocessStatus;

  factory WorkingProcesses.fromJson(Map<String, dynamic> json) =>
      WorkingProcesses(
        workingprocessId: json["workingprocess_id "],
        profileId: json["profile_id "],
        workingprocessWorkplace: json["workingprocess_workplace"],
        workingprocessContent: json["workingprocess_content"],
        workingprocessStarttime: json["workingprocess_starttime"],
        workingprocessEndtime: json["workingprocess_endtime"],
        enterpriseId: json["enterprise_id"],
        workingprocessStatus: json["workingprocess_status"],
      );
  Map<String, dynamic> toJson() => {
        "workingprocess_id ": workingprocessId,
        "profile_id ": profileId,
        "workingprocess_workplace": workingprocessWorkplace,
        "workingprocess_content": workingprocessContent,
        "workingprocess_starttime": workingprocessStarttime,
        "workingprocess_endtime": workingprocessEndtime,
        "enterprise_id": enterpriseId,
        "workingprocess_status": workingprocessStatus,
      };
}
