// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../hive/hive.dart' as _i3;
import '../home_page/repository/homepage_repository.dart' as _i11;
import '../home_page/state_manager/homepage.dart' as _i15;
import '../home_page/ui/screens/home_page_list.dart' as _i19;
import '../main.dart' as _i21;
import '../module_auth/repository/auth_repository.dart' as _i10;
import '../module_auth/service/auth_service.dart' as _i4;
import '../module_network/http_client/http_client.dart' as _i9;
import '../navigation_bar/navigator_module.dart' as _i8;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i7;
import '../notification/Notification_module.dart' as _i20;
import '../notification/repository/Notification_repository.dart' as _i12;
import '../notification/state_manager/Notification.dart' as _i16;
import '../notification/ui/screens/Notification_list.dart' as _i17;
import '../restaurants/repository/Restaurants_repository.dart' as _i13;
import '../restaurants/state_manager/Restaurants.dart' as _i14;
import '../restaurants/ui/screens/restaurant_list.dart' as _i18;
import '../utils/global/global_state_manager.dart' as _i5;
import '../utils/logger/logger.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthPrefsHelper>(() => _i3.AuthPrefsHelper());
  gh.factory<_i4.AuthService>(
      () => _i4.AuthService(get<_i3.AuthPrefsHelper>()));
  gh.singleton<_i5.GlobalStateManager>(_i5.GlobalStateManager());
  gh.factory<_i4.ImeiService>(() => _i4.ImeiService());
  gh.factory<_i6.Logger>(() => _i6.Logger());
  gh.factory<_i7.Navigationbar>(() => _i7.Navigationbar());
  gh.factory<_i8.NavigatorModule>(
      () => _i8.NavigatorModule(get<_i7.Navigationbar>()));
  gh.factory<_i9.ApiClient>(() => _i9.ApiClient(get<_i6.Logger>()));
  gh.factory<_i10.AuthRepository>(
      () => _i10.AuthRepository(get<_i9.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i11.HomePageRepository>(() =>
      _i11.HomePageRepository(get<_i9.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i12.NotificationsRepository>(() => _i12.NotificationsRepository(
      get<_i9.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i13.RestaurantsRepository>(() =>
      _i13.RestaurantsRepository(get<_i9.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i14.RestaurantseCubit>(
      () => _i14.RestaurantseCubit(get<_i13.RestaurantsRepository>()));
  gh.factory<_i15.HomePageCubit>(
      () => _i15.HomePageCubit(get<_i11.HomePageRepository>()));
  gh.factory<_i16.NotificationCubit>(
      () => _i16.NotificationCubit(get<_i12.NotificationsRepository>()));
  gh.factory<_i17.NotificationPage>(
      () => _i17.NotificationPage(get<_i16.NotificationCubit>()));
  gh.factory<_i18.RestaurantPage>(
      () => _i18.RestaurantPage(get<_i14.RestaurantseCubit>()));
  gh.factory<_i19.HomePage>(() => _i19.HomePage(get<_i15.HomePageCubit>()));
  gh.factory<_i20.NotificationModule>(
      () => _i20.NotificationModule(get<_i17.NotificationPage>()));
  gh.factory<_i21.MyApp>(() =>
      _i21.MyApp(get<_i8.NavigatorModule>(), get<_i20.NotificationModule>()));
  return get;
}
