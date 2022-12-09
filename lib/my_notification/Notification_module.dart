import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/my_notification/ui/screens/Notification_list.dart';

import '../abstracts/module/rout_module.dart';
import 'Notification_module_route.dart';

@injectable
class  NotificationModule extends RoutModule {

  final NotificationPage _notificationPage;
  NotificationModule(this._notificationPage) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      NotificationRoutes.Notifications: (context) => _notificationPage,
    };
  }
}
