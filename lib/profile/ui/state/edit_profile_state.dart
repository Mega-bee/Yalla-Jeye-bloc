import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/Colors/colors.dart';
import '../../../utils/images/images.dart';
import '../../request/edit_profile_request.dart';
import '../../response/get_profile_response.dart';
import '../screen/edit_profile.dart';
import '../screen/profile.dart';

class EditProfilePageSuccess extends States {
  EditProfilePageState editProfilePageState;
  GetProfileModel getProfileModel;

  EditProfilePageSuccess({
    required this.editProfilePageState,required this.getProfileModel
  }) : super(false){
    name.text = getProfileModel.name??"";
    // number.text = getProfileModel.phoneNumber??"";
  }



  var name = TextEditingController();
  // var number = TextEditingController();

  // var building = TextEditingController();
  // var instruction = TextEditingController();
  // var title = TextEditingController();
  // var nickname = TextEditingController();

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
                    hintText: 'name',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(204, 204, 204, 0.5),
                    ),
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
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // TextField(
                //   onChanged: (value) {
                //     //Do something with the user input.
                //   },
                //   autofillHints: [AutofillHints.name],
                //   controller: number,
                //   keyboardType: TextInputType.number,
                //   decoration: InputDecoration(
                //     hintText: 'phone number',
                //     hintStyle: TextStyle(
                //       color: Color.fromRGBO(204, 204, 204, 0.5),
                //     ),
                //     contentPadding:
                //         EdgeInsets.symmetric(vertical: 20.0, horizontal: 13.0),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: const BorderSide(
                //           color: Color.fromRGBO(204, 204, 204, 0.5),
                //           width: 2.0),
                //       borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(color: Colors.grey, width: 2.0),
                //       borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //     ),
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(
                      left: 150, right: 150, top: 16, bottom: 16),
                  backgroundColor: redColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  )),
              onPressed: () {
                editProfilePageState.editProfile(
                  UpdateProfileRequest(
                    Name: name.text,
                    // PhoneNumber: number.text,
                  ),
                );

              },
              child: Text(
                "Confirm",
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
