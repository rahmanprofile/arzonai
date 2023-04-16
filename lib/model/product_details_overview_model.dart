

import 'package:bwi_shopify/model/product_attributes.dart';
import 'package:bwi_shopify/model/product_image_model.dart';

class ProductDetailsOverviewModel {
  late int productId;
  late String productName;
  late String productDescription;
  late double productPrice;
  late String category;
  late String currency;
  late List<ProductImageModel> productImage;
  late List<ProductAttributes> productAttributes;

  ProductDetailsOverviewModel.fromJson(Map<String, dynamic> json) {
    productId = json["productId"];
    productName = json["productName"];
    productDescription = json["productDescription"];
    productPrice = json["productPrice"];
    category = json["category"];
    currency = json["currency"];
    productImage = json["productImage"];
    productAttributes = json["productAttributes"];
  }

  Map<String, dynamic> toMap() {
    return {
      "productId": productId,
      "productName": productName,
      "productDescription": productDescription,
      "productPrice": productPrice,
      "category": category,
      "currency": currency,
      "productImage": productImage,
      "productAttributes": productAttributes,
    };
  }
}
