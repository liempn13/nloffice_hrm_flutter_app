class Diplomas {
  Diplomas({this.accountId, this.accountName, this.diplomaId});
  String? accountId;
  String? accountName;
  String? diplomaId;

  factory Diplomas.fromJson(Map<String, dynamic> json) => Diplomas(
        accountId: json["account_id"],
        accountName: json["account_name"],
        diplomaId: json["diploma_id"],
      );
  Map<String, dynamic> toJson() => {
        "account_id": accountId,
        "account_name": accountName,
        "diploma_id": diplomaId
      };
}
