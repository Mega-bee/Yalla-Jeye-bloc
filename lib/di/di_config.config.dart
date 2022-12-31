// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/auth_module.dart' as _i67;
import '../auth/repository/log_in_repository.dart' as _i18;
import '../auth/service/auth_service.dart' as _i4;
import '../auth/state_manager/forgot_password.dart' as _i41;
import '../auth/state_manager/forgot_password_otp.dart' as _i42;
import '../auth/state_manager/log_in.dart' as _i45;
import '../auth/state_manager/otp_state.dart' as _i23;
import '../auth/state_manager/reset_password.dart' as _i26;
import '../auth/state_manager/sign_up.dart' as _i30;
import '../auth/ui/screens/forgot_password_list.dart' as _i43;
import '../auth/ui/screens/log_in_list.dart' as _i58;
import '../auth/ui/screens/otp_forgot_password.dart' as _i63;
import '../auth/ui/screens/otp_screen.dart' as _i24;
import '../auth/ui/screens/reset_password.dart' as _i27;
import '../auth/ui/screens/sign_up_list.dart' as _i31;
import '../custom/custom_module.dart' as _i61;
import '../custom/repository/custom_repository.dart' as _i15;
import '../custom/state_manager/custom.dart' as _i36;
import '../custom/ui/screens/custom_list.dart' as _i37;
import '../hive/hive.dart' as _i3;
import '../home_page/homepage_module.dart' as _i66;
import '../home_page/repository/homepage_repository.dart' as _i17;
import '../home_page/repository/searchTerm_repository.dart' as _i28;
import '../home_page/response/homepage_response.dart' as _i10;
import '../home_page/state_manager/homepage.dart' as _i44;
import '../home_page/state_manager/search_terms.dart' as _i29;
import '../home_page/ui/screens/home_page.dart' as _i65;
import '../home_page/ui/screens/search_places.dart' as _i56;
import '../main.dart' as _i75;
import '../module_addresses/address_module.dart' as _i74;
import '../module_addresses/repository/address_repository.dart' as _i33;
import '../module_addresses/state_manager/address_state_manager.dart' as _i59;
import '../module_addresses/state_manager/create_address_state_manager.dart'
    as _i55;
import '../module_addresses/ui/screens/address_screen.dart' as _i60;
import '../module_driver/module_driver_orders/driver_order_module.dart' as _i62;
import '../module_driver/module_driver_orders/repository/driver_order_repository.dart'
    as _i16;
import '../module_driver/module_driver_orders/state_manager/driver_order_state_manager.dart'
    as _i38;
import '../module_driver/module_driver_orders/ui/screens/driver_order_details_screen.dart'
    as _i39;
import '../module_driver/module_driver_orders/ui/screens/order_page_list.dart'
    as _i40;
