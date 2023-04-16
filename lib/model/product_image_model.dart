class ProductImageModel {
  late String imageUrl1;
  String? imageUrl2;
  String? imageUrl3;
  String? imageUrl4;
  String? imageUrl5;

  ProductImageModel({
    required this.imageUrl1,
    this.imageUrl2,
    this.imageUrl3,
    this.imageUrl4,
    this.imageUrl5,
  });

  ProductImageModel.fromJson(Map<String, dynamic> json) {
    imageUrl1 = json["imageUrl1"];
    imageUrl2 = json["imageUrl2"];
    imageUrl3 = json["imageUrl3"];
    imageUrl4 = json["imageUrl4"];
    imageUrl5 = json["imageUrl5"];
  }

  Map<String, dynamic> toMap() {
    return {
      "imageUrl1": imageUrl1,
      "imageUrl2": imageUrl2,
      "imageUrl3": imageUrl3,
      "imageUrl4": imageUrl4,
      "imageUrl5": imageUrl5,
    };
  }
}
