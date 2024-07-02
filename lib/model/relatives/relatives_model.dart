class Relatives {
  Relatives(
      {this.profileId,
      this.relativesName,
      this.relativesPhone,
      this.relativesBirthday});
  String? profileId;
  String? relativesName;
  String? relativesPhone;
  String? relativesBirthday;
  factory Relatives.fromJson(Map<String, dynamic> json) => Relatives(
        profileId: json["profile_id"],
        relativesName: json["relatives_name"],
        relativesPhone: json["relatives_phone"],
        relativesBirthday: json["relatives_birthday"],
      );
  Map<String, dynamic> toJson() => {
        "profile_id": profileId,
        "relatives_name": relativesName,
        "relatives_phone": relativesPhone,
        "relatives_birthday": relativesBirthday
      };
}
