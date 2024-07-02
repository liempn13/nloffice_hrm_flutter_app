class Diplomas {
  Diplomas({this.profileId, this.diplomaName, this.diplomaId});
  String? profileId;
  String? diplomaName;
  String? diplomaId;

  factory Diplomas.fromJson(Map<String, dynamic> json) => Diplomas(
        profileId: json["profile_id"],
        diplomaName: json["diploma_name"],
        diplomaId: json["diploma_id"],
      );
  Map<String, dynamic> toJson() => {
        "profile_id": profileId,
        "account_name": diplomaName,
        "diploma_id": diplomaId
      };
}
