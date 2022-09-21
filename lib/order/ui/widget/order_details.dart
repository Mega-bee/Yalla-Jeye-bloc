import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
@injectable
class OrderDetails extends StatefulWidget {

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order details"),
        ),
        body: Container(
          height: 380,
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text('Nickname'),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 220.0, top: 15, bottom: 15),
                        child: Text("Birthday party"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text('Street'),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 220.0, top: 15, bottom: 15),
                        child: Text("Birthday party"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Building',
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 220.0, top: 15, bottom: 15),
                        child: Text("Birthday party"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
