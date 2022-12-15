// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/auth_module.dart' as _i64;
import '../auth/repository/log_in_repository.dart' as _i16;
import '../auth/service/auth_service.dart' as _i4;
import '../auth/state_manager/forget_password.dart' as _i39;
import '../auth/state_manager/forget_password_otp.dart' as _i40;
import '../auth/state_manager/log_in.dart' as _i43;
import '../auth/state_manager/otp_state.dart' as _i22;
import '../auth/state_manager/reset_password.dart' as _i25;
import '../auth/state_manager/sign_up.dart' as _i27;
import '../auth/ui/screens/forget_password_list.dart' as _i41;
import '../auth/ui/screens/log_in_list.dart' as _i55;
import '../auth/ui/screens/otp_forget_pass_screen.dart' as _i60;
import '../auth/ui/screens/otp_screen.dart' as _i23;
import '../auth/ui/screens/reset_password_list.dart' as _i26;
import '../auth/ui/screens/sign_up_list.dart' as _i28;
import '../custom/custom_module.dart' as _i58;
import '../custom/repository/custom_repository.dart' as _i12;
import '../custom/state_manager/custom.dart' as _i33;
import '../custom/ui/screens/custom_list.dart' as _i34;
import '../hive/hive.dart' as _i3;
import '../home_page/homepage_module.dart' as _i63;
import '../home_page/repository/homepage_repository.dart' as _i15;
import '../home_page/state_manager/homepage.dart' as _i42;
import '../home_page/ui/screens/home_page.dart' as _i62;
import '../main.dart' as _i72;
import '../module_addresses/address_module.dart' as _i71;
import '../module_addresses/repository/address_repository.dart' as _i30;
import '../module_addresses/state_manager/address_state_manager.dart' as _i56;
import '../module_addresses/state_manager/create_address_state_manager.dart'
    as _i53;
import '../module_addresses/ui/screens/address_screen.dart' as _i57;
import '../module_driver/module_driver_orders/driver_order_module.dart' as _i59;
import '../module_driver/module_driver_orders/repository/driver_order_repository.dart'
    as _i13;
import '../module_driver/module_driver_orders/state_manager/driver_order_state_manager.dart'
    as _i35;
import '../module_driver/module_driver_orders/ui/screens/driver_order_details_screen.dart'
    as _i36;
import '../module_driver/module_driver_orders/ui/screens/order_page_list.dart'
    as _i37;
import '../module_menu_details/menu_module.dart' as _i65;
import '../module_menu_details/repository/menu_details_repository.dart' as _i11;
import '../module_menu_details/state_manager/menu_state_manager.dart' as _i31;
import '../module_menu_details/ui/screens/checkout_screen.dart' as _i32;
import '../module_menu_details/ui/screens/menu_screen.dart' as _i44;
import '../module_network/http_client/http_client.dart' as _i10;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i8;
import '../module_notifications/repository/notification_repo.dart' as _i18;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i38;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i6;
import '../module_splash/splash_module.dart' as _i29;
import '../module_splash/ui/screen/splash_screen.dart' as _i9;
import '../my_notification/Notification_module.dart' as _i66;
import '../my_notification/repository/Notification_repository.dart' as _i19;
import '../my_notification/state_manager/Notification.dart' as _i47;
import '../my_notification/ui/screens/Notification_list.dart' as _i48;
import '../navigation_bar/navigator_module.dart' as _i46;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i45;
import '../notification_module/repository/firebase_token_repository.dart'
    as _i14;