import '../module_menu_details/menu_module.dart' as _i68;
import '../module_menu_details/model/menu_model.dart' as _i9;
import '../module_menu_details/repository/menu_details_repository.dart' as _i14;
import '../module_menu_details/state_manager/menu_state_manager.dart' as _i34;
import '../module_menu_details/ui/screens/checkout_screen.dart' as _i35;
import '../module_menu_details/ui/screens/menu_screen.dart' as _i46;
import '../module_network/http_client/http_client.dart' as _i13;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i11;
import '../module_notifications/repository/notification_repo.dart' as _i19;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i5;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i7;
import '../module_splash/splash_module.dart' as _i32;
import '../module_splash/ui/screen/splash_screen.dart' as _i12;
import '../my_notification/Notification_module.dart' as _i69;
import '../my_notification/repository/Notification_repository.dart' as _i20;
import '../my_notification/state_manager/Notification.dart' as _i49;
import '../my_notification/ui/screens/Notification_list.dart' as _i50;
import '../navigation_bar/navigator_module.dart' as _i48;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i47;
import '../order_details/order_module.dart' as _i71;
import '../order_details/repository/order_repository.dart' as _i21;
import '../order_details/state_manager/detailes_state_manager.dart' as _i52;
import '../order_details/ui/screens/order_details_screen.dart' as _i53;
import '../orders/order_module.dart' as _i72;
import '../orders/repository/order_repository.dart' as _i22;
import '../orders/state_manager/order.dart' as _i51;
import '../orders/ui/screens/order_page_list.dart' as _i70;
import '../profile/profile_module.dart' as _i73;
import '../profile/repository/profile_repository.dart' as _i25;
import '../profile/state_manager/profile.dart' as _i54;
import '../profile/ui/screen/get_profile.dart' as _i64;
import '../profile/ui/screen/setting_screen.dart' as _i57;
import '../utils/global/global_state_manager.dart' as _i6;
import '../utils/logger/logger.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthPrefsHelper>(() => _i3.AuthPrefsHelper());
  gh.factory<_i4.AuthService>(
      () => _i4.AuthService(get<_i3.AuthPrefsHelper>()));
  gh.factory<_i5.FireNotificationService>(() => _i5.FireNotificationService());
  gh.singleton<_i6.GlobalStateManager>(_i6.GlobalStateManager());
  gh.factory<_i7.LocalNotificationService>(
      () => _i7.LocalNotificationService());
  gh.factory<_i8.Logger>(() => _i8.Logger());
  gh.factory<_i9.MenuDetailsModel>(() => _i9.MenuDetailsModel(
      placeId: get<int>(),
      placeTypeId: get<int>(),
      categoryName: get<String>(),
      image: get<String>(),
      restaurantName: get<String>(),
      menuImages: get<List<_i10.PlaceMenu>>()));
  gh.factory<_i11.NotificationsPrefHelper>(
      () => _i11.NotificationsPrefHelper());
  gh.factory<_i12.SplashScreen>(
      () => _i12.SplashScreen(get<_i4.AuthService>()));
  gh.factory<_i13.ApiClient>(() => _i13.ApiClient(get<_i8.Logger>()));
  gh.factory<_i14.CheckOutRepository>(() =>
      _i14.CheckOutRepository(get<_i13.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i15.CustomRepository>(() =>
      _i15.CustomRepository(get<_i13.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i16.DriverOrderRepository>(() => _i16.DriverOrderRepository(
      get<_i13.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i17.HomePageRepository>(() =>
      _i17.HomePageRepository(get<_i13.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i18.LogInRepository>(() =>
      _i18.LogInRepository(get<_i13.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i19.NotificationRepo>(() =>
      _i19.NotificationRepo(get<_i13.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i20.NotificationsRepository>(() => _i20.NotificationsRepository(
      get<_i13.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i21.OrderDetailRepository>(() => _i21.OrderDetailRepository(
      get<_i13.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i22.OrderRepository>(() =>
      _i22.OrderRepository(get<_i13.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i23.OtpCubit>(
      () => _i23.OtpCubit(get<_i18.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i24.PinCodeVerificationScreen>(
      () => _i24.PinCodeVerificationScreen(get<_i23.OtpCubit>()));
  gh.factory<_i25.ProfileRepository>(() =>
      _i25.ProfileRepository(get<_i13.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i26.ResetPasswordCubit>(() => _i26.ResetPasswordCubit(
      get<_i18.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i27.ResetPasswordScreen>(
      () => _i27.ResetPasswordScreen(cubit: get<_i26.ResetPasswordCubit>()));
  gh.factory<_i28.SearchTermRepository>(() =>
      _i28.SearchTermRepository(get<_i13.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i29.SearchTermsCubit>(
      () => _i29.SearchTermsCubit(get<_i28.SearchTermRepository>()));
  gh.factory<_i30.SignUpCubit>(
      () => _i30.SignUpCubit(get<_i18.LogInRepository>()));
  gh.factory<_i31.SignupScreen>(
      () => _i31.SignupScreen(cubit: get<_i30.SignUpCubit>()));
  gh.factory<_i32.SplashModule>(
      () => _i32.SplashModule(get<_i12.SplashScreen>()));
  gh.factory<_i33.AddressRepository>(() =>
      _i33.AddressRepository(get<_i13.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i34.CheckOutCubit>(() => _i34.CheckOutCubit(
      get<_i14.CheckOutRepository>(), get<_i15.CustomRepository>()));
  gh.factory<_i35.CheckOutScreen>(
      () => _i35.CheckOutScreen(get<_i34.CheckOutCubit>()));
  gh.factory<_i36.CustomCubit>(
      () => _i36.CustomCubit(get<_i15.CustomRepository>()));
  gh.factory<_i37.CustomPage>(
      () => _i37.CustomPage(get<_i36.CustomCubit>(), get<_i4.AuthService>()));
  gh.factory<_i38.DriverOrderCubit>(
      () => _i38.DriverOrderCubit(get<_i16.DriverOrderRepository>()));
  gh.factory<_i39.DriverOrderDetailsScreen>(
      () => _i39.DriverOrderDetailsScreen(get<_i38.DriverOrderCubit>()));
  gh.factory<_i40.DriverOrderScreen>(() => _i40.DriverOrderScreen(
      get<_i38.DriverOrderCubit>(), get<_i4.AuthService>()));
  gh.factory<_i41.ForgetPasswordCubit>(() => _i41.ForgetPasswordCubit(
      get<_i18.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i42.ForgetPasswordOtpCubit>(() => _i42.ForgetPasswordOtpCubit(
      get<_i18.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i43.ForgetPasswordScreen>(
      () => _i43.ForgetPasswordScreen(cubit: get<_i41.ForgetPasswordCubit>()));
  gh.factory<_i44.HomePageCubit>(() => _i44.HomePageCubit(
      get<_i17.HomePageRepository>(), get<_i14.CheckOutRepository>()));
  gh.factory<_i45.LogInCubit>(() => _i45.LogInCubit(get<_i18.LogInRepository>(),
      get<_i4.AuthService>(), get<_i5.FireNotificationService>()));
  gh.factory<_i46.MenuDetailsScreen>(() => _i46.MenuDetailsScreen(
      get<_i34.CheckOutCubit>(),
      get<_i4.AuthService>(),
      get<_i44.HomePageCubit>()));
  gh.factory<_i47.Navigationbar>(
      () => _i47.Navigationbar(get<_i44.HomePageCubit>()));
  gh.factory<_i48.NavigatorModule>(
      () => _i48.NavigatorModule(get<_i47.Navigationbar>()));
  gh.factory<_i49.NotificationCubit>(
      () => _i49.NotificationCubit(get<_i20.NotificationsRepository>()));
  gh.factory<_i50.NotificationPage>(
      () => _i50.NotificationPage(get<_i49.NotificationCubit>()));
  gh.factory<_i51.OrderCubit>(
      () => _i51.OrderCubit(get<_i22.OrderRepository>()));
  gh.factory<_i52.OrderDetailCubit>(
      () => _i52.OrderDetailCubit(get<_i21.OrderDetailRepository>()));
  gh.factory<_i53.OrderDetailsScreen>(
      () => _i53.OrderDetailsScreen(get<_i52.OrderDetailCubit>()));
  gh.factory<_i54.ProfileCubit>(
      () => _i54.ProfileCubit(get<_i25.ProfileRepository>()));
  gh.factory<_i55.RegionsCubit>(
      () => _i55.RegionsCubit(get<_i33.AddressRepository>()));
  gh.factory<_i56.SearchPlaces>(() => _i56.SearchPlaces(
      get<_i29.SearchTermsCubit>(),
      get<_i3.AuthPrefsHelper>(),
      get<_i4.AuthService>()));
  gh.factory<_i57.SettingProfilePage>(() => _i57.SettingProfilePage(
      get<_i54.ProfileCubit>(), get<_i4.AuthService>()));
  gh.factory<_i58.loginScreen>(
      () => _i58.loginScreen(cubit: get<_i45.LogInCubit>()));
  gh.factory<_i59.AddressCubit>(
      () => _i59.AddressCubit(get<_i33.AddressRepository>()));
  gh.factory<_i60.AddressScreen>(() =>
      _i60.AddressScreen(get<_i59.AddressCubit>(), get<_i55.RegionsCubit>()));
  gh.factory<_i61.CustomModule>(
      () => _i61.CustomModule(get<_i37.CustomPage>()));
  gh.factory<_i62.DriverOrderModule>(() => _i62.DriverOrderModule(
      get<_i40.DriverOrderScreen>(), get<_i39.DriverOrderDetailsScreen>()));
  gh.factory<_i63.ForgetPassVerificationScreen>(() =>
      _i63.ForgetPassVerificationScreen(get<_i42.ForgetPasswordOtpCubit>()));
  gh.factory<_i64.GetProfilePage>(
      () => _i64.GetProfilePage(get<_i54.ProfileCubit>()));
  gh.factory<_i65.HomePage>(() => _i65.HomePage(get<_i44.HomePageCubit>(),
      get<_i3.AuthPrefsHelper>(), get<_i4.AuthService>()));
  gh.factory<_i66.HomePageModule>(() =>
      _i66.HomePageModule(get<_i65.HomePage>(), get<_i56.SearchPlaces>()));
  gh.factory<_i67.LogInModule>(() => _i67.LogInModule(
      get<_i58.loginScreen>(),
      get<_i31.SignupScreen>(),
      get<_i24.PinCodeVerificationScreen>(),
      get<_i63.ForgetPassVerificationScreen>(),
      get<_i43.ForgetPasswordScreen>(),
      get<_i27.ResetPasswordScreen>()));
  gh.factory<_i68.MenuDetailsModule>(() => _i68.MenuDetailsModule(
      get<_i46.MenuDetailsScreen>(), get<_i35.CheckOutScreen>()));
  gh.factory<_i69.NotificationModule>(
      () => _i69.NotificationModule(get<_i50.NotificationPage>()));
  gh.factory<_i70.Order>(
      () => _i70.Order(get<_i51.OrderCubit>(), get<_i4.AuthService>()));
  gh.factory<_i71.OrderDetailsModule>(
      () => _i71.OrderDetailsModule(get<_i53.OrderDetailsScreen>()));
  gh.factory<_i72.OrderModule>(() => _i72.OrderModule(get<_i70.Order>()));
  gh.factory<_i73.ProfilePageModule>(() => _i73.ProfilePageModule(
      get<_i57.SettingProfilePage>(), get<_i64.GetProfilePage>()));
  gh.factory<_i74.AddressModule>(
      () => _i74.AddressModule(get<_i60.AddressScreen>()));
  gh.factory<_i75.MyApp>(() => _i75.MyApp(
      get<_i48.NavigatorModule>(),
      get<_i69.NotificationModule>(),
      get<_i72.OrderModule>(),
      get<_i61.CustomModule>(),
      get<_i74.AddressModule>(),
      get<_i66.HomePageModule>(),
      get<_i71.OrderDetailsModule>(),
      get<_i67.LogInModule>(),
      get<_i73.ProfilePageModule>(),
      get<_i68.MenuDetailsModule>(),
      get<_i32.SplashModule>(),
      get<_i62.DriverOrderModule>(),
      get<_i5.FireNotificationService>(),
      get<_i7.LocalNotificationService>()));
  return get;
}
