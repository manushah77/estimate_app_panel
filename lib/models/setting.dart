class AddSetting {
  String? id;
  double? commision;
  double? tax;
  AddSetting({required this.id, required this.commision, required this.tax});
  AddSetting.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    commision = double.parse(map['commision'].toString());
    tax = double.parse(map['tax'].toString());
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'commision': commision,
      'tax': tax,
    };
  }
}
