import 'package:flutter/material.dart';

class ProductAttributes {
  late String size;
  late Color color;
  late int quantity;
  late bool status;

  ProductAttributes({
    required this.size,
    required this.color,
    required this.quantity,
    required this.status,
  });

  ProductAttributes.fromJson(Map<String, dynamic> json) {
    size = json["size"];
    color = json["color"];
    quantity = json["quantity"];
    status = json["status"];
  }

  Map<String, dynamic> toMap() {
    return {
      "size": size,
      "color": color,
      "quantity": quantity,
      "status": status,
    };
  }
}
