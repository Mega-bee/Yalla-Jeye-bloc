import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/images/images.dart';
import '../../response/Notification_response.dart';
import '../widget/Notification_card.dart';

class NotificationSuccess extends States {
  final List<NotificationModel> notificationModel;

  NotificationSuccess({
    required this.notificationModel,
  });

  @override
  Widget getUI(BuildContext context) {
    return ListView.builder(
      itemCount: notificationModel.length,
      itemBuilder: (context, index) {
        return NotificationCard(
          notification: notificationModel[index],
        );

      },
    );
  }

}
