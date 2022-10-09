import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import '../../abstracts/states/error_state.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../../navigation_bar/ui/screens/navigationBar.dart';
import '../repository/custom_repository.dart';
import '../request/custom_request.dart';
import '../response/custom_Response.dart';
import '../ui/screens/custom_list.dart';
import '../ui/state/custom_sucess.dart';

@injectable
class CustomCubit extends Cubit<States> {
  final CustomRepository _customRepository;

  CustomCubit(this._customRepository) : super(LoadingState());

  getAddress(CustomPageState state) {
    // final HomePageRepository _homePageRepositoryy = getIt<HomePageRepository>();
    // final HomePageRepository _homePageRepositoryyy = HomePageRepository(getIt<ApiClient>(), getIt<AuthService>());
    //
    //
    // final Logger _logger = Logger();
    // final ApiClient apiClient = ApiClient(_logger);
    // final AuthService authService = AuthService(_prefsHelper);
    // final HomePageRepository homePageRepository = HomePageRepository(apiClient, authService);

    emit(LoadingState());
    _customRepository.getAdresses().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getAddress(state);
            }));
      } else if (value.code == 200) {
        // HomePageModel restaurants =
        // HomePageModel.fromJson(value.data.insideData);
        List<CustomModel> fol = [];
        for (var item in value.data.insideData) {
          fol.add(CustomModel.fromJson(item));
        }

        emit(
          CustomSuccess(customPageState: state),
        );
      }
    });
  }

  CustomOrder({
    required CustomOrderRequest request, required CustomPageState customPageState}) {
    emit(
      LoadingState(),
    );
    _customRepository.CustomOrder(request).then((value) {
      if (value == null) {
        Fluttertoast.showToast(
            msg: 'something went wrong', backgroundColor: Colors.red);
      } else if (value.code == 200) {
        emit(
          CustomSuccess(customPageState: customPageState),
        );
        NavigationbarrState? stateObject = customPageState.context.findAncestorStateOfType<NavigationbarrState>();

        stateObject?.currentIndex = 2;
        stateObject?.setState(() {

        });

      }
    });
  }

}
