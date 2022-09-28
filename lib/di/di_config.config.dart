// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../addresses/address_module.dart' as _i50;
import '../addresses/repository/address_repository.dart' as _i22;
import '../addresses/state_manager/address.dart' as _i36;
import '../addresses/ui/screens/addresses_list.dart' as _i37;
import '../addresses/ui/screens/create_address_list.dart' as _i38;
import '../addresses/ui/screens/edit_screen_list.dart' as _i40;
import '../auth/auth_module.dart' as _i45;
import '../auth/repository/log_in_repository.dart' as _i13;
import '../auth/state_manager/log_in.dart' as _i26;
import '../auth/state_manager/otp_state.dart' as _i17;
import '../auth/state_manager/sign_up.dart' as _i20;
import '../auth/ui/screens/log_in_list.dart' as _i35;
import '../auth/ui/screens/otp_screen.dart' as _i18;
import '../auth/ui/screens/sign_up_list.dart' as _i21;
import '../custom/custom_module.dart' as _i39;
import '../custom/repository/custom_repository.dart' as _i11;
import '../custom/state_manager/custom.dart' as _i23;
import '../custom/ui/screens/custom_list.dart' as _i24;
import '../hive/hive.dart' as _i3;
import '../home_page/homepage_module.dart' as _i44;
import '../home_page/repository/homepage_repository.dart' as _i12;
import '../home_page/state_manager/homepage.dart' as _i25;
import '../home_page/ui/screens/home_page_list.dart' as _i43;
import '../main.dart' as _i51;
import '../module_auth/repository/auth_repository.dart' as _i10;
import '../module_auth/service/auth_service.dart' as _i4;
import '../module_network/http_client/http_client.dart' as _i9;
import '../navigation_bar/navigator_module.dart' as _i8;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i7;
import '../notification/Notification_module.dart' as _i46;
import '../notification/repository/Notification_repository.dart' as _i14;
import '../notification/state_manager/Notification.dart' as _i27;
import '../notification/ui/screens/Notification_list.dart' as _i28;
import '../order/order_module.dart' as _i48;
import '../order/repository/order_repository.dart' as _i16;
import '../order/state_manager/order.dart' as _i29;
import '../order/ui/screens/order_page_list.dart' as _i47;
import '../order_details/order_module.dart' as _i32;
import '../order_details/repository/order_repository.dart' as _i15;
import '../order_details/state_manager/order.dart' as _i30;
import '../order_details/ui/screens/order_page_list.dart' as _i31;
import '../profile/profile_module.dart' as _i49;
import '../profile/repository/profile_repository.dart' as _i19;
import '../profile/state_manager/profile.dart' as _i33;
import '../profile/ui/screen/edit_profile.dart' as _i41;
import '../profile/ui/screen/get_profile.dart' as _i42;
import '../profile/ui/screen/profile.dart' as _i34;
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
  gh.factory<_i3.ListCart>(() => _i3.ListCart());
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
  gh.factory<_i13.LogInRepository>(
      () => _i13.LogInRepository(get<_i9.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i14.NotificationsRepository>(() => _i14.NotificationsRepository(
      get<_i9.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i15.OrderDetailRepository>(() =>
      _i15.OrderDetailRepository(get<_i9.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i16.OrderRepository>(
      () => _i16.OrderRepository(get<_i9.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i17.OtpCubit>(
      () => _i17.OtpCubit(get<_i13.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i18.PinCodeVerificationScreen>(
      () => _i18.PinCodeVerificationScreen(get<_i17.OtpCubit>()));
  gh.factory<_i19.ProfileRepository>(() =>
      _i19.ProfileRepository(get<_i9.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i20.SignUpCubit>(
      () => _i20.SignUpCubit(get<_i13.LogInRepository>()));
  gh.factory<_i21.SignupScreen>(
      () => _i21.SignupScreen(cubit: get<_i20.SignUpCubit>()));
  gh.factory<_i22.AddressRepository>(() =>
      _i22.AddressRepository(get<_i9.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i23.CustomCubit>(
      () => _i23.CustomCubit(get<_i11.CustomRepository>()));
  gh.factory<_i24.CustomPage>(() => _i24.CustomPage(get<_i23.CustomCubit>()));
  gh.factory<_i25.HomePageCubit>(
      () => _i25.HomePageCubit(get<_i12.HomePageRepository>()));
  gh.factory<_i26.LogInCubit>(() =>
      _i26.LogInCubit(get<_i13.LogInRepository>(), get<_i4.AuthService>()));
  gh.factory<_i27.NotificationCubit>(
      () => _i27.NotificationCubit(get<_i14.NotificationsRepository>()));
  gh.factory<_i28.NotificationPage>(
      () => _i28.NotificationPage(get<_i27.NotificationCubit>()));
  gh.factory<_i29.OrderCubit>(
      () => _i29.OrderCubit(get<_i16.OrderRepository>()));
  gh.factory<_i30.OrderDetailCubit>(
      () => _i30.OrderDetailCubit(get<_i15.OrderDetailRepository>()));
  gh.factory<_i31.OrderDetails>(
      () => _i31.OrderDetails(get<_i30.OrderDetailCubit>()));
  gh.factory<_i32.OrderDetailsModule>(
      () => _i32.OrderDetailsModule(get<_i31.OrderDetails>()));
  gh.factory<_i33.ProfileCubit>(
      () => _i33.ProfileCubit(get<_i19.ProfileRepository>()));
  gh.factory<_i34.ProfilePage>(
      () => _i34.ProfilePage(get<_i33.ProfileCubit>()));
  gh.factory<_i35.loginScreen>(
      () => _i35.loginScreen(cubit: get<_i26.LogInCubit>()));
  gh.factory<_i36.AddressCubit>(
      () => _i36.AddressCubit(get<_i22.AddressRepository>()));
  gh.factory<_i37.AddressPage>(
      () => _i37.AddressPage(get<_i36.AddressCubit>()));
  gh.factory<_i38.CreateAddressPage>(
      () => _i38.CreateAddressPage(get<_i36.AddressCubit>()));
  gh.factory<_i39.CustomModule>(
      () => _i39.CustomModule(get<_i24.CustomPage>()));
  gh.factory<_i40.EditAddressPage>(
      () => _i40.EditAddressPage(get<_i36.AddressCubit>()));
  gh.factory<_i41.EditProfilePage>(
      () => _i41.EditProfilePage(get<_i33.ProfileCubit>()));
  gh.factory<_i42.GetProfilePage>(
      () => _i42.GetProfilePage(get<_i33.ProfileCubit>()));
  gh.factory<_i43.HomePage>(() =>
      _i43.HomePage(get<_i25.HomePageCubit>(), get<_i3.AuthPrefsHelper>()));
  gh.factory<_i44.HomePageModule>(
      () => _i44.HomePageModule(get<_i43.HomePage>()));
  gh.factory<_i45.LogInModule>(() => _i45.LogInModule(get<_i35.loginScreen>(),
      get<_i21.SignupScreen>(), get<_i18.PinCodeVerificationScreen>()));
  gh.factory<_i46.NotificationModule>(
      () => _i46.NotificationModule(get<_i28.NotificationPage>()));
  gh.factory<_i47.Order>(
      () => _i47.Order(get<_i29.OrderCubit>(), get<_i4.AuthService>()));
  gh.factory<_i48.OrderModule>(() => _i48.OrderModule(get<_i47.Order>()));
  gh.factory<_i49.ProfilePageModule>(() => _i49.ProfilePageModule(
      get<_i34.ProfilePage>(),
      get<_i42.GetProfilePage>(),
      get<_i41.EditProfilePage>()));
  gh.factory<_i50.AddressModule>(() => _i50.AddressModule(
      get<_i37.AddressPage>(),
      get<_i38.CreateAddressPage>(),
      get<_i40.EditAddressPage>()));
  gh.factory<_i51.MyApp>(() => _i51.MyApp(
      get<_i8.NavigatorModule>(),
      get<_i46.NotificationModule>(),
      get<_i48.OrderModule>(),
      get<_i39.CustomModule>(),
      get<_i50.AddressModule>(),
      get<_i44.HomePageModule>(),
      get<_i32.OrderDetailsModule>(),
      get<_i45.LogInModule>(),
      get<_i49.ProfilePageModule>()));
  return get;
}
