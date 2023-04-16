import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/search_componnet.dart';

class SearchNavPage extends StatefulWidget {
  const SearchNavPage({Key? key}) : super(key: key);

  @override
  State<SearchNavPage> createState() => _SearchNavPageState();
}

class _SearchNavPageState extends State<SearchNavPage> {
  final searchPageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //titleSpacing: 0,
        title: SearchComponent(
          text: 'Search ',
          onChanged: (value) {},
          controller: searchPageController,
          onTap: () {},
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child:const Padding(
              padding: EdgeInsets.only(left: 3.0,right: 8.0),
              child: Icon(
                CupertinoIcons.layers_alt_fill,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
