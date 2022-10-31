import 'package:flutter/material.dart';
import 'package:untitled1/abstracts/states/state.dart';

class EmptyDataState extends States {
  final String image;
  final String message;
  EmptyDataState({required this.image,required this.message});

  @override
  Widget getUI(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                image,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(message)
          ],
        ),
      ),
    );
  }
}