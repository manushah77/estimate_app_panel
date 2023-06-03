import 'package:cloud_firestore/cloud_firestore.dart';

class EstimateGiven {
  String? customerId;
  String? discountName;
  double? discount;
  String? id;
  var material;
  String? opid;
  double? payable;
  var services;
  String? status;
  double? subtotal;
  double? tax;
  bool? taxable;
  Timestamp? date;
  double? agentcommision;
  String? paidstatus;

  EstimateGiven({
    required this.customerId,
    required this.discount,
    required this.discountName,
    required this.id,
    required this.material,
    required this.opid,
    required this.payable,
    required this.services,
    required this.status,
    required this.subtotal,
    required this.tax,
    required this.taxable,
    required this.date,
    this.agentcommision,
    required this.paidstatus,
  });

  EstimateGiven.fromMap(Map<String, dynamic> map) {
    //var serv = map['services'] as List;
    //var mat = map['material'] as List;
    customerId = map['customerid'];
    discountName = map['disName'];
    discount = double.parse(map['discount'].toString());
    id = map['id'];
    material = map['material'];
    //material = mat.map((e) => e).toList();
    opid = map['opid'];
    payable = double.parse(map['payable'].toString());
    services = map['services'];
    //services = serv.map((e) => e).toList();
    status = map['status'];
    subtotal = double.parse(map['subtotal'].toString());
    tax = double.parse(map['tax'].toString());
    taxable = map['texable'];
    date = map['date'];
    agentcommision = double.parse(map['agentcommision'].toString());
    paidstatus = map['paidstatus'];
  }
}
