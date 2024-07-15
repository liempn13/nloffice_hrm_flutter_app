import 'dart:ffi';

class Decisions {
  Decisions(
      {this.decisionId,
      this.salaryId,
      this.decisionName,
      this.enterpriseId,
      this.decisionStatus});

  String? decisionId;
  String? salaryId;
  String? decisionName;
  int? enterpriseId;
  Int8? decisionStatus;

  factory Decisions.fromJson(Map<String, dynamic> json) => Decisions(
      decisionId: json["decision_id"],
      salaryId: json["salary_id"],
      decisionName: json["decision_name"],
      enterpriseId: json["enterprise_id"],
      decisionStatus: json["decision_status"]);

  Map<String, dynamic> toJson() => {
        "decision_id": decisionId,
        "salary_id": salaryId,
        "decision_name": decisionName,
        "enterprise_id": enterpriseId,
        "decision_status": decisionStatus
      };
}
