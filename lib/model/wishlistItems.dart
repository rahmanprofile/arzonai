class WishlistItems {
  WishlistItems({
    this.productId,
    this.productName,
    this.productPrice,
    this.productImage,
  });

  WishlistItems.fromJson(dynamic json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productImage = json['product_image'];
  }
  String? productId;
  String? productName;
  double? productPrice;
  String? productImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['product_name'] = productName;
    map['product_price'] = productPrice;
    map['product_image'] = productImage;
    return map;
  }
}
