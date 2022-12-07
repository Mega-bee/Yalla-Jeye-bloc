// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/auth_module.dart' as _i52;
import '../auth/repository/log_in_repository.dart' as _i15;
import '../auth/service/auth_service.dart' as _i4;
import '../auth/state_manager/forget_password.dart' as _i31;
import '../auth/state_manager/log_in.dart' as _i34;
import '../auth/state_manager/otp_state.dart' as _i20;
import '../auth/state_manager/sign_up.dart' as _i23;
import '../auth/ui/screens/forget_password_list.dart' as _i32;
import '../auth/ui/screens/log_in_list.dart' as _i44;
import '../auth/ui/screens/otp_forget_pass_screen.dart' as _i48;
import '../auth/ui/screens/otp_screen.dart' as _i21;
import '../auth/ui/screens/sign_up_list.dart' as _i24;
import '../custom/custom_module.dart' as _i47;
import '../custom/repository/custom_repository.dart' as _i12;
import '../custom/state_manager/custom.dart' as _i29;
import '../custom/ui/screens/custom_list.dart' as _i30;
import '../hive/hive.dart' as _i3;
import '../home_page/homepage_module.dart' as _i51;
import '../home_page/repository/homepage_repository.dart' as _i14;
import '../home_page/state_manager/homepage.dart' as _i33;
import '../home_page/ui/screens/home_page.dart' as _i50;
import '../main.dart' as _i60;
import '../module_addresses/address_module.dart' as _i59;
import '../module_addresses/repository/address_repository.dart' as _i26;
import '../module_addresses/state_manager/address_state_manager.dart' as _i45;
import '../module_addresses/state_manager/create_address_state_manager.dart'
    as _i42;
import '../module_addresses/ui/screens/address_screen.dart' as _i46;
import '../module_menu_details/menu_module.dart' as _i53;
import '../module_menu_details/repository/menu_details_repository.dart' as _i11;
import '../module_menu_details/state_manager/menu_state_manager.dart' as _i27;
import '../module_menu_details/ui/screens/checkout_screen.dart' as _i28;
import '../module_menu_details/ui/screens/menu_screen.dart' as _i35;
import '../module_network/http_client/http_client.dart' as _i10;
import '../module_splash/splash_module.dart' as _i25;
import '../module_splash/ui/screen/splash_screen.dart' as _i9;
import '../navigation_bar/navigator_module.dart' as _i8;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i7;
import '../notification/Notification_module.dart' as _i54;
import '../notification/repository/Notification_repository.dart' as _i17;
import '../notification/state_manager/Notification.dart' as _i36;
import '../notification/ui/screens/Notification_list.dart' as _i37;
import '../notification_module/repository/firebase_token_repository.dart'
    as _i13;
