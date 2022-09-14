import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/di/di_config.dart';
import 'package:untitled1/module_auth/service/auth_service.dart';
import 'package:untitled1/module_network/http_client/http_client.dart';
import 'package:untitled1/utils/logger/logger.dart';

import '../../abstracts/states/error_state.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../../custom/ui/screens/custom_list.dart';
import '../../home_page/response/homepage_response.dart';
import '../repository/address_repository.dart';
import '../request/create_address_request.dart';
import '../request/edit_address_request.dart';
import '../response/address_Response.dart';
import '../ui/screens/addresses_list.dart';
import '../ui/screens/create_address_list.dart';
import '../ui/screens/edit_screen_list.dart';
import '../ui/state/address_sucess.dart';

@injectable
class AddressCubit extends Cubit<States> {
  final AddressRepository _addressRepository;

  AddressCubit(this._addressRepository) : super(LoadingState());

  getAddress(AddressPageState state) {
    // final HomePageRepository _homePageRepositoryy = getIt<HomePageRepository>();
    // final HomePageRepository _homePageRepositoryyy = HomePageRepository(getIt<ApiClient>(), getIt<AuthService>());
    //
    //
    // final Logger _logger = Logger();
    // final ApiClient apiClient = ApiClient(_logger);
    // final AuthService authService = AuthService(_prefsHelper);
    // final HomePageRepository homePageRepository = HomePageRepository(apiClient, authService);

    emit(LoadingState());
    _addressRepository.getAdresses().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getAddress(state);
            }));
      } else if (value.code == 200) {
        // HomePageModel restaurants =
        // HomePageModel.fromJson(value.data.insideData);
        List<AddressModel> fol = [];
        for (var item in value.data.insideData) {
          fol.add(AddressModel.fromJson(item));
        }

        emit(
          AddressPageSuccess(
            addressmodel: fol,
            addressPageState: state,
          ),
        );
      }
    });
  }

  CreateAddress(
      CreateAddressRequest request, CreateAddressPageState addressPageState) {
    emit(
      LoadingWaitingState('Waiting to create address'),
    );
    _addressRepository.CreateAddress(request).then((value) {
      if (value == null) {
        Fluttertoast.showToast(
            msg: 'somthing wrong', backgroundColor: Colors.red);
      } else if (value.code == 200) {

        Fluttertoast.showToast(
            msg: 'Address created Successfully',
            backgroundColor: Color(
              0xffFFD400,
            ));
      }
    });
  }

  void deleteAddress(String? id) {
    _addressRepository.DeleteAddress(id).then((value) {
      if (value == null) {
        Fluttertoast.showToast(msg: "Error try again");
      } else if (value.code == 200) {
        Fluttertoast.showToast(msg: 'Address deleted successfully');
      }
    });
  }

  EditAddress({
      required EditAddressRequest request, required EditAddressPageState addressPageState}) {
    emit(
      LoadingWaitingState('Waiting to edit address'),
    );
    _addressRepository.EditAddress(request).then((value) {
      if (value == null) {
        Fluttertoast.showToast(
            msg: 'something went wrong', backgroundColor: Colors.red);
      } else if (value.code == 200) {
        Fluttertoast.showToast(
          msg: 'Address updated Successfully',
          backgroundColor: Color(0xffFFD400),
        );
      }
    });
  }
}