import '../notification_module/state_manager/notification.dart' as _i17;
import '../order_details/order_module.dart' as _i68;
import '../order_details/repository/order_repository.dart' as _i20;
import '../order_details/state_manager/detailes_state_manager.dart' as _i50;
import '../order_details/ui/screens/order_details_screen.dart' as _i51;
import '../orders/order_module.dart' as _i69;
import '../orders/repository/order_repository.dart' as _i21;
import '../orders/state_manager/order.dart' as _i49;
import '../orders/ui/screens/order_page_list.dart' as _i67;
import '../profile/profile_module.dart' as _i70;
import '../profile/repository/profile_repository.dart' as _i24;
import '../profile/state_manager/profile.dart' as _i52;
import '../profile/ui/screen/get_profile.dart' as _i61;
import '../profile/ui/screen/setting_screen.dart' as _i54;
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
  gh.factory<_i14.FireBaseToken>(
      () => _i14.FireBaseToken(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i15.HomePageRepository>(() =>
      _i15.HomePageRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i16.LogInRepository>(() =>
      _i16.LogInRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i17.NotificationCubit>(
      () => _i17.NotificationCubit(get<_i14.FireBaseToken>()));
  gh.factory<_i18.NotificationRepo>(() =>
      _i18.NotificationRepo(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i19.NotificationsRepository>(() => _i19.NotificationsRepository(
      get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i20.OrderDetailRepository>(() => _i20.OrderDetailRepository(
      get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i21.OrderRepository>(() =>
      _i21.OrderRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i22.OtpCubit>(
      () => _i22.OtpCubit(get<_i16.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i23.PinCodeVerificationScreen>(
      () => _i23.PinCodeVerificationScreen(get<_i22.OtpCubit>()));
  gh.factory<_i24.ProfileRepository>(() =>
      _i24.ProfileRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i25.ResetPasswordCubit>(() => _i25.ResetPasswordCubit(
      get<_i16.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i26.ResetPasswordScreen>(
      () => _i26.ResetPasswordScreen(cubit: get<_i25.ResetPasswordCubit>()));
  gh.factory<_i27.SignUpCubit>(
      () => _i27.SignUpCubit(get<_i16.LogInRepository>()));
  gh.factory<_i28.SignupScreen>(
      () => _i28.SignupScreen(cubit: get<_i27.SignUpCubit>()));
  gh.factory<_i29.SplashModule>(
      () => _i29.SplashModule(get<_i9.SplashScreen>()));
  gh.factory<_i30.AddressRepository>(() =>
      _i30.AddressRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i31.CheckOutCubit>(() => _i31.CheckOutCubit(
      get<_i11.CheckOutRepository>(), get<_i12.CustomRepository>()));
  gh.factory<_i32.CheckOutScreen>(
      () => _i32.CheckOutScreen(get<_i31.CheckOutCubit>()));
  gh.factory<_i33.CustomCubit>(
      () => _i33.CustomCubit(get<_i12.CustomRepository>()));
  gh.factory<_i34.CustomPage>(
      () => _i34.CustomPage(get<_i33.CustomCubit>(), get<_i4.AuthService>()));
  gh.factory<_i35.DriverOrderCubit>(
      () => _i35.DriverOrderCubit(get<_i13.DriverOrderRepository>()));
  gh.factory<_i36.DriverOrderDetailsScreen>(
      () => _i36.DriverOrderDetailsScreen(get<_i35.DriverOrderCubit>()));
  gh.factory<_i37.DriverOrderScreen>(() => _i37.DriverOrderScreen(
      get<_i35.DriverOrderCubit>(), get<_i4.AuthService>()));
  gh.factory<_i38.FireNotificationService>(
      () => _i38.FireNotificationService(get<_i18.NotificationRepo>()));
  gh.factory<_i39.ForgetPasswordCubit>(() => _i39.ForgetPasswordCubit(
      get<_i16.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i40.ForgetPasswordOtpCubit>(() => _i40.ForgetPasswordOtpCubit(
      get<_i16.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i41.ForgetPasswordScreen>(
      () => _i41.ForgetPasswordScreen(cubit: get<_i39.ForgetPasswordCubit>()));
  gh.factory<_i42.HomePageCubit>(() => _i42.HomePageCubit(
      get<_i15.HomePageRepository>(), get<_i11.CheckOutRepository>()));
  gh.factory<_i43.LogInCubit>(() => _i43.LogInCubit(get<_i16.LogInRepository>(),
      get<_i4.AuthService>(), get<_i38.FireNotificationService>()));
  gh.factory<_i44.MenuDetailsScreen>(() => _i44.MenuDetailsScreen(
      get<_i31.CheckOutCubit>(),
      get<_i4.AuthService>(),
      get<_i42.HomePageCubit>()));
  gh.factory<_i45.Navigationbar>(
      () => _i45.Navigationbar(get<_i42.HomePageCubit>()));
  gh.factory<_i46.NavigatorModule>(
      () => _i46.NavigatorModule(get<_i45.Navigationbar>()));
  gh.factory<_i47.NotificationCubit>(
      () => _i47.NotificationCubit(get<_i19.NotificationsRepository>()));
  gh.factory<_i48.NotificationPage>(
      () => _i48.NotificationPage(get<_i47.NotificationCubit>()));
  gh.factory<_i49.OrderCubit>(
      () => _i49.OrderCubit(get<_i21.OrderRepository>()));
  gh.factory<_i50.OrderDetailCubit>(
      () => _i50.OrderDetailCubit(get<_i20.OrderDetailRepository>()));
  gh.factory<_i51.OrderDetailsScreen>(
      () => _i51.OrderDetailsScreen(get<_i50.OrderDetailCubit>()));
  gh.factory<_i52.ProfileCubit>(
      () => _i52.ProfileCubit(get<_i24.ProfileRepository>()));
  gh.factory<_i53.RegionsCubit>(
      () => _i53.RegionsCubit(get<_i30.AddressRepository>()));
  gh.factory<_i54.SettingProfilePage>(() => _i54.SettingProfilePage(
      get<_i52.ProfileCubit>(), get<_i4.AuthService>()));
  gh.factory<_i55.loginScreen>(
      () => _i55.loginScreen(cubit: get<_i43.LogInCubit>()));
  gh.factory<_i56.AddressCubit>(
      () => _i56.AddressCubit(get<_i30.AddressRepository>()));
  gh.factory<_i57.AddressScreen>(() =>
      _i57.AddressScreen(get<_i56.AddressCubit>(), get<_i53.RegionsCubit>()));
  gh.factory<_i58.CustomModule>(
      () => _i58.CustomModule(get<_i34.CustomPage>()));
  gh.factory<_i59.DriverOrderModule>(() => _i59.DriverOrderModule(
      get<_i37.DriverOrderScreen>(), get<_i36.DriverOrderDetailsScreen>()));
  gh.factory<_i60.ForgetPassVerificationScreen>(() =>
      _i60.ForgetPassVerificationScreen(get<_i40.ForgetPasswordOtpCubit>()));
  gh.factory<_i61.GetProfilePage>(
      () => _i61.GetProfilePage(get<_i52.ProfileCubit>()));
  gh.factory<_i62.HomePage>(() => _i62.HomePage(get<_i42.HomePageCubit>(),
      get<_i3.AuthPrefsHelper>(), get<_i4.AuthService>()));
  gh.factory<_i63.HomePageModule>(
      () => _i63.HomePageModule(get<_i62.HomePage>()));
  gh.factory<_i64.LogInModule>(() => _i64.LogInModule(
      get<_i55.loginScreen>(),
      get<_i28.SignupScreen>(),
      get<_i23.PinCodeVerificationScreen>(),
      get<_i41.ForgetPasswordScreen>(),
      get<_i26.ResetPasswordScreen>(),
      get<_i60.ForgetPassVerificationScreen>()));
  gh.factory<_i65.MenuDetailsModule>(() => _i65.MenuDetailsModule(
      get<_i44.MenuDetailsScreen>(), get<_i32.CheckOutScreen>()));
  gh.factory<_i66.NotificationModule>(
      () => _i66.NotificationModule(get<_i48.NotificationPage>()));
  gh.factory<_i67.Order>(
      () => _i67.Order(get<_i49.OrderCubit>(), get<_i4.AuthService>()));
  gh.factory<_i68.OrderDetailsModule>(
      () => _i68.OrderDetailsModule(get<_i51.OrderDetailsScreen>()));
  gh.factory<_i69.OrderModule>(() => _i69.OrderModule(get<_i67.Order>()));
  gh.factory<_i70.ProfilePageModule>(() => _i70.ProfilePageModule(
      get<_i54.SettingProfilePage>(), get<_i61.GetProfilePage>()));
  gh.factory<_i71.AddressModule>(
      () => _i71.AddressModule(get<_i57.AddressScreen>()));
  gh.factory<_i72.MyApp>(() => _i72.MyApp(
      get<_i46.NavigatorModule>(),
      get<_i66.NotificationModule>(),
      get<_i69.OrderModule>(),
      get<_i58.CustomModule>(),
      get<_i71.AddressModule>(),
      get<_i63.HomePageModule>(),
      get<_i68.OrderDetailsModule>(),
      get<_i64.LogInModule>(),
      get<_i70.ProfilePageModule>(),
      get<_i65.MenuDetailsModule>(),
      get<_i29.SplashModule>(),
      get<_i59.DriverOrderModule>(),
      get<_i38.FireNotificationService>(),
      get<_i6.LocalNotificationService>()));
  return get;
}
