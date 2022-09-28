import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/profile/ui/screen/edit_profile.dart';
import 'package:untitled1/profile/ui/screen/get_profile.dart';
import 'package:untitled1/profile/ui/screen/profile.dart';
import 'package:untitled1/profile/ui/state/profile_success.dart';
import '../abstracts/module/rout_module.dart';
import 'profile_module_route.dart';

@injectable
class  ProfilePageModule extends RoutModule {

  final ProfilePage _profilePage;
  final GetProfilePage _getProfilePage;
  final EditProfilePage _editProfilePage;

  ProfilePageModule(this._profilePage,this._getProfilePage,this._editProfilePage) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {

      ProfileRoutes.profile: (context) => _profilePage,
      ProfileRoutes.Getprofile: (context) => _getProfilePage,
      ProfileRoutes.Editprofile: (context) => _editProfilePage,



    };
  }
}
