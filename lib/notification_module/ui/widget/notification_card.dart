// import 'package:brandsome/notification_module/response/notification_response.dart';
// import 'package:flutter/material.dart';
// import 'package:timeago/timeago.dart' as timeago;
//
// import '../../../utils/helpers/date_converter.dart';
//
// class NotificationCard extends StatefulWidget {
//   final NotificationModel noti;
//
//   NotificationCard({required this.noti});
//
//   @override
//   State<NotificationCard> createState() => _NotificationCardState();
// }
//
// class _NotificationCardState extends State<NotificationCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
//       child: Column(
//         children: [
//           widget.noti.eventId == 2
//               ? ListTile(
//                   leading: CircleAvatar(
//                     foregroundImage:
//                         NetworkImage(widget.noti.initiatorImage.toString()),
//                     radius: 20,
//                   ),
//                   title: RichText(
//                     text: TextSpan(
//                       children: <TextSpan>[
//                         TextSpan(
//                             text: "${widget.noti.initiatorName} ",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Theme.of(context).brightness ==
//                                         Brightness.dark
//                                     ? Colors.white
//                                     : Colors.black),
//                             children: [
//                               WidgetSpan(
//                                 child: SizedBox(
//                                   height: 30,
//                                 ),
//                               ),
//                             ]),
//                         TextSpan(
//                             text: "started following you",
//                             style: TextStyle(
//                               color: Theme.of(context).brightness ==
//                                       Brightness.dark
//                                   ? Color(0xffe8e8e8)
//                                   : Colors.black,
//                             ),
//                             children: [
//                               WidgetSpan(
//                                 child: SizedBox(
//                                   height: 30,
//                                 ),
//                               ),
//                             ]),
//                         // TextSpan(
//                         //   text: widget.noti.businessName,
//                         //   style: TextStyle(
//                         //     fontWeight: FontWeight.bold,
//                         //   ),
//                         // )
//                       ],
//                     ),
//                   ),
//                   subtitle: Text(
//                     timeago.format(
//                       DateHelper.convertDateToLocal(
//                         widget.noti.createdDate ?? DateTime(0),
//                       ),
//                     ),
//                   ),
//                   // subtitle: Text(
//                   //   "${timeago.format(
//                   //     DateTime.parse(
//                   //       widget.noti.createdDate.toString(),
//                   //     ),
//                   //   )}",
//                   // ),
//                 )
//               : Container(),
//           widget.noti.eventId == 1
//               ? ListTile(
//             subtitle: Text(
//               timeago.format(
//                 DateHelper.convertDateToLocal(
//                   widget.noti.createdDate ?? DateTime(0),
//                 ),
//               ),
//             ),
//                   leading: CircleAvatar(
//                     foregroundImage:
//                         NetworkImage(widget.noti.initiatorImage.toString()),
//                     radius: 20,
//                     backgroundColor: Colors.transparent,
//                   ),
//                   trailing: Image.network(widget.noti.postImage.toString()),
//                   title: RichText(
//                     text: TextSpan(
//                       children: <TextSpan>[
//
//                         TextSpan(
//                           text:"${widget.noti.initiatorName} ",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//
//                                 color: Theme.of(context).brightness ==
//                                     Brightness.dark
//                                     ? Colors.white
//                                     : Colors.black,
//                           ),
//                         ),
//                         TextSpan(
//                             text: "liked your post",
//                             style: TextStyle(
//                               color: Theme.of(context).brightness ==
//                                   Brightness.dark
//                                   ? Color(0xffe8e8e8)
//                                   : Colors.black,
//                             ),
//                             children: [
//                               WidgetSpan(
//                                 child: SizedBox(
//                                   height: 5,
//                                 ),
//                               ),
//                             ]),
//
//                       ],
//                     ),
//
//                   ),
//                 )
//               : Container(),
//           widget.noti.eventId == 3
//               ? ListTile(
//             subtitle: Text(
//               timeago.format(
//                 DateHelper.convertDateToLocal(
//                   widget.noti.createdDate ?? DateTime(0),
//                 ),
//               ),
//             ),
//                   leading: CircleAvatar(
//                     foregroundImage:
//                         NetworkImage(widget.noti.initiatorImage.toString()),
//                     radius: 20,
//                     backgroundColor: Colors.transparent,
//                   ),
//                   title: RichText(
//
//                     text:
//                     TextSpan(
//                       children: <TextSpan>[
//                         TextSpan(
//                             text: widget.noti.initiatorName,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Theme.of(context).brightness ==
//                                   Brightness.dark
//                                   ? Colors.white
//                                   : Colors.black,
//                             ),
//                             children: [
//                               WidgetSpan(
//                                 child: SizedBox(
//                                   height: 30,
//                                 ),
//                               ),
//                             ]),
//
//                         TextSpan(
//                             text: " added a review",
//                             style: TextStyle(
//                               color: Theme.of(context).brightness ==
//                                   Brightness.dark
//                                   ? Color(0xffe8e8e8)
//                                   : Colors.black,
//                             ),
//                             children: [
//                               WidgetSpan(
//                                 child: SizedBox(
//                                   height: 5,
//                                 ),
//                               ),
//                             ]),
//
//
//
//
//                       ],
//                     ),
//
//                   ),
//
//                 )
//               : Container(),
//           Divider(
//             height: 3,
//           )
//         ],
//       ),
//     );
//   }
// }
