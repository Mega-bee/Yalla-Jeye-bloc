import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import '../../abstracts/states/error_state.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../../utils/Colors/colors.dart';
import '../repository/profile_repository.dart';
import '../request/edit_profile_request.dart';
import '../response/get_profile_response.dart';
import '../ui/screen/edit_profile.dart';
import '../ui/screen/get_profile.dart';
import '../ui/state/get_profile_state.dart';

@injectable
class ProfileCubit extends Cubit<States> {
  final ProfileRepository _profileRepository;

  ProfileCubit(this._profileRepository) : super(LoadingState());

  updateProf({required UpdateProfileRequest request,required EditProfilePageState state}) {
    print("Loadinggg");

    emit(
      LoadingWaitingState('Waiting to edit address'),
    );
    print("Loadinggg 1111");

    _profileRepository.editProfile(request).then((value) {
      if (value == null) {
        Fluttertoast.showToast(
            msg: 'something went wrong', backgroundColor: Colors.red);
      } else if (value.code == 200) {
        Navigator.pop(state.context, true);
        Fluttertoast.showToast(

            msg: 'Profile updated Successfully', backgroundColor: redColor);
      }
    });
  }

  getProfile(GetProfilePageState state) {
    emit(LoadingState());
    _profileRepository.getProfile().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getProfile(state);
            }));
      } else if (value.code == 200) {
        GetProfileModel getProfileModel =
            GetProfileModel.fromJson(value.data.insideData);

        emit(
          GetProfilePageSuccess(
              getProfileModel: getProfileModel, getProfilePageState: state),
        );
      }
    });
  }
}
