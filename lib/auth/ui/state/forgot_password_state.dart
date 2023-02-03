import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:untitled1/utils/Colors/colors.dart';

import '../../../abstracts/states/state.dart';
import '../../auth_module_route.dart';

import '../../request/forgot_password_request.dart';
import '../screens/forgot_password_list.dart';
import '../widget/custom_button.dart';

class ForgetPasswordState extends States {
  final ForgetPasswordScreenState screenState;

  String? errorMessage;

  ForgetPasswordState(this.screenState, this.errorMessage);

  final _formKeyForgotPass = GlobalKey<FormState>();
  final Mobile = TextEditingController();

  String validatePass(value) {
    if (value.isEmpty) {
      return 'Required *';
    }
    return "";
  }

  bool _isObscure = true;

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
                      "Please enter your Phone number",
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
                  key: _formKeyForgotPass,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Forget password",
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
                            color:redColor,
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
                            controller: Mobile,
                            decoration: InputDecoration(
                              labelText: "phone number",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: " phone number",
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
                            keyboardType: TextInputType.number,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Mobile number Required *'),
                            ]),
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
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
                              if (Mobile.text.isEmpty
                              ) {
                                _formKeyForgotPass.currentState!.validate();
                              }
                              screenState.forgetPasswordRequest(
                                  ForgetPasswordRequest(phoneNumber: Mobile.text,)
                              );
                            },
                            loading:
                            screenState.loadingSnapshotLogin.connectionState ==
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