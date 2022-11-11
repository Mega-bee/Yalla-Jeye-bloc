// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/auth_module.dart' as _i47;
import '../auth/repository/log_in_repository.dart' as _i14;
import '../auth/service/auth_service.dart' as _i4;
import '../auth/state_manager/log_in.dart' as _i30;
import '../auth/state_manager/otp_state.dart' as _i18;
import '../auth/state_manager/sign_up.dart' as _i21;
import '../auth/ui/screens/log_in_list.dart' as _i40;
import '../auth/ui/screens/otp_screen.dart' as _i19;
import '../auth/ui/screens/sign_up_list.dart' as _i22;
import '../custom/custom_module.dart' as _i43;
import '../custom/repository/custom_repository.dart' as _i12;
import '../custom/state_manager/custom.dart' as _i27;
import '../custom/ui/screens/custom_list.dart' as _i28;
import '../hive/hive.dart' as _i3;
import '../home_page/homepage_module.dart' as _i46;
import '../home_page/repository/homepage_repository.dart' as _i13;
import '../home_page/state_manager/homepage.dart' as _i29;
import '../home_page/ui/screens/home_page.dart' as _i45;
import '../main.dart' as _i54;
import '../module_addresses/address_module.dart' as _i53;
import '../module_addresses/repository/address_repository.dart' as _i24;
import '../module_addresses/state_manager/address_state_manager.dart' as _i41;
import '../module_addresses/ui/screens/address_screen.dart' as _i42;
import '../module_menu_details/menu_module.dart' as _i48;
import '../module_menu_details/repository/menu_details_repository.dart' as _i11;
import '../module_menu_details/state_manager/menu_state_manager.dart' as _i25;
import '../module_menu_details/ui/screens/checkout_screen.dart' as _i26;
import '../module_menu_details/ui/screens/menu_screen.dart' as _i31;
import '../module_network/http_client/http_client.dart' as _i10;
import '../module_splash/splash_module.dart' as _i23;
import '../module_splash/ui/screen/splash_screen.dart' as _i9;
import '../navigation_bar/navigator_module.dart' as _i8;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i7;
import '../notification/Notification_module.dart' as _i49;
import '../notification/repository/Notification_repository.dart' as _i15;
import '../notification/state_manager/Notification.dart' as _i32;
import '../notification/ui/screens/Notification_list.dart' as _i33;
import '../order_details/order_module.dart' as _i37;
import '../order_details/repository/order_repository.dart' as _i16;
import '../order_details/state_manager/order.dart' as _i35;
import '../order_details/ui/screens/order_page_list.dart' as _i36;
import '../orders/order_module.dart' as _i51;
import '../orders/repository/order_repository.dart' as _i17;
import '../orders/state_manager/order.dart' as _i34;
import '../orders/ui/screens/order_page_list.dart' as _i50;
import '../profile/profile_module.dart' as _i52;
import '../profile/repository/profile_repository.dart' as _i20;
import '../profile/state_manager/profile.dart' as _i38;
import '../profile/ui/screen/get_profile.dart' as _i44;
import '../profile/ui/screen/profile.dart' as _i39;
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
  gh.factory<_i13.HomePageRepository>(() =>
      _i13.HomePageRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i14.LogInRepository>(() =>
      _i14.LogInRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i15.NotificationsRepository>(() => _i15.NotificationsRepository(
      get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i16.OrderDetailRepository>(() => _i16.OrderDetailRepository(
      get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i17.OrderRepository>(() =>
      _i17.OrderRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i18.OtpCubit>(
      () => _i18.OtpCubit(get<_i14.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i19.PinCodeVerificationScreen>(
      () => _i19.PinCodeVerificationScreen(get<_i18.OtpCubit>()));
  gh.factory<_i20.ProfileRepository>(() =>
      _i20.ProfileRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i21.SignUpCubit>(
      () => _i21.SignUpCubit(get<_i14.LogInRepository>()));
  gh.factory<_i22.SignupScreen>(
      () => _i22.SignupScreen(cubit: get<_i21.SignUpCubit>()));
  gh.factory<_i23.SplashModule>(
      () => _i23.SplashModule(get<_i9.SplashScreen>()));
  gh.factory<_i24.AddressRepository>(() =>
      _i24.AddressRepository(get<_i10.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i25.CheckOutCubit>(
      () => _i25.CheckOutCubit(get<_i11.CheckOutRepository>()));
  gh.factory<_i26.CheckOutScreen>(
      () => _i26.CheckOutScreen(get<_i25.CheckOutCubit>()));
  gh.factory<_i27.CustomCubit>(
      () => _i27.CustomCubit(get<_i12.CustomRepository>()));
  gh.factory<_i28.CustomPage>(
      () => _i28.CustomPage(get<_i27.CustomCubit>(), get<_i4.AuthService>()));
  gh.factory<_i29.HomePageCubit>(
      () => _i29.HomePageCubit(get<_i13.HomePageRepository>()));
  gh.factory<_i30.LogInCubit>(() =>
      _i30.LogInCubit(get<_i14.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i31.MenuDetailsScreen>(() => _i31.MenuDetailsScreen(
      get<_i25.CheckOutCubit>(), get<_i4.AuthService>()));
  gh.factory<_i32.NotificationCubit>(
      () => _i32.NotificationCubit(get<_i15.NotificationsRepository>()));
  gh.factory<_i33.NotificationPage>(
      () => _i33.NotificationPage(get<_i32.NotificationCubit>()));
  gh.factory<_i34.OrderCubit>(
      () => _i34.OrderCubit(get<_i17.OrderRepository>()));
  gh.factory<_i35.OrderDetailCubit>(
      () => _i35.OrderDetailCubit(get<_i16.OrderDetailRepository>()));
  gh.factory<_i36.OrderDetails>(
      () => _i36.OrderDetails(get<_i35.OrderDetailCubit>()));
  gh.factory<_i37.OrderDetailsModule>(
      () => _i37.OrderDetailsModule(get<_i36.OrderDetails>()));
  gh.factory<_i38.ProfileCubit>(
      () => _i38.ProfileCubit(get<_i20.ProfileRepository>()));
  gh.factory<_i39.ProfilePage>(
      () => _i39.ProfilePage(get<_i38.ProfileCubit>(), get<_i4.AuthService>()));
  gh.factory<_i40.loginScreen>(
      () => _i40.loginScreen(cubit: get<_i30.LogInCubit>()));
  gh.factory<_i41.AddressCubit>(
      () => _i41.AddressCubit(get<_i24.AddressRepository>()));
  gh.factory<_i42.AddressScreen>(
      () => _i42.AddressScreen(get<_i41.AddressCubit>()));
  gh.factory<_i43.CustomModule>(
      () => _i43.CustomModule(get<_i28.CustomPage>()));
  gh.factory<_i44.GetProfilePage>(
      () => _i44.GetProfilePage(get<_i38.ProfileCubit>()));
  gh.factory<_i45.HomePage>(() => _i45.HomePage(get<_i29.HomePageCubit>(),
      get<_i3.AuthPrefsHelper>(), get<_i4.AuthService>()));
  gh.factory<_i46.HomePageModule>(
      () => _i46.HomePageModule(get<_i45.HomePage>()));
  gh.factory<_i47.LogInModule>(() => _i47.LogInModule(get<_i40.loginScreen>(),
      get<_i22.SignupScreen>(), get<_i19.PinCodeVerificationScreen>()));
  gh.factory<_i48.MenuDetailsModule>(() => _i48.MenuDetailsModule(
      get<_i31.MenuDetailsScreen>(), get<_i26.CheckOutScreen>()));
  gh.factory<_i49.NotificationModule>(
      () => _i49.NotificationModule(get<_i33.NotificationPage>()));
  gh.factory<_i50.Order>(
      () => _i50.Order(get<_i34.OrderCubit>(), get<_i4.AuthService>()));
  gh.factory<_i51.OrderModule>(() => _i51.OrderModule(get<_i50.Order>()));
  gh.factory<_i52.ProfilePageModule>(() => _i52.ProfilePageModule(
      get<_i39.ProfilePage>(), get<_i44.GetProfilePage>()));
  gh.factory<_i53.AddressModule>(
      () => _i53.AddressModule(get<_i42.AddressScreen>()));
  gh.factory<_i54.MyApp>(() => _i54.MyApp(
      get<_i8.NavigatorModule>(),
      get<_i49.NotificationModule>(),
      get<_i51.OrderModule>(),
      get<_i43.CustomModule>(),
      get<_i53.AddressModule>(),
      get<_i46.HomePageModule>(),
      get<_i37.OrderDetailsModule>(),
      get<_i47.LogInModule>(),
      get<_i52.ProfilePageModule>(),
      get<_i48.MenuDetailsModule>(),
      get<_i23.SplashModule>()));
  return get;
}
