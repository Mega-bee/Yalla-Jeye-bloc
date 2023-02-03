import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:untitled1/utils/Colors/colors.dart';

import '../../../abstracts/states/state.dart';
import '../../auth_module_route.dart';

import '../../request/reset_password_request.dart';
import '../screens/reset_password.dart';
import '../widget/custom_button.dart';

class ResetPasswordState extends States {
  final ResetPasswordScreenState screenState;
  final String? phone;
  String? errorMessage;

  ResetPasswordState(this.screenState, this.errorMessage, this.phone);

  final _formKeyResetPass = GlobalKey<FormState>();
  final password = TextEditingController();
  final confirmPass = TextEditingController();

  String validatePass(value) {
    if (value.isEmpty) {
      return 'Required *';
    }
    return "";
  }

  bool _isObscure = true;
  // final passwordValidator = EqualToValidator(
  //     errorText: "Passwords do not match",
  //     otherController: confirmPass
  // );
  @override
  Widget getUI(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(children: [
        Container(
          color: redColor,
          height: MediaQuery.of(context).size.height * 0.18,
          child: Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Please enter your new password",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          ),
        ),
        Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.10,
            color: redColor,
          ),
          Center(
            child: Container(
//              height: MediaQuery.of(context).size.height * 0.68,
              width: MediaQuery.of(context).size.height * 0.40,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 15,
                child: Form(
                  key: _formKeyResetPass,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Reset password",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(right: 2, left: 24),
                          child: Container(
                            color: redColor,
                            height: 4,
                            width: 35,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaQueryHeight * 0.05,
                      ),
                      Column(children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: mediaQueryWidth * 0.05),
                          child: TextFormField(
                            cursorColor: redColor,
                            style: const TextStyle(fontSize: 14),
                            controller: password,
                            decoration: InputDecoration(
                              labelText: "Password",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Password",
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 0, color: Colors.black12)),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Password is Required *'),
                            ]),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: true,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: mediaQueryWidth * 0.05),
                          child: TextFormField(
                            cursorColor: redColor,
                            style: const TextStyle(fontSize: 14),
                            controller: confirmPass,
                            decoration: InputDecoration(
                              labelText: "Confirm password",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Confirm password",
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                borderSide:
                                    BorderSide(width: 0, color: Colors.black12),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Password is Required *'),
                            ]),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: true,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomButton(
                            buttonTab: () {
                              if (password.text.isEmpty ||
                                  confirmPass.text.isEmpty) {
                                _formKeyResetPass.currentState!.validate();
                              }else if(password.text != confirmPass.text){
                                Fluttertoast.showToast(msg: "Password and confirm password don't match");

                              }else{
                                screenState.resetPassword(ResetPasswordRequest(
                                    password: password.text, phone: phone));
                              }

                              // Navigator.pushNamed(context, AuthRoutes.OTP_SCREEN);
                            },
                            loading: screenState
                                    .loadingSnapshotLogin.connectionState ==
                                ConnectionState.waiting,
                            text: 'SEND',
                            bgColor: redColor,
                            textColor: Colors.black,
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ]),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
