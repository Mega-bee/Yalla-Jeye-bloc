import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:untitled1/utils/Colors/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.bgColor,
    required this.text,
    required this.textColor,
    required this.loading,
    required this.buttonTab,
  });

  final Color bgColor;
  final Color textColor;
  final String text;
  final bool loading;
  final VoidCallback buttonTab;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child:
          Material(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: (){
                buttonTab();
              },
              child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SizedBox(
                    height: 20,

                    child: loading
                        ? Center(
                        child: LoadingIndicator(

                          indicatorType:
                          Indicator.ballBeat,

                          colors: [Colors.black],
                        ))
                        : Center(
                      child: Text(
                        '$text',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: WhiteColor,
                            fontSize: 18),
                      ),
                    ),
                  )),
            ),
          ),
        )
      ],
    );
  }
}