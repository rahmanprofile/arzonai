import 'package:bwi_shopify/controller/constant.dart';
import 'package:flutter/material.dart';

class DummyData {
  String? name;
  double? discountPrice;
  double? realPrice;
  String? imageUrl;
  String? category;
  int? quantity;

  DummyData(
      {required this.name,
      required this.discountPrice,
      required this.realPrice,
      required this.imageUrl,
        required this.category,
        required this.quantity,
      });

  DummyData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    discountPrice = json['discountPrice'];
    realPrice = json['realPrice'];
    imageUrl = json['imageUrl'];
    category = json['category'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['discountPrice'] = discountPrice;
    data['realPrice'] = realPrice;
    data['imageUrl'] = imageUrl;
    data['category'] = category;
    data['quantity'] = quantity;
    return data;
  }
}

class FakeData extends ChangeNotifier {
  List<DummyData> dummyData = [

    //Shoulder Bags Category
    DummyData(quantity: 1, name: "TAN SHOULDER BAG", discountPrice: 1200.00, realPrice: 750.00, imageUrl: "assets/cate/shoulder1.webp", category: "Shoulder Bags"),
    DummyData(quantity: 1,name: "KNITTED SHOULDER BAG", discountPrice: 1200.00, realPrice: 900.00, imageUrl: "assets/cate/shoulder2.webp", category: "Shoulder Bags"),
    DummyData(quantity: 1,name: "Peacock shoulder bag", discountPrice: 1000.00, realPrice: 750.00, imageUrl: "assets/cate/shoulder3.webp", category: "Shoulder Bags"),
    DummyData(quantity: 1,name: "PATENT SHOULDER BAG", discountPrice: 1100.00, realPrice: 750.00, imageUrl: "assets/cate/shoulder4.jpg", category: "Shoulder Bags"),
    DummyData(quantity: 1,name: "BE MY MONICA POWDERBLUE HANDBAG", discountPrice: 2500.00, realPrice: 999.00, imageUrl: "assets/cate/shoulder5.webp", category: "Shoulder Bags"),



    //Slings Bags
    DummyData(quantity: 1,name: "QUILTED SLING BAG", discountPrice: 1000.00, realPrice: 700.00, imageUrl: "assets/cate/slings1.jpg", category: "Sling Bags"),
    DummyData(quantity: 1,name: "Fur handbag cum sling bag", discountPrice: 1400.00, realPrice: 1000.00, imageUrl: "assets/cate/slings2.webp", category: "Sling Bags"),
    DummyData(quantity: 1,name: "ERICA CLUTCH CUM SLING BAG", discountPrice: 1400.00, realPrice: 1000.00, imageUrl: "assets/cate/slings3.jpg", category: "Sling Bags"),
    DummyData(quantity: 1,name: "JULIE BIG SLING BAG", discountPrice: 2000.00, realPrice: 1250.00, imageUrl: "assets/cate/slings4.webp", category: "Sling Bags"),


    // Tote Bag
    DummyData(quantity: 1,name: "PIANO TOTE BAG", discountPrice: 2500.00, realPrice: 1750.00, imageUrl: "assets/cate/tote1.webp", category: "Tote Bag"),
    DummyData(quantity: 1,name: "Holographic croco shimmer totes", discountPrice: 1999.00, realPrice: 1299.00, imageUrl: "assets/cate/tote2.webp", category: "Tote Bag"),
    DummyData(quantity: 1,name: "BAO BAO TOTE BAG", discountPrice: 1500.00, realPrice: 1250.00, imageUrl: "assets/cate/tote3.webp", category: "Tote Bag"),
    DummyData(quantity: 1,name: "CUSTOMIZE TOTE", discountPrice: 3000.00, realPrice: 2400.00, imageUrl: "assets/cate/tote4.webp", category: "Tote Bag"),
    DummyData(quantity: 1,name: "CLASSY TOTE BAG", discountPrice: 1260.00, realPrice: 900.00, imageUrl: "assets/cate/tote5.webp", category: "Tote Bag"),

    //Bagpacks
    DummyData(quantity: 1,name: "CAT BACKPACK", discountPrice: 1100.00, realPrice:  750.00, imageUrl: "assets/cate/packs1.webp", category: "Bagpacks"),
    DummyData(quantity: 1,name: "MY HONEY BUNNY BACKPACK", discountPrice:  1100.00, realPrice: 650.00, imageUrl: "assets/cate/packs2.webp", category: "Bagpacks"),
    DummyData(quantity: 1,name: "TEDDY BACKPACK", discountPrice: 1200.00, realPrice: 750.00, imageUrl: "assets/cate/packs3.jpg", category: "Bagpacks"),
    DummyData(quantity: 1,name: "UNICORN BACKPACK", discountPrice: 1100.00, realPrice: 550.00, imageUrl: "assets/cate/packs4.webp", category: "Bagpacks"),
    DummyData(quantity: 1,name: "Penguin backpack", discountPrice: 1100.00, realPrice: 750.00, imageUrl: "assets/cate/packs5.jpg", category: "Bagpacks"),
    DummyData(quantity: 1,name: "KIDS SHIMMER BACKPACK", discountPrice: 1100.00, realPrice: 499.00, imageUrl: "assets/cate/packs6.jpg", category: "Bagpacks"),



    //duffle-bags
    DummyData(quantity: 1,name: "Asian duffle bag", discountPrice: 2500.00, realPrice: 2000.00, imageUrl: "assets/cate/duffle1.webp", category: "duffle-bags"),
    DummyData(quantity: 1,name: "Classic unisex duffle bag", discountPrice: 2500.00, realPrice: 2000.00, imageUrl: "assets/cate/duffle2.jpg", category: "duffle-bags"),
    DummyData(quantity: 1,name: "Duffle Bag", discountPrice: 2500.00, realPrice: 2000.00, imageUrl: "assets/cate/duffle3.jpg", category: "duffle-bags"),
    DummyData(quantity: 1,name: "Boho Duffle", discountPrice: 2500.00, realPrice: 2000.00, imageUrl: "assets/cate/duffle4.webp", category: "duffle-bags"),


    //Minis
    DummyData(quantity: 1,name: "Red MINI", discountPrice: 999.00, realPrice: 399.00, imageUrl: "assets/cate/minis1.webp", category: "Minis"),
    DummyData(quantity: 1,name: "FC MINI", discountPrice: 750.00, realPrice: 399.00, imageUrl: "assets/cate/minis2.webp", category: "Minis"),
    DummyData(quantity: 1,name: "MINI BAG", discountPrice: 1000.00, realPrice: 450.00, imageUrl: "assets/cate/minis3.webp", category: "Minis"),
    DummyData(quantity: 1,name: "SILICON SLING BAG", discountPrice: 1100.00, realPrice: 650.00, imageUrl: "assets/cate/minis4.jpg", category: "Minis"), //.....
    DummyData(quantity: 1,name: "SILICON SLING BAG", discountPrice: 1100.00, realPrice: 650.00, imageUrl: "assets/cate/minis5.webp", category: "Minis"), //....

    // Ethnic Clutches
    DummyData(quantity: 1,name: "BUTTERFLY CLUTCH", discountPrice: 2999.00, realPrice: 1500.00, imageUrl: "assets/cate/ethinic1.webp", category: "Ethnic-Clutches"),
    DummyData(quantity: 1,name: "MOSAIC CLUTCH", discountPrice: 2800.00, realPrice: 1650.00, imageUrl: "assets/cate/ethinic2.jpg", category: "Ethnic-Clutches"),
    DummyData(quantity: 1,name: "KIKIS CLUTCH", discountPrice: 2500.00, realPrice:  1650.00, imageUrl: "assets/cate/ethinic3.jpg", category: "Ethnic-Clutches"),
    DummyData(quantity: 1,name: "ME SO SEXY CLUTCH", discountPrice: 2500.00, realPrice: 1650.00, imageUrl: "assets/cate/ethinic4.jpg", category: "Ethnic-Clutches"),
    DummyData(quantity: 1,name: "DROPS OF HEAVEN BATUA", discountPrice: 1999.00, realPrice: 1100.00, imageUrl: "assets/cate/ethinic5.webp", category: "Ethnic-Clutches"),



    // Jute Bags
    DummyData(quantity: 1,name: "ELEINA ROUND BAGS BROWN", discountPrice: 2999.00, realPrice: 1999.00, imageUrl: "assets/cate/jute1.webp", category: "Jute-Bags"),
    DummyData(quantity: 1,name: "DONNA HANDWOVEN BAG BROWN", discountPrice: 2999.00, realPrice:  1999.00, imageUrl: "assets/cate/jute2.webp", category: "Jute-Bags"),
    DummyData(quantity: 1,name: "JULIA SHOULDER BAG BROWN", discountPrice: 2999.00, realPrice: 2000.00, imageUrl: "assets/cate/jute3.jpg", category: "Jute-Bags"),
    DummyData(quantity: 1,name: "MACRAME CROCHET BEACH BAG", discountPrice: 2999.00, realPrice: 2000.00, imageUrl: "assets/cate/jute4.jpg", category: "Jute-Bags"),
    DummyData(quantity: 1,name: "RETRO JUTE BAG WHITE", discountPrice: 2999.00, realPrice: 1999.00, imageUrl: "assets/cate/jute5.webp", category: "Jute-Bags"),

    // Kids Collection
    DummyData(quantity: 1,name: "WATERMELON POUCH BAG", discountPrice:  850.00, realPrice: 250.00, imageUrl: "assets/cate/kids1.webp", category: "Kids-Collection"),
    DummyData(quantity: 1,name: "POPET SLING BAG", discountPrice:  1100.00, realPrice: 499.00, imageUrl: "assets/cate/kids2.jpg", category: "Kids-Collection"),
    DummyData(quantity: 1,name: "MICKEY MOUSE BAG", discountPrice:  800.00, realPrice: 500.00, imageUrl: "assets/cate/kids3.webp", category: "Kids-Collection"),
    DummyData(quantity: 1,name: "KITTY SMALL BABY BACKPACK", discountPrice:  1100.00, realPrice: 499.00, imageUrl: "assets/cate/kids4.webp", category: "Kids-Collection"),
    DummyData(quantity: 1,name: "BABY POUCH BAG", discountPrice: 800.00, realPrice:  299.00, imageUrl: "assets/cate/kids5.webp", category: "Kids-Collection"),
    DummyData(quantity: 1,name: "SHIMMER SLING BAG", discountPrice:  800.00, realPrice: 399.00, imageUrl: "assets/cate/kids6.webp", category: "Kids-Collection"),

  ];

