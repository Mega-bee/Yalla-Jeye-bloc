// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
//
// import '../../../abstracts/states/state.dart';
//
// import '../../state_manager/notification.dart';
//
// @injectable
// class NotificationScreen extends StatefulWidget {
//   NotificationCubit notificationCubit;
//   NotificationScreen(this.notificationCubit);
//   @override
//   State<NotificationScreen> createState() => NotificationScreenState();
// }
//
// class NotificationScreenState extends State<NotificationScreen> {
//   @override
//   void initState() {
//     widget.notificationCubit.getNotification();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         title: Text(
//           S.of(context).Notifications,
//           style: TextStyle(
//             color: Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black,
//           ),
//         ),
//       ),
//       body: BlocBuilder<NotificationCubit, States>(
//         bloc: widget.notificationCubit,
//         builder: (context, state) {
//           return state.getUI(context);
//         },
//       ),
//
//     );
//   }
// }
//
