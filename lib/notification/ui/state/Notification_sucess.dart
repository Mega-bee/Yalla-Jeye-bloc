import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../abstracts/states/state.dart';
import '../../../home_page/response/homepage_response.dart';
import '../../response/Notification_response.dart';
import '../screens/Notification_list.dart';

class NotificationSuccess extends States {
  final List<NotificationModel> notificationModel;

  NotificationSuccess({required this.notificationModel,})
      : super(false);

  @override
  Widget getUI(BuildContext context) {
    return ListView.builder(
      itemCount: notificationModel.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(notificationModel[index].title.toString()),
          subtitle: Text(notificationModel[index].description.toString()),
          // trailing: Text(),
        );

      },
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
