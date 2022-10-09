import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

import '../../abstracts/states/error_state.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../../utils/Colors/colors.dart';
import '../repository/address_repository.dart';
import '../request/create_address_request.dart';
import '../request/edit_address_request.dart';
import '../response/address_Response.dart';
import '../ui/screens/addresses_list.dart';
import '../ui/screens/create_address_list.dart';
import '../ui/screens/edit_screen_list.dart';
import '../ui/state/address_sucess.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddressCubit extends Cubit<States> {
  final AddressRepository _addressRepository;

  AddressCubit(this._addressRepository) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  getAddress(AddressPageState state) {
    emit(LoadingState());
    _addressRepository.getAdresses().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getAddress(state);
            }));
      } else if (value.code == 200) {
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
    _loadingStateSubject.add(const AsyncSnapshot.waiting());
    _addressRepository.CreateAddress(request).then((value) {
      if (value == null) {
        _loadingStateSubject.add(const AsyncSnapshot.nothing());
        Fluttertoast.showToast(
            msg: 'Somthing wrong', backgroundColor: Colors.red.shade900);
      } else if (value.code == 200) {
        Navigator.pop(addressPageState.context,true);
        Fluttertoast.showToast(
          msg: 'Address created Successfully',
        );
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

  EditAddress(
      {required EditAddressRequest request,
      required EditAddressPageState addressPageState}) {
    // emit(
    //   LoadingWaitingState('Waiting to edit address'),
    // );
    _addressRepository.EditAddress(request).then((value) {
      if (value == null) {
        Fluttertoast.showToast(
            msg: 'something went wrong', backgroundColor: Colors.red);
      } else if (value.code == 200) {
        Fluttertoast.showToast(
            msg: 'Address updated Successfully', backgroundColor: redColor);
      }
    });
  }
}
