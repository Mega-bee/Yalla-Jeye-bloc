import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/di/di_config.dart';
import 'package:untitled1/module_auth/service/auth_service.dart';
import 'package:untitled1/module_network/http_client/http_client.dart';
import 'package:untitled1/utils/logger/logger.dart';

import '../../abstracts/states/error_state.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/homepage_repository.dart';
import '../request/homepage_request.dart';
import '../response/homepage_response.dart';
import '../ui/screens/home_page_list.dart';
import '../ui/state/homepage_sucess.dart';

@injectable
class HomePageCubit extends Cubit<States> {
  final HomePageRepository _homePageRepository;

  HomePageCubit(this._homePageRepository) : super(LoadingState());

  getHomePage(HomePageState state) {
    // final HomePageRepository _homePageRepositoryy = getIt<HomePageRepository>();
    // final HomePageRepository _homePageRepositoryyy = HomePageRepository(getIt<ApiClient>(), getIt<AuthService>());
    //
    //
    // final Logger _logger = Logger();
    // final ApiClient apiClient = ApiClient(_logger);
    // final AuthService authService = AuthService(_prefsHelper);
    // final HomePageRepository homePageRepository = HomePageRepository(apiClient, authService);

    emit(LoadingState());
    _homePageRepository.getHomePage().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getHomePage(state);
            }));
      } else if (value.code == 200) {
        HomePageModel homePageModel =
            HomePageModel.fromJson(value.data.insideData);
        // List<HomePageModel> fol = [];
        // for (var item in value.data.insideData) {
        //   fol.add(HomePageModel.fromJson(item));
        // }

        emit(
          HomePageSuccess(homepage: homePageModel,homepageState: state),
        );
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
