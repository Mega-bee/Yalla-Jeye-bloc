 import 'package:flutter/cupertino.dart';

 void showSheet(
BuildContext context,{
  required Widget child,
  required VoidCallback onClicked,
})=>showCupertinoModalPopup(
  context: context,
  builder: (context)=>CupertinoActionSheet(
    actions: [
      Expanded(child: child),
    ],
    cancelButton: CupertinoActionSheetAction(
      child: Text('Done'),
      onPressed: (){
        onClicked();
      },
    ),
  )
);