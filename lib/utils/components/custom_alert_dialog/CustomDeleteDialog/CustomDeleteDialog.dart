import 'package:flutter/material.dart';

class CustomDeleteDialog extends StatelessWidget {
  final String title;
  final String content;
  final String contenttwo;
  final Function yesBtn;

  // final Function noBtn;
  const CustomDeleteDialog({
    required this.title,
    required this.content,
    required this.yesBtn,
    // required this.noBtn,
    required this.contenttwo,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                content,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                contenttwo,
                style: const TextStyle(
                  fontSize: 14,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    yesBtn();
                  },
                  child: Text("  Confirm  ",
                      style: TextStyle(
                          // color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12)),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      side: BorderSide(color: Theme.of(context).primaryColor),
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10)),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     noBtn();
                //   },
                //   child: Text(
                //     "Cancel",
                //     style: TextStyle(
                //         color: Theme.of(context).primaryColor,
                //         fontWeight: FontWeight.w400,
                //         fontSize: 12)     ,               ),
                //   style: ElevatedButton.styleFrom(
                //       elevation: 0,
                //       side: BorderSide(color: Theme.of(context).primaryColor),
                //       padding: const EdgeInsets.fromLTRB(30, 10, 30, 10)),
                // ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}
