import 'package:flutter/material.dart';
import 'package:untitled1/module_driver/module_driver_orders/ui/screens/driver_order_details_screen.dart';
import 'package:untitled1/order_details/response/order_response.dart';
import 'package:untitled1/utils/helpers/order_status_helper.dart';

class DriverOrderTracking extends StatelessWidget {
  final OrderDetailsResponse orderDetailsResponse;
  final DriverOrderDetailsScreenState screenState;

  DriverOrderTracking(
      {required this.orderDetailsResponse, required this.screenState})
      : super() {
    currentStep = StatusHelper.getStatusIndex(orderDetailsResponse.statusId);
  }

  int? currentStep;
  @override
  Widget build(BuildContext context) {
    return Stepper(

      type: StepperType.vertical,
      currentStep: currentStep ?? 0,
      elevation: 5,
      // onStepCancel: () {},
      // onStepContinue: () {},
      steps: [
        Step(
            title: Text("Received"),
            subtitle: Text("Yalla-Jeye received your order"),
            content: Container(),
            isActive: currentStep! >= 1 ? true : false,
            state: currentStep! > 1 ? StepState.complete : StepState.indexed),
        Step(
            title: Text("Preparing"),
            subtitle: Text("Driver is on the way to pick your order"),
            content: Container(),
            isActive: currentStep! >= 3 ? true : false,
            state: currentStep! > 3 ? StepState.complete : StepState.indexed),
        Step(
            title: Text("On the way"),
            subtitle:
                Text("Driver has picked your order and on the way to you"),
            content: Container(),
            isActive: currentStep! >= 4 ? true : false,
            state: currentStep! > 4 ? StepState.complete : StepState.indexed),
        Step(
            title: Text("Two minutes away"),
            subtitle:
                Text("Driver has picked your order and on the way to you"),
            content: Container(),
            isActive: currentStep! >= 6 ? true : false,
            state: currentStep! > 6 ? StepState.complete : StepState.indexed),
          Step(
              title: Text("Delivered"),
              subtitle: Text("Hope you had a good service"),
              content: Container(),
              isActive: currentStep! >= 5 ? true : false,
              state: currentStep! > 5 ? StepState.complete : StepState.indexed)

      ],
    );
  }
}
