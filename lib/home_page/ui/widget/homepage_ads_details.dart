import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePageAdsDetails extends StatelessWidget {
  String? image;

  HomePageAdsDetails({this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${"title"}',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
            width: double.infinity,
            child: Image.network(
              image.toString(),
              fit: BoxFit.fitWidth,
            ),
          ),


    );
  }
}
