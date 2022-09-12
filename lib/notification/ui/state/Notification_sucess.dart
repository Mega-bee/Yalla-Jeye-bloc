import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../abstracts/states/state.dart';
import '../../../home_page/response/homepage_response.dart';
import '../../../utils/images/images.dart';
import '../../response/Notification_response.dart';
import '../screens/Notification_list.dart';

class NotificationSuccess extends States {
  final List<NotificationModel> notificationModel;

  NotificationSuccess({
    required this.notificationModel,
  }) : super(false);

  @override
  Widget getUI(BuildContext context) {
    return ListView.builder(
      itemCount: notificationModel.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            trailing: Text(
              "${DateFormat.yMd().add_jm().format(
                    DateTime.parse(
                      notificationModel[index].createdDate.toString(),
                    ),
                  )}",
              style: TextStyle(fontSize: 11, color: Colors.black54),
            ),
            leading: CircleAvatar(
              foregroundImage: AssetImage(
                ImageAsset.NOTI_IMAGE,
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.red,
              radius: 20,
            ),
            title: Text(
              "${notificationModel[index].title}",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '${notificationModel[index].description}',
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ),
        );
        //   ListTile(
        //   title: Text(notificationModel[index].title.toString()),
        //   subtitle: Text(notificationModel[index].description.toString()),
        //   // trailing: Text(),
        // );
      },
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
