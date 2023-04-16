class Items {
  Items({
      this.id, 
      this.name, 
      this.price, 
      this.quantity,
  });

  Items.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
  }
  String? id;
  String? name;
  double? price;
  int? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['price'] = price;
    map['quantity'] = quantity;
    return map;
  }

}