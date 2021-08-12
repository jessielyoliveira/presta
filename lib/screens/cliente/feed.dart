import 'package:flutter/material.dart';
import 'package:presta/screens/estrutura.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
} 

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Feed'),
      body: buildFeed(context),
      bottomNavigationBar: getButtonNavigationBar(),
    );
  }
}

Widget buildFeed(BuildContext context) {
  return Scrollbar(
    child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(24))),
      )
  )


;}