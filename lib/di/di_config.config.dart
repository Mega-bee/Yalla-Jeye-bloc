// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../addresses/address_module.dart' as _i37;
import '../addresses/repository/address_repository.dart' as _i18;
import '../addresses/state_manager/address.dart' as _i27;
import '../addresses/ui/screens/addresses_list.dart' as _i28;
import '../addresses/ui/screens/create_address_list.dart' as _i29;
import '../addresses/ui/screens/edit_screen_list.dart' as _i31;
import '../custom/custom_module.dart' as _i30;
import '../custom/repository/custom_repository.dart' as _i13;
import '../custom/state_manager/custom.dart' as _i19;
import '../custom/ui/screens/custom_list.dart' as _i20;
import '../hive/hive.dart' as _i3;
import '../home_page/homepage_module.dart' as _i33;
import '../home_page/repository/homepage_repository.dart' as _i14;
import '../home_page/state_manager/homepage.dart' as _i21;
import '../home_page/ui/screens/home_page_list.dart' as _i32;
import '../main.dart' as _i38;
import '../module_auth/repository/auth_repository.dart' as _i12;
import '../module_auth/service/auth_service.dart' as _i4;
import '../module_network/http_client/http_client.dart' as _i11;
import '../navigation_bar/navigator_module.dart' as _i8;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i7;
import '../notification/Notification_module.dart' as _i34;
import '../notification/repository/Notification_repository.dart' as _i15;
import '../notification/state_manager/Notification.dart' as _i22;
import '../notification/ui/screens/Notification_list.dart' as _i23;
import '../order/order_module.dart' as _i36;
import '../order/repository/order_repository.dart' as _i17;
import '../order/state_manager/order.dart' as _i24;
import '../order/ui/screens/order_page_list.dart' as _i35;
import '../order/ui/widget/order_details.dart' as _i9;
import '../order_details/order_module.dart' as _i10;
import '../order_details/repository/order_repository.dart' as _i16;
import '../order_details/state_manager/order.dart' as _i25;
import '../order_details/ui/screens/order_page_list.dart' as _i26;
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
  gh.factory<_i9.OrderDetails>(() => _i9.OrderDetails());
  gh.factory<_i10.OrderDetailsModule>(
      () => _i10.OrderDetailsModule(get<_i9.OrderDetails>()));
  gh.factory<_i11.ApiClient>(() => _i11.ApiClient(get<_i6.Logger>()));
  gh.factory<_i12.AuthRepository>(
      () => _i12.AuthRepository(get<_i11.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i13.CustomRepository>(() =>
      _i13.CustomRepository(get<_i11.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i14.HomePageRepository>(() =>
      _i14.HomePageRepository(get<_i11.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i15.NotificationsRepository>(() => _i15.NotificationsRepository(
      get<_i11.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i16.OrderDetailRepository>(() => _i16.OrderDetailRepository(
      get<_i11.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i17.OrderRepository>(() =>
      _i17.OrderRepository(get<_i11.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i18.AddressRepository>(() =>
      _i18.AddressRepository(get<_i11.ApiClient>(), get<_i4.AuthService>()));
  gh.factory<_i19.CustomCubit>(
      () => _i19.CustomCubit(get<_i13.CustomRepository>()));
  gh.factory<_i20.CustomPage>(() => _i20.CustomPage(get<_i19.CustomCubit>()));
  gh.factory<_i21.HomePageCubit>(
      () => _i21.HomePageCubit(get<_i14.HomePageRepository>()));
  gh.factory<_i22.NotificationCubit>(
      () => _i22.NotificationCubit(get<_i15.NotificationsRepository>()));
  gh.factory<_i23.NotificationPage>(
      () => _i23.NotificationPage(get<_i22.NotificationCubit>()));
  gh.factory<_i24.OrderCubit>(
      () => _i24.OrderCubit(get<_i17.OrderRepository>()));
  gh.factory<_i25.OrderDetailCubit>(
      () => _i25.OrderDetailCubit(get<_i16.OrderDetailRepository>()));
  gh.factory<_i26.OrderDetails>(
      () => _i26.OrderDetails(get<_i25.OrderDetailCubit>()));
  gh.factory<_i27.AddressCubit>(
      () => _i27.AddressCubit(get<_i18.AddressRepository>()));
  gh.factory<_i28.AddressPage>(
      () => _i28.AddressPage(get<_i27.AddressCubit>()));
  gh.factory<_i29.CreateAddressPage>(
      () => _i29.CreateAddressPage(get<_i27.AddressCubit>()));
  gh.factory<_i30.CustomModule>(
      () => _i30.CustomModule(get<_i20.CustomPage>()));
  gh.factory<_i31.EditAddressPage>(
      () => _i31.EditAddressPage(get<_i27.AddressCubit>()));
  gh.factory<_i32.HomePage>(() =>
      _i32.HomePage(get<_i21.HomePageCubit>(), get<_i3.AuthPrefsHelper>()));
  gh.factory<_i33.HomePageModule>(
      () => _i33.HomePageModule(get<_i32.HomePage>()));
  gh.factory<_i34.NotificationModule>(
      () => _i34.NotificationModule(get<_i23.NotificationPage>()));
  gh.factory<_i35.Order>(() => _i35.Order(get<_i24.OrderCubit>()));
  gh.factory<_i36.OrderModule>(() => _i36.OrderModule(get<_i35.Order>()));
  gh.factory<_i37.AddressModule>(() => _i37.AddressModule(
      get<_i28.AddressPage>(),
      get<_i29.CreateAddressPage>(),
      get<_i31.EditAddressPage>()));
  gh.factory<_i38.MyApp>(() => _i38.MyApp(
      get<_i8.NavigatorModule>(),
      get<_i34.NotificationModule>(),
      get<_i36.OrderModule>(),
      get<_i30.CustomModule>(),
      get<_i37.AddressModule>(),
      get<_i33.HomePageModule>(),
      get<_i10.OrderDetailsModule>()));
  return get;
}
