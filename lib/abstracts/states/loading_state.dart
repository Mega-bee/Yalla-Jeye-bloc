import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:untitled1/abstracts/states/state.dart';
import 'package:untitled1/home_page/ui/state/home_state.dart';

class LoadingState extends States {

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
          color: Theme.of(context).primaryColor, size: 50),
    );
  }


}
class LoadingTesState extends HomeStates {

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
          color: Theme.of(context).primaryColor, size: 50),
    );
  }


}
