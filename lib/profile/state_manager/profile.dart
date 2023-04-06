import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import '../../abstracts/states/error_state.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/profile_repository.dart';
import '../request/edit_profile_request.dart';
import '../response/get_profile_response.dart';
import '../ui/screen/get_profile.dart';
import '../ui/state/get_profile_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ProfileCubit extends Cubit<States> {
  final ProfileRepository _profileRepository;

  ProfileCubit(this._profileRepository) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();

  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  updateProf(
      {required UpdateProfileRequest request,
      required GetProfilePageState screenState}) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _profileRepository.editProfile(request).then((value) {
      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(
            msg: 'something went wrong', backgroundColor: Colors.red);
      } else if (value.code == 200) {
        Navigator.pop(screenState.context);
        Fluttertoast.showToast(
            msg: 'updated successfully', backgroundColor: Colors.red);
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
          GetProfilePageSuccess(model: getProfileModel, screenState: state),
        );
      }
    });
  }

  deleteAccount({required String id}
      ) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _profileRepository.DeletetAccount(id).then((value) {
      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(
            msg: 'something went wrong', backgroundColor: Colors.red);
      } else if (value.code == 200) {
        // Navigator.pop(screenState.context);
        Fluttertoast.showToast(msg: 'Account deleted', backgroundColor: Colors.red);
      }
    });
  }
}
