import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../request/Notification_request.dart';
import '../../state_manager/Notification.dart';

@injectable
class NotificationPage extends StatefulWidget {
  final NotificationCubit cubit;

  const NotificationPage(this.cubit);

  @override
  State<NotificationPage> createState() => NotificationPageState();
}

class NotificationPageState extends State<NotificationPage> {
  @override

  void initState() {
    widget.cubit.getNotification();
  }



  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        centerTitle: true,
       actions: [
         Icon(Icons.shopping_cart,color: Colors.redAccent,)
       ],
      ),
      body: BlocBuilder<NotificationCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
