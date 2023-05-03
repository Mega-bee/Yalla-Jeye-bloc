import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../abstracts/states/error_state.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/Notification_repository.dart';
import '../response/Notification_response.dart';
import '../ui/state/Notification_sucess.dart';

@injectable
class NotificationCubit extends Cubit<States> {
  final NotificationsRepository _notificationsRepository;

  NotificationCubit(this._notificationsRepository) : super(LoadingState());

  getNotification() {
    // final HomePageRepository _homePageRepositoryy = getIt<HomePageRepository>();
    // final HomePageRepository _homePageRepositoryyy = HomePageRepository(getIt<ApiClient>(), getIt<AuthService>());
    //
    //
    // final Logger _logger = Logger();
    // final ApiClient apiClient = ApiClient(_logger);
    // final AuthService authService = AuthService(_prefsHelper);
    // final HomePageRepository homePageRepository = HomePageRepository(apiClient, authService);

    emit(LoadingState());
    _notificationsRepository.getNotifications().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getNotification();
            }));
      } else if (value.code == 200) {
        // NotificationModel notificationModel =
        // NotificationModel.fromJson(value.data.insideData);
        List<NotificationModel> fol = [];
        for (var item in value.data.insideData) {
          fol.add(NotificationModel.fromJson(item));
        }

        emit(
          NotificationSuccess(notificationModel: fol,),
        );
      }
    });
  }

}
