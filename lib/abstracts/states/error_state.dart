
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/abstracts/states/state.dart';
class ErrorState extends States {


  final String errorMessage;
  final Function retry;
  ErrorState({required this.errorMessage ,required this.retry});

  @override
  Widget getUI(BuildContext context) {
    final text=["$errorMessage !!",''];
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 90,
          ),
          Center(child: Image.asset("assets/images/cerror-removebg.png",height: 250,color: Theme.of(context).primaryColor,)),
          const SizedBox(
            height: 10,
          ),
          AnimatedTextKit(animatedTexts: [
            for(final txt in text)TyperAnimatedText(txt)

          ],
          repeatForever: true,
          ),
           // Text(
           //   errorMessage,
           //   style: const TextStyle(color: Colors.white),
           // ),
          const   SizedBox(
            height: 30,
          ),
          MaterialButton(
              onPressed: () {
               retry();
              },
              child:const Text(
                'Retry',
                style: TextStyle(color: Colors.black),
              ),
              // color: AppColors.greenBasic,
              elevation: 5.0,
              shape:const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))))
        ],
      ),
    );
  }


}