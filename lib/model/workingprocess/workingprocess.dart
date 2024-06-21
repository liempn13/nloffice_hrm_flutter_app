
import 'dart:ffi';

class Workingprocess {
  Workingprocess(
      {this.workingprocessId,
      this.profileId,
      this.workingprocessWorkplace,
      this.workingprocessContent,
      this.workingprocessStarttime,
      this.workingprocessEndtime,
      this.workingprocessStatus});
  String? workingprocessId;
  String? profileId;
  String? workingprocessWorkplace;
  String? workingprocessContent;
  DateTime? workingprocessStarttime;
  DateTime? workingprocessEndtime;
  Int8? workingprocessStatus;

  factory Workingprocess.fromJson(Map<String, dynamic> json) => Workingprocess(
        workingprocessId: json["workingprocess_id "],
        profileId: json["profile_id "],
        workingprocessWorkplace: json["workingprocess_workplace"],
        workingprocessContent: json["workingprocess_content"],
        workingprocessStarttime: json["workingprocess_starttime"],
        workingprocessEndtime: json["workingprocess_endtime"],
        workingprocessStatus: json["workingprocess_status"],
      );
  Map<String, dynamic> toJson() => {
    "workingprocess_id ":workingprocessId,
    "profile_id ":profileId,
    "workingprocess_workplace":workingprocessWorkplace,
    "workingprocess_content":workingprocessContent,
    "workingprocess_starttime":workingprocessStarttime,
    "workingprocess_endtime":workingprocessEndtime,
    "workingprocess_status":workingprocessStatus,

  };
}
