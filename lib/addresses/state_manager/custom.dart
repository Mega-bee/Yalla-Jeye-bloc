import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/di/di_config.dart';
import 'package:untitled1/module_auth/service/auth_service.dart';
import 'package:untitled1/module_network/http_client/http_client.dart';
import 'package:untitled1/utils/logger/logger.dart';

import '../../abstracts/states/error_state.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../../custom/ui/screens/custom_list.dart';
import '../../home_page/response/homepage_response.dart';
import '../repository/custom_repository.dart';
import '../request/custom_request.dart';
import '../response/custom_Response.dart';


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

        // emit(
        //   CustomSuccess(customPageState: state),
        // );
      }
    });
  }

// void  following(FollowRequest request,String?id,FollowersState state) {
//   // emit(LoadingState());
//   _getAccountFollowers.follow(id,request).then((value) {
//     if (value == null) {
//       emit(ErrorState(
//           errorMessage: 'Connection error', retry:(){
//         getFoll(state);
//
//       }));
//     }
//     else if (value.code == 200) {
//       if(request.isFollow!){
//         Fluttertoast.showToast(msg: "Following",backgroundColor: Colors.black);
//       }else{
//         Fluttertoast.showToast(msg: "Unfollowing",backgroundColor: Colors.black);
//       }
//       print('Business followed successfully');
//
//
//     }
//   });
// }
}
