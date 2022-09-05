import 'package:flutter/material.dart';



class CustomOtpVerificationDialog extends StatefulWidget {
  final String title;
  final String content;
  final Function continueBtn;

  const CustomOtpVerificationDialog({
    required this.title,
    required this.content,
    required this.continueBtn,
  });

  @override
  State<CustomOtpVerificationDialog> createState() =>
      _CustomOtpVerificationDialog();
}

class _CustomOtpVerificationDialog extends State<CustomOtpVerificationDialog> {
  final username = TextEditingController();
  final phonenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.cancel,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Container(
            child: Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: "BerlinSansFB"),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Enter the OTP you received to\n',
//                    style: TextStyle(color: darkWhiteColor, fontSize: 17),
                    children: [
                      WidgetSpan(
                        child: SizedBox(
                          height: 30,
                        ),
                      ),
                    ]),
                TextSpan(
                  text: '+961 0000000',
//                  style: TextStyle(color: blackColor, fontSize: 17),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
              child: SizedBox(
            width: MediaQuery.of(context).size.height / 3,
            child: const TextField(
              maxLength: 4,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsetsDirectional.only(top: 10, bottom: 10, start: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
              ),
              textAlign: TextAlign.center,
            ),
          )),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              widget.continueBtn();
            },
            child: const Text("Resend OTP"),
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                padding: const EdgeInsets.fromLTRB(30, 12, 30, 12)),
          ),
        ],
      ),
    );
  }
}
