// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/auth_module.dart' as _i56;
import '../auth/repository/log_in_repository.dart' as _i15;
import '../auth/service/auth_service.dart' as _i4;
import '../auth/state_manager/log_in.dart' as _i36;
import '../auth/state_manager/otp_state.dart' as _i20;
import '../auth/state_manager/sign_up.dart' as _i23;
import '../auth/ui/screens/log_in_list.dart' as _i48;
import '../auth/ui/screens/otp_screen.dart' as _i21;
import '../auth/ui/screens/sign_up_list.dart' as _i24;
import '../custom/custom_module.dart' as _i51;
import '../custom/repository/custom_repository.dart' as _i12;
import '../custom/state_manager/custom.dart' as _i29;
import '../custom/ui/screens/custom_list.dart' as _i30;
import '../hive/hive.dart' as _i3;
import '../home_page/homepage_module.dart' as _i55;
import '../home_page/repository/homepage_repository.dart' as _i14;
import '../home_page/state_manager/homepage.dart' as _i35;
import '../home_page/ui/screens/home_page.dart' as _i54;
import '../main.dart' as _i64;
import '../module_addresses/address_module.dart' as _i63;
import '../module_addresses/repository/address_repository.dart' as _i26;
import '../module_addresses/state_manager/address_state_manager.dart' as _i49;
import '../module_addresses/state_manager/create_address_state_manager.dart'
    as _i46;
import '../module_addresses/ui/screens/address_screen.dart' as _i50;
import '../module_driver/module_driver_orders/driver_order_module.dart' as _i52;
import '../module_driver/module_driver_orders/repository/driver_order_repository.dart'
    as _i13;
import '../module_driver/module_driver_orders/state_manager/driver_order_state_manager.dart'
    as _i31;
import '../module_driver/module_driver_orders/ui/screens/driver_order_details_screen.dart'
    as _i32;
import '../module_driver/module_driver_orders/ui/screens/order_page_list.dart'
    as _i33;
