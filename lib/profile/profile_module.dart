import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/profile/ui/screen/get_profile.dart';
import 'package:untitled1/profile/ui/screen/setting_screen.dart';
import '../abstracts/module/rout_module.dart';
import 'profile_module_route.dart';

@injectable
class ProfilePageModule extends RoutModule {
  final SettingProfilePage _settingProfilePage;
  final GetProfilePage _getProfilePage;

  ProfilePageModule(this._settingProfilePage, this._getProfilePage) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      ProfileRoutes.settingProfile: (context) => _settingProfilePage,
      ProfileRoutes.Getprofile: (context) => _getProfilePage,
    };
  }
}