  List dummyCategory = [
    {
      'name': 'Sling Bags',
      'image': 'assets/cate/slings.png',
    },

    {
      'name': 'Tote Bag',
      'image': 'assets/cate/Tote_Bags.jpg',
    },
    {
      'name': 'Shoulder Bags',
      'image': 'assets/cate/Shoulder_bags.jpg',
    },
    {
      'name': 'Ethnic-Clutches',
      'image': 'assets/cate/ethinics.jpg',
    },
    {
      'name': 'Minis',
      'image': 'assets/cate/minis.jpg',
    },
    {
      'name': 'Jute-Bags',
      'image': 'assets/cate/Jute_Bags.jpg',
    },
    {
      'name': 'Kids-Collection',
      'image': 'assets/cate/kids.jpg',
    },
    {
      'name': 'Bagpacks',
      'image': 'assets/cate/bagpacks.jpg',
    },
    {
      'name': 'duffle-bags',
      'image': 'assets/cate/duffle.jpg',
    },
  ];
  List<DummyData> cartList = [];

  void addToCart(DummyData data,context) {
    if(cartList.contains(data)) {
     for(var item in cartList) {
       if(item.imageUrl == data.imageUrl){
         item.quantity = item.quantity! + 1;
       }
     }
     debugPrint("quantity ++ ");
    }else{
      cartList.add(data);
      debugPrint("print");
    }
    MySnackBar(context, 'Item Successfully Added To cart!');
    notifyListeners();
  }

