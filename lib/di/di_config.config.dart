// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/auth_module.dart' as _i60;
import '../auth/repository/log_in_repository.dart' as _i14;
import '../auth/service/auth_service.dart' as _i4;
import '../auth/state_manager/forget_password.dart' as _i35;
import '../auth/state_manager/forget_password_otp.dart' as _i36;
import '../auth/state_manager/log_in.dart' as _i39;
import '../auth/state_manager/otp_state.dart' as _i19;
import '../auth/state_manager/reset_password.dart' as _i22;
import '../auth/state_manager/sign_up.dart' as _i24;
import '../auth/ui/screens/forget_password_list.dart' as _i37;
import '../auth/ui/screens/log_in_list.dart' as _i51;
import '../auth/ui/screens/otp_forget_pass_screen.dart' as _i56;
import '../auth/ui/screens/otp_screen.dart' as _i20;
import '../auth/ui/screens/reset_password_list.dart' as _i23;
import '../auth/ui/screens/sign_up_list.dart' as _i25;
import '../custom/custom_module.dart' as _i54;
import '../custom/repository/custom_repository.dart' as _i10;
import '../custom/state_manager/custom.dart' as _i30;
import '../custom/ui/screens/custom_list.dart' as _i31;
import '../hive/hive.dart' as _i3;
import '../home_page/homepage_module.dart' as _i59;
import '../home_page/repository/homepage_repository.dart' as _i13;
import '../home_page/state_manager/homepage.dart' as _i38;
import '../home_page/ui/screens/home_page.dart' as _i58;
import '../main.dart' as _i68;
import '../module_addresses/address_module.dart' as _i67;
import '../module_addresses/repository/address_repository.dart' as _i27;
import '../module_addresses/state_manager/address_state_manager.dart' as _i52;
import '../module_addresses/state_manager/create_address_state_manager.dart'
    as _i49;
import '../module_addresses/ui/screens/address_screen.dart' as _i53;
import '../module_driver/module_driver_orders/driver_order_module.dart' as _i55;
import '../module_driver/module_driver_orders/repository/driver_order_repository.dart'
    as _i11;
import '../module_driver/module_driver_orders/state_manager/driver_order_state_manager.dart'
    as _i32;
import '../module_driver/module_driver_orders/ui/screens/driver_order_details_screen.dart'
    as _i33;
import '../module_driver/module_driver_orders/ui/screens/order_page_list.dart'
    as _i34;
import '../module_menu_details/menu_module.dart' as _i61;
import '../module_menu_details/repository/menu_details_repository.dart' as _i9;
import '../module_menu_details/state_manager/menu_state_manager.dart' as _i28;
import '../module_menu_details/ui/screens/checkout_screen.dart' as _i29;
import '../module_menu_details/ui/screens/menu_screen.dart' as _i40;
import '../module_network/http_client/http_client.dart' as _i8;
import '../module_splash/splash_module.dart' as _i26;
import '../module_splash/ui/screen/splash_screen.dart' as _i7;
import '../navigation_bar/navigator_module.dart' as _i42;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i41;
import '../notification/Notification_module.dart' as _i62;
import '../notification/repository/Notification_repository.dart' as _i16;
import '../notification/state_manager/Notification.dart' as _i43;
import '../notification/ui/screens/Notification_list.dart' as _i44;
import '../notification_module/repository/firebase_token_repository.dart'
    as _i12;
