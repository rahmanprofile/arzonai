import 'package:bwi_shopify/view/screen/fake_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/constant.dart';
import '../pages/products_item_details_overview.dart';

class CartComponent extends StatefulWidget {
  const CartComponent({
    required this.data,
    Key? key}) : super(key: key);
  final DummyData data ;

  @override
  State<CartComponent> createState() => _CartComponentState();
}

class _CartComponentState extends State<CartComponent> {

  var itemCountList = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  String currentItem = "1";
  @override
  Widget build(BuildContext context) {
    final fakeProv = Provider.of<FakeData>(context);
    final cartProduct = fakeProv.cartList;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsItemDetailsOverView(
                      data: widget.data,
                      productPrice: widget.data.realPrice.toString(),
                      productName: widget.data.name.toString(),
                      isAvailable: true,
                    ),
                  ),
                );
              },
              child: Container(
                height: 100,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey)
                    //color: Colors.grey[200],
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    widget.data.imageUrl.toString(),
                    fit: BoxFit.cover,
                    height: 100,
                    width: 120,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( widget.data.name.toString(), maxLines: 2, style: styleBlack14),
                Text("Price : ${widget.data.realPrice! * widget.data.quantity!}", maxLines: 2, style: styleBlackNormal12),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //cartProduct.r
                        fakeProv.removeQuantity(widget.data);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(2.0)),
                        child: const Center(
                          child: Icon(CupertinoIcons.minus,
                              color: blackColor, size: 18),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Container(
                      height: 30,
                      width: 45,
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(2.0)),
                      child: Center(
                        child: Text("${widget.data.quantity}", style: styleBlack15),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    GestureDetector(
                      onTap: () {
                        fakeProv.addToCart(widget.data,context);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(2.0)),
                        child: const Center(
                          child: Icon(CupertinoIcons.add,
                              color: blackColor, size: 18),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        onPressed: () {
                          fakeProv.removeCartItem(widget.data);
                        },
                        icon: const Icon(CupertinoIcons.delete,
                            color: redColor, size: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
