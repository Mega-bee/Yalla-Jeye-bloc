import 'package:flutter/material.dart';

import '../../../abstracts/states/state.dart';

class ErrorAlertState extends States{
  String? errorMsg;
  ErrorAlertState(this.errorMsg ) : super(true);

  @override
  Widget getUI(BuildContext context) {
    return  Container();
  }
  @override
  Widget getAlert(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: const Text('Somthing wrong'),
      content: SizedBox(
        height: 100,
        child: Column(
          children: [
            const SizedBox(height: 5,),
            Text(errorMsg ?? 'Error')
          ],
        ),
      ),
    );
  }
}