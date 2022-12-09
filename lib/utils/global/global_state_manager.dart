import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
@singleton
@injectable
class GlobalStateManager {
  final PublishSubject _stateSubject = PublishSubject();
  Stream get stateStream => _stateSubject.stream;

  void update() {
    _stateSubject.add(DateTime.now().toString());
  }
}


class GlobalVariable {
  static final GlobalKey<ScaffoldState> mainScreenScaffold =
  GlobalKey<ScaffoldState>();
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
}