import '../notification_module/state_manager/notification.dart' as _i15;
import '../order_details/order_module.dart' as _i64;
import '../order_details/repository/order_repository.dart' as _i17;
import '../order_details/state_manager/detailes_state_manager.dart' as _i46;
import '../order_details/ui/screens/order_details_screen.dart' as _i47;
import '../orders/order_module.dart' as _i65;
import '../orders/repository/order_repository.dart' as _i18;
import '../orders/state_manager/order.dart' as _i45;
import '../orders/ui/screens/order_page_list.dart' as _i63;
import '../profile/profile_module.dart' as _i66;
import '../profile/repository/profile_repository.dart' as _i21;
import '../profile/state_manager/profile.dart' as _i48;
import '../profile/ui/screen/get_profile.dart' as _i57;
import '../profile/ui/screen/setting_screen.dart' as _i50;
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
  gh.factory<_i6.Logger>(() => _i6.Logger());
  gh.factory<_i7.SplashScreen>(() => _i7.SplashScreen(get<_i4.AuthService>()));
  gh.factory<_i8.ApiClient>(() => _i8.ApiClient(get<_i6.Logger>()));
  gh.factory<_i9.CheckOutRepository>(() =>
      _i9.CheckOutRepository(get<_i8.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i10.CustomRepository>(() =>
      _i10.CustomRepository(get<_i8.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i11.DriverOrderRepository>(() =>
      _i11.DriverOrderRepository(get<_i8.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i12.FireBaseToken>(
      () => _i12.FireBaseToken(get<_i8.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i13.HomePageRepository>(() =>
      _i13.HomePageRepository(get<_i8.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i14.LogInRepository>(
      () => _i14.LogInRepository(get<_i8.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i15.NotificationCubit>(
      () => _i15.NotificationCubit(get<_i12.FireBaseToken>()));
  gh.factory<_i16.NotificationsRepository>(() => _i16.NotificationsRepository(
      get<_i8.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i17.OrderDetailRepository>(() =>
      _i17.OrderDetailRepository(get<_i8.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i18.OrderRepository>(
      () => _i18.OrderRepository(get<_i8.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i19.OtpCubit>(
      () => _i19.OtpCubit(get<_i14.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i20.PinCodeVerificationScreen>(
      () => _i20.PinCodeVerificationScreen(get<_i19.OtpCubit>()));
  gh.factory<_i21.ProfileRepository>(() =>
      _i21.ProfileRepository(get<_i8.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i22.ResetPasswordCubit>(() => _i22.ResetPasswordCubit(
      get<_i14.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i23.ResetPasswordScreen>(
      () => _i23.ResetPasswordScreen(cubit: get<_i22.ResetPasswordCubit>()));
  gh.factory<_i24.SignUpCubit>(
      () => _i24.SignUpCubit(get<_i14.LogInRepository>()));
  gh.factory<_i25.SignupScreen>(
      () => _i25.SignupScreen(cubit: get<_i24.SignUpCubit>()));
  gh.factory<_i26.SplashModule>(
      () => _i26.SplashModule(get<_i7.SplashScreen>()));
  gh.factory<_i27.AddressRepository>(() =>
      _i27.AddressRepository(get<_i8.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i28.CheckOutCubit>(() => _i28.CheckOutCubit(
      get<_i9.CheckOutRepository>(), get<_i10.CustomRepository>()));
  gh.factory<_i29.CheckOutScreen>(
      () => _i29.CheckOutScreen(get<_i28.CheckOutCubit>()));
  gh.factory<_i30.CustomCubit>(
      () => _i30.CustomCubit(get<_i10.CustomRepository>()));
  gh.factory<_i31.CustomPage>(
      () => _i31.CustomPage(get<_i30.CustomCubit>(), get<_i4.AuthService>()));
  gh.factory<_i32.DriverOrderCubit>(
      () => _i32.DriverOrderCubit(get<_i11.DriverOrderRepository>()));
  gh.factory<_i33.DriverOrderDetailsScreen>(
      () => _i33.DriverOrderDetailsScreen(get<_i32.DriverOrderCubit>()));
  gh.factory<_i34.DriverOrderScreen>(() => _i34.DriverOrderScreen(
      get<_i32.DriverOrderCubit>(), get<_i4.AuthService>()));
  gh.factory<_i35.ForgetPasswordCubit>(() => _i35.ForgetPasswordCubit(
      get<_i14.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i36.ForgetPasswordOtpCubit>(() => _i36.ForgetPasswordOtpCubit(
      get<_i14.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i37.ForgetPasswordScreen>(
      () => _i37.ForgetPasswordScreen(cubit: get<_i35.ForgetPasswordCubit>()));
  gh.factory<_i38.HomePageCubit>(() => _i38.HomePageCubit(
      get<_i13.HomePageRepository>(), get<_i9.CheckOutRepository>()));
  gh.factory<_i39.LogInCubit>(() =>
      _i39.LogInCubit(get<_i14.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i40.MenuDetailsScreen>(() => _i40.MenuDetailsScreen(
      get<_i28.CheckOutCubit>(),
      get<_i4.AuthService>(),
      get<_i38.HomePageCubit>()));
  gh.factory<_i41.Navigationbar>(
      () => _i41.Navigationbar(get<_i38.HomePageCubit>()));
  gh.factory<_i42.NavigatorModule>(
      () => _i42.NavigatorModule(get<_i41.Navigationbar>()));
  gh.factory<_i43.NotificationCubit>(
      () => _i43.NotificationCubit(get<_i16.NotificationsRepository>()));
  gh.factory<_i44.NotificationPage>(
      () => _i44.NotificationPage(get<_i43.NotificationCubit>()));
  gh.factory<_i45.OrderCubit>(
      () => _i45.OrderCubit(get<_i18.OrderRepository>()));
  gh.factory<_i46.OrderDetailCubit>(
      () => _i46.OrderDetailCubit(get<_i17.OrderDetailRepository>()));
  gh.factory<_i47.OrderDetailsScreen>(
      () => _i47.OrderDetailsScreen(get<_i46.OrderDetailCubit>()));
  gh.factory<_i48.ProfileCubit>(
      () => _i48.ProfileCubit(get<_i21.ProfileRepository>()));
  gh.factory<_i49.RegionsCubit>(
      () => _i49.RegionsCubit(get<_i27.AddressRepository>()));
  gh.factory<_i50.SettingProfilePage>(() => _i50.SettingProfilePage(
      get<_i48.ProfileCubit>(), get<_i4.AuthService>()));
  gh.factory<_i51.loginScreen>(
      () => _i51.loginScreen(cubit: get<_i39.LogInCubit>()));
  gh.factory<_i52.AddressCubit>(
      () => _i52.AddressCubit(get<_i27.AddressRepository>()));
  gh.factory<_i53.AddressScreen>(() =>
      _i53.AddressScreen(get<_i52.AddressCubit>(), get<_i49.RegionsCubit>()));
  gh.factory<_i54.CustomModule>(
      () => _i54.CustomModule(get<_i31.CustomPage>()));
  gh.factory<_i55.DriverOrderModule>(() => _i55.DriverOrderModule(
      get<_i34.DriverOrderScreen>(), get<_i33.DriverOrderDetailsScreen>()));
  gh.factory<_i56.ForgetPassVerificationScreen>(
      () => _i56.ForgetPassVerificationScreen(get<_i35.ForgetPasswordCubit>()));
  gh.factory<_i57.GetProfilePage>(
      () => _i57.GetProfilePage(get<_i48.ProfileCubit>()));
  gh.factory<_i58.HomePage>(() => _i58.HomePage(get<_i38.HomePageCubit>(),
      get<_i3.AuthPrefsHelper>(), get<_i4.AuthService>()));
  gh.factory<_i59.HomePageModule>(
      () => _i59.HomePageModule(get<_i58.HomePage>()));
  gh.factory<_i60.LogInModule>(() => _i60.LogInModule(
      get<_i51.loginScreen>(),
      get<_i25.SignupScreen>(),
      get<_i20.PinCodeVerificationScreen>(),
      get<_i37.ForgetPasswordScreen>(),
      get<_i23.ResetPasswordScreen>(),
      get<_i56.ForgetPassVerificationScreen>()));
  gh.factory<_i61.MenuDetailsModule>(() => _i61.MenuDetailsModule(
      get<_i40.MenuDetailsScreen>(), get<_i29.CheckOutScreen>()));
  gh.factory<_i62.NotificationModule>(
      () => _i62.NotificationModule(get<_i44.NotificationPage>()));
  gh.factory<_i63.Order>(
      () => _i63.Order(get<_i45.OrderCubit>(), get<_i4.AuthService>()));
  gh.factory<_i64.OrderDetailsModule>(
      () => _i64.OrderDetailsModule(get<_i47.OrderDetailsScreen>()));
  gh.factory<_i65.OrderModule>(() => _i65.OrderModule(get<_i63.Order>()));
  gh.factory<_i66.ProfilePageModule>(() => _i66.ProfilePageModule(
      get<_i50.SettingProfilePage>(), get<_i57.GetProfilePage>()));
  gh.factory<_i67.AddressModule>(
      () => _i67.AddressModule(get<_i53.AddressScreen>()));
  gh.factory<_i68.MyApp>(() => _i68.MyApp(
      get<_i42.NavigatorModule>(),
      get<_i62.NotificationModule>(),
      get<_i65.OrderModule>(),
      get<_i54.CustomModule>(),
      get<_i67.AddressModule>(),
      get<_i59.HomePageModule>(),
      get<_i64.OrderDetailsModule>(),
      get<_i60.LogInModule>(),
      get<_i66.ProfilePageModule>(),
      get<_i61.MenuDetailsModule>(),
      get<_i26.SplashModule>(),
      get<_i55.DriverOrderModule>()));
  return get;
}
