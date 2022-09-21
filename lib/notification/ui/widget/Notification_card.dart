import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/images/images.dart';
import '../../response/Notification_response.dart';

class NotificationCard extends StatelessWidget {
final NotificationModel notification;
NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: Text(
          "${DateFormat.yMd().add_jm().format(
            DateTime.parse(
              notification.createdDate.toString(),
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
          "${notification.title}",
          style: TextStyle(
              fontSize: 15,
              color: Colors.redAccent,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${notification.description}',
          style: TextStyle(fontSize: 12, color: Colors.black87),
        ),
      ),
    );
  }
}
