import 'dart:ffi';

class Decisions {
  Decisions(
      {this.decisionId, this.salaryId, this.decisionName, this.decisionStatus});

  String? decisionId;
  String? salaryId;
  String? decisionName;
  Int8? decisionStatus;

  factory Decisions.fromJson(Map<String, dynamic> json) => Decisions(
      decisionId: json["decition_id"],
      salaryId: json["salary_id"],
      decisionName: json["decition_name"],
      decisionStatus: json["decision_status"]);
  Map<String, dynamic> toJson() => {
        "decition_id": decisionId,
        "salary_id": salaryId,
        "decition_name": decisionName,
        "decition_status": decisionStatus
      };
}
