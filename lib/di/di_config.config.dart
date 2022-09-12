// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../custom/custom_module.dart' as _i23;
import '../custom/repository/custom_repository.dart' as _i11;
import '../custom/state_manager/custom.dart' as _i16;
import '../custom/ui/screens/custom_list.dart' as _i17;
import '../hive/hive.dart' as _i3;
import '../home_page/repository/homepage_repository.dart' as _i12;
import '../home_page/state_manager/homepage.dart' as _i18;
import '../home_page/ui/screens/home_page_list.dart' as _i24;
import '../main.dart' as _i26;
import '../module_auth/repository/auth_repository.dart' as _i10;
import '../module_auth/service/auth_service.dart' as _i4;
import '../module_network/http_client/http_client.dart' as _i9;
import '../navigation_bar/navigator_module.dart' as _i8;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i7;
import '../notification/Notification_module.dart' as _i25;
import '../notification/repository/Notification_repository.dart' as _i13;
import '../notification/state_manager/Notification.dart' as _i19;
import '../notification/ui/screens/Notification_list.dart' as _i20;
import '../order/order_module.dart' as _i22;
import '../order/repository/order_repository.dart' as _i15;
import '../order/state_manager/order.dart' as _i14;
import '../order/ui/screens/order_page_list.dart' as _i21;
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
  gh.factory<_i11.CustomRepository>(() =>
      _i11.CustomRepository(get<_i9.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i12.HomePageRepository>(() =>
      _i12.HomePageRepository(get<_i9.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i13.NotificationsRepository>(() => _i13.NotificationsRepository(
      get<_i9.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i14.OrderCubit>(
      () => _i14.OrderCubit(get<_i12.HomePageRepository>()));
  gh.factory<_i15.OrderRepository>(
      () => _i15.OrderRepository(get<_i9.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i16.CustomCubit>(
      () => _i16.CustomCubit(get<_i11.CustomRepository>()));
  gh.factory<_i17.CustomPage>(() => _i17.CustomPage(get<_i16.CustomCubit>()));
  gh.factory<_i18.HomePageCubit>(
      () => _i18.HomePageCubit(get<_i12.HomePageRepository>()));
  gh.factory<_i19.NotificationCubit>(
      () => _i19.NotificationCubit(get<_i13.NotificationsRepository>()));
  gh.factory<_i20.NotificationPage>(
      () => _i20.NotificationPage(get<_i19.NotificationCubit>()));
  gh.factory<_i21.Order>(() => _i21.Order(get<_i14.OrderCubit>()));
  gh.factory<_i22.OrderModule>(() => _i22.OrderModule(get<_i21.Order>()));
  gh.factory<_i23.CustomModule>(
      () => _i23.CustomModule(get<_i17.CustomPage>()));
  gh.factory<_i24.HomePage>(() => _i24.HomePage(get<_i18.HomePageCubit>()));
  gh.factory<_i25.NotificationModule>(
      () => _i25.NotificationModule(get<_i20.NotificationPage>()));
  gh.factory<_i26.MyApp>(() => _i26.MyApp(
      get<_i8.NavigatorModule>(),
      get<_i25.NotificationModule>(),
      get<_i22.OrderModule>(),
      get<_i23.CustomModule>()));
  return get;
}
