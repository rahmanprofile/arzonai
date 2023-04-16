import 'WishlistItems.dart';

class WishlistModel {
  WishlistModel({
    this.wishlistId,
    this.customerId,
    this.wishlistItems,
  });

  WishlistModel.fromJson(dynamic json) {
    wishlistId = json['wishlist_id'];
    customerId = json['customer_id'];
    if (json['wishlist_items'] != null) {
      wishlistItems = [];
      json['wishlist_items'].forEach((v) {
        wishlistItems!.add(WishlistItems.fromJson(v));
      });
    }
  }
  String? wishlistId;
  String? customerId;
  List<WishlistItems>? wishlistItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wishlist_id'] = wishlistId;
    map['customer_id'] = customerId;
    if (wishlistItems != null) {
      map['wishlist_items'] = wishlistItems!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
