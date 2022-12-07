
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/firebase_token_repository.dart';
import '../response/notification_response.dart';
import '../ui/screens/notification_screen.dart';
import '../ui/state/notification_Success.dart';

@injectable
class NotificationCubit extends Cubit<States> {
  final FireBaseToken _fireBaseToken;

  NotificationCubit(this._fireBaseToken)
      : super(
          LoadingState(),
        );


  // getNotification() {
  //   print("Noti Loadingggggg");
  //   emit(LoadingState());
  //   print("Noti Loadingggggg");
  //   _fireBaseToken.getNotifications().then((value) {
  //     print("value:${value}");
  //     if (value == null) {
  //       print("Notification error");
  //       emit(ErrorState(
  //           errorMessage: 'Connection error',
  //           retry: () {
  //             getNotification();
  //           }));
  //     } else if (value.code == 200) {
  //       print("Notification Success");
  //       List<NotificationModel> noti = [];
  //       for (var item in value.data.insideData) {
  //         noti.add(NotificationModel.fromJson(item));
  //         print("NotiList:${noti}");
  //       }
  //
  //       emit(NotificationSuccess(notificationModel: noti));
  //     }
  //   });
  // }
}
