class Materials {
  bool? active;
  String? category;
  String? description;
  String? id;
  String? material;

  double? unitPrice;
  double? materialDiscount;

  Materials({
    required this.active,
    required this.category,
    required this.description,
    required this.id,
    required this.material,
    required this.unitPrice,
    required this.materialDiscount,
  });

  Materials.fromMap(Map<String, dynamic> map) {
    active = map['active'];
    category = map['category'];
    description = map['description'];
    id = map['id'];
    material = map['material'];

    unitPrice = double.parse(map['unitPrice'].toString());
    materialDiscount = double.parse(map['materialdiscount'].toString());
  }
  Map<String, dynamic> toMap() {
    return {
      'active': active,
      'category': category,
      'description': description,
      'id': id,
      'material': material,
      'unitPrice': unitPrice,
      'materialdiscount': materialDiscount,
    };
  }
}
