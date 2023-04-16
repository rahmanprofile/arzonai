import 'package:flutter/material.dart';

import '../components/search_componnet.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SearchComponent(
            text: 'Search',
            onChanged: (value) {},
            controller: searchController,
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