  void removeQuantity(DummyData data){
    for(var item in cartList){
      if(item.imageUrl == data.imageUrl){
        if(item.quantity! == 1) {
          removeCartItem(data);
        }else{
          item.quantity = item.quantity! - 1;
        }
      }
    }
    notifyListeners();
  }


  void removeCartItem(DummyData data) {
    cartList.remove(data);
    debugPrint('remove');
    notifyListeners();
  }


  double totalAmount(){
    double total = 0;
    for(var item in cartList){
      total += item.realPrice! * item.quantity!;
    }
    return total;
  }

  //....................WishList items .............................

List<DummyData> wishList = [];

  addIntoWishList(DummyData data) {
    if(wishList.contains(data)) {
      for (var item in wishList) {
        if(item.imageUrl == data.imageUrl) {
          item.quantity = item.quantity! + 1;
          notifyListeners();
        }
      }
    } else {
      wishList.add(data);
      notifyListeners();
    }
  }

  removeItemFromWishList(DummyData data) {
    wishList.remove(data);
    notifyListeners();
  }

  removeWishListQuantity(DummyData data) {
    for (var item in wishList) {
      if (item.imageUrl == data.imageUrl) {
        if (item.quantity == 1) {
          removeItemFromWishList(data);
          notifyListeners();
        } else {
          item.quantity = item.quantity! -1;
          notifyListeners();
        }
      }
    }
  }

  double calculateWishList() {
    double totalAmount = 0.0;
    for (var item in wishList) {
      totalAmount += item.realPrice! * item.quantity!;
    }
    return totalAmount;
  }












}

MySnackBar(context, message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      clipBehavior: Clip.antiAlias,
      duration: const Duration(seconds: 1),
      backgroundColor: logoColor,
      content: Text(message)));
}