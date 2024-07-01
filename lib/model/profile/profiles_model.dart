class Profiles {
  Profiles(
      {this.profileName,
      this.profileStatus = 0,
      this.idExpireDay,
      this.identifiNum,
      this.gender,
      this.phone,
      this.email,
      this.departmentId,
      this.enterpriseId,
      this.profileId,
      this.salaryId,
      this.birthday,
      this.positionId});
  String? profileName;
  int profileStatus;
  String? identifiNum;
  DateTime? idExpireDay;
  int? gender;
  String? phone;
  String? email;
  String? departmentId;
  int? enterpriseId;
  String? profileId;
  String? salaryId;
  DateTime? birthday;
  String? positionId;

  factory Profiles.fromJson(Map<String, dynamic> json) => Profiles(
      profileName: json["profile_name"],
      profileStatus: json["profile_status"],
      identifiNum: json["identifi_num"],
      gender: json["gender"],
      phone: json["phone"],
      email: json["email"],
      departmentId: json["department_id"],
      enterpriseId: json["enterprise_id"],
      profileId: json["profile_id"],
      salaryId: json["salary_id"],
      birthday: json["birthday"],
      positionId: json["position_id"]);
  Map<String, dynamic> toJson() => {
        "profile_name": profileName,
        "profile_status": profileStatus,
        "identifi_num": identifiNum,
        "gender": gender,
        "phone": phone,
        "email": email,
        "department_id": departmentId,
        "enterprise_id": enterpriseId,
        "profile_id": profileId,
        "salary_id": salaryId,
        "birthday": birthday,
        "position_id": positionId
      };
  void deactivate() {
    profileStatus = 0;
  }
}
