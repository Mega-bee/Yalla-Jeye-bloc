



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MenuDetails extends StatefulWidget {
  final  String? restaurantLink;
  final String? restaurantName;

  MenuDetails({ this.restaurantName, this.restaurantLink});


  @override
  _MenuDetailsState createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text(restaurantName,style: appBarText,),foregroundColor: yellowColor,),
        body: Stack(
          children: <Widget>[
            WebView(
              initialUrl: widget.restaurantLink,
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
              // onPageFinished: (finish) {
              //   setState(() {
              //     isLoading = false;
              //   });
              // },
            ),
          ],
        ),
      ),
    );
  }
}
