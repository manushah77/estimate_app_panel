class Approvals {
  String? id;
  String? email;
  String? userName;
  String? opid;
  String? approveby;
  String? photo;
  bool? active;
  Approvals(
      {this.id,
      this.email,
      this.userName,
      this.opid,
      this.approveby,
      this.photo,
      this.active});
  Approvals.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    email = map['email'];
    userName = map['userName'];
    opid = map['opid'];
    approveby = map['approveby'];
    photo = map['photo'];
    active = map['active'];
  }
}
