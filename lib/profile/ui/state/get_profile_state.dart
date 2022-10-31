import 'package:flutter/material.dart';
import 'package:untitled1/auth/ui/widget/custom_button.dart';
import 'package:untitled1/profile/request/edit_profile_request.dart';
import 'package:untitled1/utils/Colors/colors.dart';
import '../../../abstracts/states/state.dart';
import '../../response/get_profile_response.dart';
import '../screen/get_profile.dart';

class GetProfilePageSuccess extends States {
  GetProfilePageState screenState;
  GetProfileModel model;

  GetProfilePageSuccess({
    required this.screenState,
    required this.model,
  }) :super(){
    name.text = model.name ?? '' ;
    number.text = model.phoneNumber ?? '' ;
  }

  var name = TextEditingController();
  var number = TextEditingController();

  @override
  Widget getUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(

                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  controller: name,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 13.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(204, 204, 204, 0.5),
                          width: 2.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  readOnly: true,
                  // autofillHints: [AutofillHints.name],
                  controller: number,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 13.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(204, 204, 204, 0.5),
                          width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    hoverColor: Colors.grey.shade400,
                    filled: true,
                    fillColor: Colors.grey.shade400
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            CustomButton(
              buttonTab: () {
                screenState.updateProfile(UpdateProfileRequest(Name: name.text));
              },
              loading: screenState.loadingSnapshotLogin.connectionState ==
                  ConnectionState.waiting,
              text: 'Edit name',
              bgColor: redColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
