
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/abstracts/states/error_state.dart';
import 'package:untitled1/module_addresses/repository/address_repository.dart';
import 'package:untitled1/module_addresses/response/regions_response.dart';
import 'package:untitled1/module_addresses/ui/screens/create_address_sheet.dart';
import 'package:untitled1/module_addresses/ui/state/regions_success.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';

@injectable
class RegionsCubit extends Cubit<States> {
  final AddressRepository _addressRepository;
  RegionsCubit(this._addressRepository) : super(LoadingState());

  getRegions(CreateAddressSheetState sheetState) {
    emit(LoadingState());
    _addressRepository.getRegions().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getRegions(sheetState);
            }));
      } else if (value.code == 200) {
        List<RegionsResponse> occList = [];
        for (var item in value.data.insideData) {
          occList.add(RegionsResponse.fromJson(item));
        }
        emit(RegionsSuccess( regions: occList, screenState: sheetState , ));
      } else {
        // emit(ErrorState(
        //     errorMessage: value.errorMessage,
        //     retry: () {
        //       getRegions();
        //     }));
      }
    });
  }

}
