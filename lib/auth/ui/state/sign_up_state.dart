import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:untitled1/utils/Colors/colors.dart';

import '../../../abstracts/states/eight_digits_password.dart';
import '../../../abstracts/states/state.dart';
import '../../request/sign_up_request.dart';
import '../screens/sign_up_list.dart';
import '../widget/custom_button.dart';

class SignupInitState extends States {
  final SignupScreenState screenState;

  String? errorMessage;

  SignupInitState(this.screenState, this.errorMessage);

  final _formKeySignUp = GlobalKey<FormState>();
  final newpass = TextEditingController();
  final confirmpass = TextEditingController();
  final firstname = TextEditingController();
  final Mobile = TextEditingController();

  String validatePass(value) {
    if (value.isEmpty) {
      return 'Required *';
    }
    return "";
  }

  bool _isObscure = true;

  // String validateMobile(String value) {
  //   if (value.length != 8) {
  //     return 'Please enter 8 numbers';
  //   }
  //   return null;
  // }

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
                      "Let's Get Started",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      "Please enter your phone number and password to signup for Yalla jeye!",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                  key: _formKeySignUp,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Sign up",
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
                              controller: firstname,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                labelText: "Name",
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "name",
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
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Name Required *'),
                              ]),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress),
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
                            controller: Mobile,
                            decoration: InputDecoration(
                              labelText: "Phone number",
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
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(8)
                            ],
                            validator: (value) {
                              if (value!.length != 8) {
                                return 'Please enter 8 numbers';
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            obscureText: _isObscure,
                            controller: newpass,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              hintText: " Password",
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 0,
                                  color: Colors.black12,
                                ),
                              ),
                              filled: false,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: validatePass,
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
                              if (Mobile.text.length != 8) {
                                Fluttertoast.showToast(
                                    msg: 'Enter 8 digit phone number');

                                return;
                              }
                              if (newpass.text.isEmpty ||
                                  newpass.text == confirmpass.text ||
                                  newpass.text.length < 6 ||
                                  Mobile.text.length != 8) {
                                _formKeySignUp.currentState!.validate();
                              }
                              screenState.SignupRequest(
                                SignUpReq(
                                  PhoneNumber: Mobile.text,
                                  name: firstname.text,
                                  password: newpass.text,
                                ),
                              );
                            },
                            loading:
                                screenState.loadingSnapshot.connectionState ==
                                    ConnectionState.waiting,
                            text: 'SIGN UP',
                            bgColor: redColor,
                            textColor: Colors.black,
                          ),
                        ),
//                         Container(
//                           width: 300,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               if (newpass.text.isEmpty ||newpass.text ==confirmpass.text ||
//                                   email.text.isEmpty ||
//                                   newpass.text.length < 6) {
//                                 _formKey.currentState!.validate();
//                               }
//                               screenState.SignupRequest(SignRequest(
//                                   email.text,
//                                   newpass.text,
//                                   Mobile.text,
//                                   firstname.text,
//                                   confirmpass.text,
//                                   lastname.text));
// //                            screenState.GenerateOtpRequest(GenOtpRequest(Mobile.text));
//
//                             },
//                             child: Center(
//                               child: Text(
//                                 'SIGN UP',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                     fontFamily: 'Roboto-Bold'),
//                               ),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               // padding: EdgeInsets.symmetric(
//                               //     horizontal: mediaQueryWidth * 0.23,
//                               //     vertical: mediaQueryHeight * 0.018),
//                               primary: YellowColor,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                             ),
//                           ),
//                         )
                      ]),
                      SizedBox(
                        height: mediaQueryHeight * 0.04,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              child: Text("SIGN IN",
                                  style: TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () => Navigator.pop(context),
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
