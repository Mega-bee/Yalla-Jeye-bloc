import 'package:flutter/material.dart';
import 'package:untitled1/abstracts/states/state.dart';
import 'package:untitled1/module_addresses/response/regions_response.dart';
import 'package:untitled1/module_addresses/ui/screens/create_address_sheet.dart';

class RegionsSuccess extends States {
  List<RegionsResponse> regions;
  CreateAddressSheetState screenState;

  RegionsSuccess({required this.regions, required this.screenState}) : super(){
   if(screenState.selectedRegion != null){
      for (var element in regions) {
        if(element.id == screenState.selectedRegion?.id){
          regions.remove(element);
          regions.add(screenState.selectedRegion ?? RegionsResponse());
        }
      }

   }
  }


  @override
  Widget getUI(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 2,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton(
          value: screenState.selectedRegion,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: regions.map((RegionsResponse items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items.location ?? ''),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (newValue) {
            screenState.selectedRegion = newValue as RegionsResponse?;
            screenState.refresh();
          },
          hint: const Text('Select region'),
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }
}
