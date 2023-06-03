class Services {
  String? adminid;
  bool? active;
  String? category;
  String? description;
  String? id;
  String? service;
  String? subservice;
  double? unitPrice;
  double? serviceDiscount;

  Services({
    required this.active,
    required this.adminid,
    required this.category,
    required this.description,
    required this.id,
    required this.service,
    required this.subservice,
    required this.unitPrice,
    required this.serviceDiscount,
  });

  Services.fromMap(Map<String, dynamic> map) {
    adminid = map['adminid'];
    active = map['active'];
    category = map['category'];
    description = map['description'];
    id = map['id'];
    service = map['service'];
    subservice = map['subservice'];
    unitPrice = double.parse(map['unitPrice'].toString());
    serviceDiscount = double.parse(map['servicediscount'].toString());
  }
  Map<String, dynamic> toMap() {
    return {
      'adminid': adminid,
      'active': active,
      'category': category,
      'description': description,
      'id': id,
      'service': service,
      'subservice': subservice,
      'unitPrice': unitPrice,
      'servicediscount': serviceDiscount,
    };
  }
}
