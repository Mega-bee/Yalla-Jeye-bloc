// import 'package:flutter/material.dart';
//
// import '../../../abstracts/states/state.dart';
// import '../../response/notification_response.dart';
// import '../widget/notification_card.dart';
//
// class NotificationSuccess extends States {
//  final List<NotificationModel> notificationModel;
//
//   NotificationSuccess({required this.notificationModel}) : super(false);
//
//   @override
//   Widget getUI(BuildContext context) {
//     return ListView.builder(
//       itemCount: notificationModel.length,
//         itemBuilder: (context,index){
//           return NotificationCard(
//             noti: notificationModel[index],
//           );
//
//         }
//     );
//
//   }
//
//   @override
//   Widget getAlert(BuildContext context) {
//     // TODO: implement getAlert
//     throw UnimplementedError();
//   }
// }
