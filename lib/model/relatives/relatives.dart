class Relatives {
  Relatives(
      {this.accountId,
      this.relativesName,
      this.relativesPhone,
      this.relativesBirthday});
  String? accountId;
  String? relativesName;
  String? relativesPhone;
  String? relativesBirthday;
  factory Relatives.fromJson(Map<String, dynamic> json) => Relatives(
        accountId: json["account_id"],
        relativesName: json["relatives_name"],
        relativesPhone: json["relatives_phone"],
        relativesBirthday: json["relatives_birthday"],
      );
  Map<String, dynamic> toJson() => {
        "account_id": accountId,
        "relatives_name": relativesName,
        "relatives_phone": relativesPhone,
        "relatives_birthday": relativesBirthday
      };
}
