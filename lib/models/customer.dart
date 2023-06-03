import 'package:cloud_firestore/cloud_firestore.dart';

class Customers {
  String? address;
  String? company;
  Timestamp? createdon;
  String? email;
  String? fname;
  String? homeNumber;
  String? id;
  String? jobTitle;
  String? lname;
  String? notes;
  String? opid;
  String? phone;
  String? pic;

  Customers(
      {required this.address,
      required this.company,
      required this.createdon,
      required this.email,
      required this.fname,
      required this.homeNumber,
      required this.id,
      required this.jobTitle,
      required this.lname,
      required this.notes,
      required this.opid,
      required this.phone,
      required this.pic});

  Customers.fromMap(Map<String, dynamic> map) {
    address = map['address'];
    company = map['company'];
    createdon = map['createdOn'];
    email = map['email'];
    fname = map['fname'];
    homeNumber = map['homeNumber'];
    id = map['id'];
    jobTitle = map['jobTitle'];
    lname = map['lname'];
    notes = map['note'];
    opid = map['opid'];
    phone = map['phone'];
    pic = map['pic'];
  }
}
