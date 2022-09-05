import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
@injectable
class GlobalStateManager {
  final PublishSubject _stateSubject = PublishSubject();
  Stream get stateStream => _stateSubject.stream;

  final PublishSubject<int>  statePotionsSubject = PublishSubject();
  Stream<int> get currentIndexRefresh =>  statePotionsSubject.stream;

  final PublishSubject<Service>  stateFilterSubject = PublishSubject();
  Stream<Service> get filterRefresh =>  stateFilterSubject.stream;

  void update() {
    _stateSubject.add(DateTime.now().toString());
  }
}
