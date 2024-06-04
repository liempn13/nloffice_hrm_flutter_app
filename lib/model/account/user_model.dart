class User {
  String? name;
  String? password;
  bool sex = false; //mặc định là false là nam, true là nữ
  String? email;
  String? phone;
  String? identify; //số cccd/passport
  Set<int>? departmentCode; // mã phòng ban
  //status
  User();
}
