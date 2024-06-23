import 'dart:ffi';

class Positions {
  Positions({this.positionId, this.positionName, this.enterpriseId});
  String? positionId;
  String? positionName;
  int? enterpriseId;

  factory Positions.fromJson(Map<String, dynamic> json) => Positions(
      positionId: json["position_id"],
      positionName: json["position_name"],
      enterpriseId: json["enterprise_id"]);
  Map<String, dynamic> toJson() => {
        "position_id": positionId,
        "position_name": positionName,
        "enterprise_id": enterpriseId,
      };
}
