import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:untitled1/utils/Colors/colors.dart';
import '../../../abstracts/states/state.dart';
import '../../auth_module_route.dart';
import '../../request/log_in_request.dart';
import '../screens/log_in_list.dart';
import '../widget/custom_button.dart';

class LoginInitState extends States {
  final loginScreenState _screenState;
  String? errorMessage;

  LoginInitState(this.errorMessage, this._screenState);

  final _formKey = GlobalKey<FormState>();
  final phone = TextEditingController();
  final password = TextEditingController();

  @override
  Widget getUI(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          color: redColor,
          height: MediaQuery.of(context).size.height * 0.162,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                      "Please enter your phone numbe and password to "
                      "login to Yalla Jeye!",
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ],
          ),
        ),
        Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.10,
            color: redColor,
          ),
          SingleChildScrollView(
            child: Center(
              child: Container(
//            height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.height * 0.42,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 15,
                  child: Column(children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.left,
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
                      height: mediaQueryHeight * 0.03,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mediaQueryWidth * 0.05),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Required";
                                  }
                                  return null;
                                },
                                autofillHints: [AutofillHints.name],
                                controller: phone,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: 'Enter your phone number',
                                  hintStyle: TextStyle(
                                    color: Color.fromRGBO(204, 204, 204, 0.5),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 13.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(204, 204, 204, 0.5),
                                        width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: mediaQueryWidth * 0.05,
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Required";
                                  }
                                  return null;
                                },
                                autofillHints: [AutofillHints.name],
                                controller: password,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: Color.fromRGBO(204, 204, 204, 0.5),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 13.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(204, 204, 204, 0.5),
                                        width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                              )),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, AuthRoutes.FORGET_PASSWORD);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 22.0,top: 10),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "Forget pasword",
                                  style: TextStyle(
                                    fontSize: 12,
                                    decoration: TextDecoration.underline,
                                  ),

                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomButton(
                              buttonTab: () {
                                if (password.text.isEmpty ||
                                    phone.text.isEmpty ||
                                    password.text.length < 6) {
                                  _formKey.currentState!.validate();
                                }
                                _screenState.loginRequest(LogInRequest(
                                    Phone: phone.text,
                                    password: password.text));
                              },
                              loading: _screenState
                                      .loadingSnapshotLogin.connectionState ==
                                  ConnectionState.waiting,
                              text: 'Login',
                              bgColor: redColor,
                              textColor: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: mediaQueryHeight * 0.02,
                          ),
                          errorMessage == null
                              ? Container()
                              : Text(
                                  "${errorMessage}",
                                  style: TextStyle(color: Colors.red),
                                ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextButton(
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        decoration: TextDecoration.underline),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, AuthRoutes.signUp);
//                                  Navigator.push(
//                                      context,
//                                      CustomPageRoute(
//                                          child: SignupScreen()));
                                  },
                                ),
                              ]),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
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