import '../module_menu_details/menu_module.dart' as _i57;
import '../module_menu_details/repository/menu_details_repository.dart' as _i11;
import '../module_menu_details/state_manager/menu_state_manager.dart' as _i27;
import '../module_menu_details/ui/screens/checkout_screen.dart' as _i28;
import '../module_menu_details/ui/screens/menu_screen.dart' as _i37;
import '../module_network/http_client/http_client.dart' as _i10;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i8;
import '../module_notifications/repository/notification_repo.dart' as _i16;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i34;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i6;
import '../module_splash/splash_module.dart' as _i25;
import '../module_splash/ui/screen/splash_screen.dart' as _i9;
import '../my_notification/Notification_module.dart' as _i58;
import '../my_notification/repository/Notification_repository.dart' as _i17;
import '../my_notification/state_manager/Notification.dart' as _i40;
import '../my_notification/ui/screens/Notification_list.dart' as _i41;
import '../navigation_bar/navigator_module.dart' as _i39;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i38;
import '../order_details/order_module.dart' as _i60;
import '../order_details/repository/order_repository.dart' as _i18;
import '../order_details/state_manager/detailes_state_manager.dart' as _i43;
import '../order_details/ui/screens/order_details_screen.dart' as _i44;
import '../orders/order_module.dart' as _i61;
import '../orders/repository/order_repository.dart' as _i19;
import '../orders/state_manager/order.dart' as _i42;
import '../orders/ui/screens/order_page_list.dart' as _i59;
import '../profile/profile_module.dart' as _i62;
import '../profile/repository/profile_repository.dart' as _i22;
import '../profile/state_manager/profile.dart' as _i45;
import '../profile/ui/screen/get_profile.dart' as _i53;
import '../profile/ui/screen/setting_screen.dart' as _i47;
import '../utils/global/global_state_manager.dart' as _i5;
import '../utils/logger/logger.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthPrefsHelper>(() => _i3.AuthPrefsHelper());
  gh.factory<_i4.AuthService>(
      () => _i4.AuthService(get<_i3.AuthPrefsHelper>()));
  gh.singleton<_i5.GlobalStateManager>(_i5.GlobalStateManager());
  gh.factory<_i6.LocalNotificationService>(
      () => _i6.LocalNotificationService());
  gh.factory<_i7.Logger>(() => _i7.Logger());
  gh.factory<_i8.NotificationsPrefHelper>(() => _i8.NotificationsPrefHelper());
  gh.factory<_i9.SplashScreen>(() => _i9.SplashScreen(get<_i4.AuthService>()));
  gh.factory<_i10.ApiClient>(() => _i10.ApiClient(get<_i7.Logger>()));
  gh.factory<_i11.CheckOutRepository>(() =>
      _i11.CheckOutRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i12.CustomRepository>(() =>
      _i12.CustomRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i13.DriverOrderRepository>(() => _i13.DriverOrderRepository(
      get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i14.HomePageRepository>(() =>
      _i14.HomePageRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i15.LogInRepository>(() =>
      _i15.LogInRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i16.NotificationRepo>(() =>
      _i16.NotificationRepo(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i17.NotificationsRepository>(() => _i17.NotificationsRepository(
      get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i18.OrderDetailRepository>(() => _i18.OrderDetailRepository(
      get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i19.OrderRepository>(() =>
      _i19.OrderRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i20.OtpCubit>(
      () => _i20.OtpCubit(get<_i15.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i21.PinCodeVerificationScreen>(
      () => _i21.PinCodeVerificationScreen(get<_i20.OtpCubit>()));
  gh.factory<_i22.ProfileRepository>(() =>
      _i22.ProfileRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i23.SignUpCubit>(
      () => _i23.SignUpCubit(get<_i15.LogInRepository>()));
  gh.factory<_i24.SignupScreen>(
      () => _i24.SignupScreen(cubit: get<_i23.SignUpCubit>()));
  gh.factory<_i25.SplashModule>(
      () => _i25.SplashModule(get<_i9.SplashScreen>()));
  gh.factory<_i26.AddressRepository>(() =>
      _i26.AddressRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i27.CheckOutCubit>(() => _i27.CheckOutCubit(
      get<_i11.CheckOutRepository>(), get<_i12.CustomRepository>()));
  gh.factory<_i28.CheckOutScreen>(
      () => _i28.CheckOutScreen(get<_i27.CheckOutCubit>()));
  gh.factory<_i29.CustomCubit>(
      () => _i29.CustomCubit(get<_i12.CustomRepository>()));
  gh.factory<_i30.CustomPage>(
      () => _i30.CustomPage(get<_i29.CustomCubit>(), get<_i4.AuthService>()));
  gh.factory<_i31.DriverOrderCubit>(
      () => _i31.DriverOrderCubit(get<_i13.DriverOrderRepository>()));
  gh.factory<_i32.DriverOrderDetailsScreen>(
      () => _i32.DriverOrderDetailsScreen(get<_i31.DriverOrderCubit>()));
  gh.factory<_i33.DriverOrderScreen>(() => _i33.DriverOrderScreen(
      get<_i31.DriverOrderCubit>(), get<_i4.AuthService>()));
  gh.factory<_i34.FireNotificationService>(
      () => _i34.FireNotificationService(get<_i16.NotificationRepo>()));
  gh.factory<_i35.HomePageCubit>(() => _i35.HomePageCubit(
      get<_i14.HomePageRepository>(), get<_i11.CheckOutRepository>()));
  gh.factory<_i36.LogInCubit>(() => _i36.LogInCubit(get<_i15.LogInRepository>(),
      get<_i4.AuthService>(), get<_i34.FireNotificationService>()));
  gh.factory<_i37.MenuDetailsScreen>(() => _i37.MenuDetailsScreen(
      get<_i27.CheckOutCubit>(),
      get<_i4.AuthService>(),
      get<_i35.HomePageCubit>()));
  gh.factory<_i38.Navigationbar>(
      () => _i38.Navigationbar(get<_i35.HomePageCubit>()));
  gh.factory<_i39.NavigatorModule>(
      () => _i39.NavigatorModule(get<_i38.Navigationbar>()));
  gh.factory<_i40.NotificationCubit>(
      () => _i40.NotificationCubit(get<_i17.NotificationsRepository>()));
  gh.factory<_i41.NotificationPage>(
      () => _i41.NotificationPage(get<_i40.NotificationCubit>()));
  gh.factory<_i42.OrderCubit>(
      () => _i42.OrderCubit(get<_i19.OrderRepository>()));
  gh.factory<_i43.OrderDetailCubit>(
      () => _i43.OrderDetailCubit(get<_i18.OrderDetailRepository>()));
  gh.factory<_i44.OrderDetailsScreen>(
      () => _i44.OrderDetailsScreen(get<_i43.OrderDetailCubit>()));
  gh.factory<_i45.ProfileCubit>(
      () => _i45.ProfileCubit(get<_i22.ProfileRepository>()));
  gh.factory<_i46.RegionsCubit>(
      () => _i46.RegionsCubit(get<_i26.AddressRepository>()));
  gh.factory<_i47.SettingProfilePage>(() => _i47.SettingProfilePage(
      get<_i45.ProfileCubit>(), get<_i4.AuthService>()));
  gh.factory<_i48.loginScreen>(
      () => _i48.loginScreen(cubit: get<_i36.LogInCubit>()));
  gh.factory<_i49.AddressCubit>(
      () => _i49.AddressCubit(get<_i26.AddressRepository>()));
  gh.factory<_i50.AddressScreen>(() =>
      _i50.AddressScreen(get<_i49.AddressCubit>(), get<_i46.RegionsCubit>()));
  gh.factory<_i51.CustomModule>(
      () => _i51.CustomModule(get<_i30.CustomPage>()));
  gh.factory<_i52.DriverOrderModule>(() => _i52.DriverOrderModule(
      get<_i33.DriverOrderScreen>(), get<_i32.DriverOrderDetailsScreen>()));
  gh.factory<_i53.GetProfilePage>(
      () => _i53.GetProfilePage(get<_i45.ProfileCubit>()));
  gh.factory<_i54.HomePage>(() => _i54.HomePage(get<_i35.HomePageCubit>(),
      get<_i3.AuthPrefsHelper>(), get<_i4.AuthService>()));
  gh.factory<_i55.HomePageModule>(
      () => _i55.HomePageModule(get<_i54.HomePage>()));
  gh.factory<_i56.LogInModule>(() => _i56.LogInModule(get<_i48.loginScreen>(),
      get<_i24.SignupScreen>(), get<_i21.PinCodeVerificationScreen>()));
  gh.factory<_i57.MenuDetailsModule>(() => _i57.MenuDetailsModule(
      get<_i37.MenuDetailsScreen>(), get<_i28.CheckOutScreen>()));
  gh.factory<_i58.NotificationModule>(
      () => _i58.NotificationModule(get<_i41.NotificationPage>()));
  gh.factory<_i59.Order>(
      () => _i59.Order(get<_i42.OrderCubit>(), get<_i4.AuthService>()));
  gh.factory<_i60.OrderDetailsModule>(
      () => _i60.OrderDetailsModule(get<_i44.OrderDetailsScreen>()));
  gh.factory<_i61.OrderModule>(() => _i61.OrderModule(get<_i59.Order>()));
  gh.factory<_i62.ProfilePageModule>(() => _i62.ProfilePageModule(
      get<_i47.SettingProfilePage>(), get<_i53.GetProfilePage>()));
  gh.factory<_i63.AddressModule>(
      () => _i63.AddressModule(get<_i50.AddressScreen>()));
  gh.factory<_i64.MyApp>(() => _i64.MyApp(
      get<_i39.NavigatorModule>(),
      get<_i58.NotificationModule>(),
      get<_i61.OrderModule>(),
      get<_i51.CustomModule>(),
      get<_i63.AddressModule>(),
      get<_i55.HomePageModule>(),
      get<_i60.OrderDetailsModule>(),
      get<_i56.LogInModule>(),
      get<_i62.ProfilePageModule>(),
      get<_i57.MenuDetailsModule>(),
      get<_i25.SplashModule>(),
      get<_i52.DriverOrderModule>(),
      get<_i34.FireNotificationService>(),
      get<_i6.LocalNotificationService>()));
  return get;
}
