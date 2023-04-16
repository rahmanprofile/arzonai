import 'address.dart';
import 'orders.dart';

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.address,
    this.phone,
    this.orders,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    phone = json['phone'];
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }
  String? id;
  String? name;
  String? email;
  Address? address;
  String? phone;
  List<Orders>? orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    if (address != null) {
      map['address'] = address!.toJson();
    }
    map['phone'] = phone;
    if (orders != null) {
      map['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