import '../notification_module/state_manager/notification.dart' as _i16;
import '../order_details/order_module.dart' as _i56;
import '../order_details/repository/order_repository.dart' as _i18;
import '../order_details/state_manager/detailes_state_manager.dart' as _i39;
import '../order_details/ui/screens/order_details_screen.dart' as _i40;
import '../orders/order_module.dart' as _i57;
import '../orders/repository/order_repository.dart' as _i19;
import '../orders/state_manager/order.dart' as _i38;
import '../orders/ui/screens/order_page_list.dart' as _i55;
import '../profile/profile_module.dart' as _i58;
import '../profile/repository/profile_repository.dart' as _i22;
import '../profile/state_manager/profile.dart' as _i41;
import '../profile/ui/screen/get_profile.dart' as _i49;
import '../profile/ui/screen/setting_screen.dart' as _i43;
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
  gh.factory<_i7.Navigationbar>(() => _i7.Navigationbar());
  gh.factory<_i8.NavigatorModule>(
      () => _i8.NavigatorModule(get<_i7.Navigationbar>()));
  gh.factory<_i9.SplashScreen>(() => _i9.SplashScreen(get<_i4.AuthService>()));
  gh.factory<_i10.ApiClient>(() => _i10.ApiClient(get<_i6.Logger>()));
  gh.factory<_i11.CheckOutRepository>(() =>
      _i11.CheckOutRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i12.CustomRepository>(() =>
      _i12.CustomRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i13.FireBaseToken>(
      () => _i13.FireBaseToken(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i14.HomePageRepository>(() =>
      _i14.HomePageRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i15.LogInRepository>(() =>
      _i15.LogInRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i16.NotificationCubit>(
      () => _i16.NotificationCubit(get<_i13.FireBaseToken>()));
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
  gh.factory<_i31.ForgetPasswordCubit>(() => _i31.ForgetPasswordCubit(
      get<_i15.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i32.ForgetPasswordScreen>(
      () => _i32.ForgetPasswordScreen(cubit: get<_i31.ForgetPasswordCubit>()));
  gh.factory<_i33.HomePageCubit>(() => _i33.HomePageCubit(
      get<_i14.HomePageRepository>(), get<_i11.CheckOutRepository>()));
  gh.factory<_i34.LogInCubit>(() =>
      _i34.LogInCubit(get<_i15.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i35.MenuDetailsScreen>(() => _i35.MenuDetailsScreen(
      get<_i27.CheckOutCubit>(), get<_i4.AuthService>()));
  gh.factory<_i36.NotificationCubit>(
      () => _i36.NotificationCubit(get<_i17.NotificationsRepository>()));
  gh.factory<_i37.NotificationPage>(
      () => _i37.NotificationPage(get<_i36.NotificationCubit>()));
  gh.factory<_i38.OrderCubit>(
      () => _i38.OrderCubit(get<_i19.OrderRepository>()));
  gh.factory<_i39.OrderDetailCubit>(
      () => _i39.OrderDetailCubit(get<_i18.OrderDetailRepository>()));
  gh.factory<_i40.OrderDetailsScreen>(
      () => _i40.OrderDetailsScreen(get<_i39.OrderDetailCubit>()));
  gh.factory<_i41.ProfileCubit>(
      () => _i41.ProfileCubit(get<_i22.ProfileRepository>()));
  gh.factory<_i42.RegionsCubit>(
      () => _i42.RegionsCubit(get<_i26.AddressRepository>()));
  gh.factory<_i43.SettingProfilePage>(() => _i43.SettingProfilePage(
      get<_i41.ProfileCubit>(), get<_i4.AuthService>()));
  gh.factory<_i44.loginScreen>(
      () => _i44.loginScreen(cubit: get<_i34.LogInCubit>()));
  gh.factory<_i45.AddressCubit>(
      () => _i45.AddressCubit(get<_i26.AddressRepository>()));
  gh.factory<_i46.AddressScreen>(() =>
      _i46.AddressScreen(get<_i45.AddressCubit>(), get<_i42.RegionsCubit>()));
  gh.factory<_i47.CustomModule>(
      () => _i47.CustomModule(get<_i30.CustomPage>()));
  gh.factory<_i48.ForgetPassVerificationScreen>(
      () => _i48.ForgetPassVerificationScreen(get<_i31.ForgetPasswordCubit>()));
  gh.factory<_i49.GetProfilePage>(
      () => _i49.GetProfilePage(get<_i41.ProfileCubit>()));
  gh.factory<_i50.HomePage>(() => _i50.HomePage(get<_i33.HomePageCubit>(),
      get<_i3.AuthPrefsHelper>(), get<_i4.AuthService>()));
  gh.factory<_i51.HomePageModule>(
      () => _i51.HomePageModule(get<_i50.HomePage>()));
  gh.factory<_i52.LogInModule>(() => _i52.LogInModule(
      get<_i44.loginScreen>(),
      get<_i24.SignupScreen>(),
      get<_i21.PinCodeVerificationScreen>(),
      get<_i32.ForgetPasswordScreen>(),
      get<_i48.ForgetPassVerificationScreen>()));
  gh.factory<_i53.MenuDetailsModule>(() => _i53.MenuDetailsModule(
      get<_i35.MenuDetailsScreen>(), get<_i28.CheckOutScreen>()));
  gh.factory<_i54.NotificationModule>(
      () => _i54.NotificationModule(get<_i37.NotificationPage>()));
  gh.factory<_i55.Order>(
      () => _i55.Order(get<_i38.OrderCubit>(), get<_i4.AuthService>()));
  gh.factory<_i56.OrderDetailsModule>(
      () => _i56.OrderDetailsModule(get<_i40.OrderDetailsScreen>()));
  gh.factory<_i57.OrderModule>(() => _i57.OrderModule(get<_i55.Order>()));
  gh.factory<_i58.ProfilePageModule>(() => _i58.ProfilePageModule(
      get<_i43.SettingProfilePage>(), get<_i49.GetProfilePage>()));
  gh.factory<_i59.AddressModule>(
      () => _i59.AddressModule(get<_i46.AddressScreen>()));
  gh.factory<_i60.MyApp>(() => _i60.MyApp(
      get<_i8.NavigatorModule>(),
      get<_i54.NotificationModule>(),
      get<_i57.OrderModule>(),
      get<_i47.CustomModule>(),
      get<_i59.AddressModule>(),
      get<_i51.HomePageModule>(),
      get<_i56.OrderDetailsModule>(),
      get<_i52.LogInModule>(),
      get<_i58.ProfilePageModule>(),
      get<_i53.MenuDetailsModule>(),
      get<_i25.SplashModule>()));
  return get;
}
