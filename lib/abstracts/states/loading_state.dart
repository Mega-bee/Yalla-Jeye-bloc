import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:untitled1/abstracts/states/state.dart';

class LoadingState extends States {
  LoadingState() : super(false);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(color: Theme.of(context).primaryColor, size: 30)
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}

class LoadingWaitingState extends States {
 final String msg;
  LoadingWaitingState(this.msg) : super(true);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.beat(color: Theme.of(context).primaryColor, size: 30)
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text(msg),
      content: SizedBox(
        height: 100,
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            LoadingAnimationWidget.beat(color: Theme.of(context).primaryColor, size: 30)
          ],
        ),
      ),
    );
  }
}
