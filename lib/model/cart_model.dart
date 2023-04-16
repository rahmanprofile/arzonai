import 'Items.dart';

class CartModel {
  CartModel({
    this.cartId,
    this.items,
    this.subtotal,
    this.tax,
    this.total,
  });

  CartModel.fromJson(dynamic json) {
    cartId = json['cart_id'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    subtotal = json['subtotal'];
    tax = json['tax'];
    total = json['total'];
  }
  String? cartId;
  List<Items>? items;
  double? subtotal;
  double? tax;
  double? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cart_id'] = cartId;
    if (items != null) {
      map['items'] = items!.map((v) => v.toJson()).toList();
    }
    map['subtotal'] = subtotal;
    map['tax'] = tax;
    map['total'] = total;
    return map;
  }
}
