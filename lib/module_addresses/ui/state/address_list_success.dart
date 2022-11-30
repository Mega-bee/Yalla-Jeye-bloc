import 'package:flutter/material.dart';
import 'package:untitled1/module_addresses/ui/widget/address_card.dart';
import '../../../abstracts/states/state.dart';
import '../../response/address_response.dart';
import '../screens/address_screen.dart';
import '../screens/create_address_sheet.dart';

class AddressListSuccess extends States {
  final List<AddressResponse> addressList;
  AddressScreenState screenState;

  AddressListSuccess({required this.addressList, required this.screenState});

  @override
  Widget getUI(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => AddressCard(
        onSelect: (){},
        model: addressList[index],
        isSelectedPage: false,
        onDelete: () {
          screenState.deleteAddress(addressList[index].id.toString());
        },
        onEdit: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return CreateAddressSheet(
                  createAddress: (req) {
                    req.id = addressList[index].id;
                    Navigator.pop(context);
                    screenState.updateAddress(req);
                  },
                  isUpdated: true,
                  response: addressList[index],
                  cubit: screenState.widget.regionsCubit,
                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              isScrollControlled: true,
              elevation: 5);
        },
      ),
      itemCount: addressList.length,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
