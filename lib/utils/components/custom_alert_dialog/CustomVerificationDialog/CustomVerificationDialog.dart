import 'package:flutter/material.dart';

class CustomVerificationDialog extends StatefulWidget {
  final String title;
  final String content;
  final Function continueBtn;

  const CustomVerificationDialog({
    required this.title,
    required this.content,
    required this.continueBtn,
  });

  @override
  State<CustomVerificationDialog> createState() => _CustomVerificationDialog();
}

class _CustomVerificationDialog extends State<CustomVerificationDialog> {
  final username = TextEditingController();
  final phonenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,

              child: InkWell(
                onTap: (){
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
//                    color: blackColor,
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
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Username",
//                    style: TextStyle(color: greyColor, fontSize: 10),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
//                    style: TextStyle(color: hintText, fontSize: 15),
                    controller: username,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 5,
                          ),
                        ),
                        hintText: 'Enter your username',
//                        hintStyle:
//                            TextStyle(fontSize: 12, color: darkWhiteColor),
                        contentPadding: const EdgeInsetsDirectional.only(
                            top: 10, bottom: 10, start: 10)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Phone Number",
//                    style: TextStyle(color: greyColor, fontSize: 10),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
//                    style: TextStyle(color: hintText, fontSize: 15),
                    controller: phonenumber,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 5,
                          ),
                        ),
                        hintText: 'Enter your phone number',
//                        hintStyle:
//                            TextStyle(fontSize: 12, color: darkWhiteColor),
                        contentPadding: const EdgeInsetsDirectional.only(
                            top: 10, bottom: 10, start: 10)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                widget.continueBtn();
              },
              child: const Text("Continue"),
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.fromLTRB(30, 12, 30, 12)),
            ),
          ],
        ),
      );

  }
}
