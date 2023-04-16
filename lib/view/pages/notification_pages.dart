import 'package:flutter/material.dart';

import '../../controller/constant.dart';
import '../components/match_found.dart';

class NotificationPages extends StatefulWidget {
  const NotificationPages({super.key});

  @override
  State<NotificationPages> createState() => _NotificationPagesState();
}

class _NotificationPagesState extends State<NotificationPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notify Messages", style: styleBlack20),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:const [
          MatchFound(text: "No notification found", imageUrl: 'notification.png'),
        ],
      ),
    );
  }
}
