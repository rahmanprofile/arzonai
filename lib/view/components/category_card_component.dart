import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CategoryCardComponent extends StatelessWidget {
  String imageUrl;
  VoidCallback onTap;
  CategoryCardComponent({Key? key,
  required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: 5,
            options: CarouselOptions(
              height: 180,
              autoPlay: true,
            ),
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Container(
                  height: 150.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.grey[200],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      imageUrl,
                      height: 130.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
