class Admin {
  String? id;
  String? name;
  String? email;
  String? imgurl;
  Admin({this.id, this.name, this.email, this.imgurl});
  Admin.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    email = map['email'];
    imgurl = map['imgurl'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'imgurl': imgurl,
    };
  }
}
