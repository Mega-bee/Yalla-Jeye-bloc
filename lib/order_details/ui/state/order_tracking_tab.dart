import 'package:flutter/material.dart';
import 'package:untitled1/order_details/ui/screens/order_details_screen.dart';
import 'package:untitled1/utils/helpers/order_status_helper.dart';
import '../../response/order_response.dart';

class OrderTracking extends StatelessWidget {
  final OrderDetailsResponse orderDetailsResponse;
  final OrderDetailsScreenState screenState;

  OrderTracking({required this.orderDetailsResponse ,required this.screenState}) : super() {
    currentStep = StatusHelper.getStatusIndex(orderDetailsResponse.statusId);
  }

  int? currentStep;
  @override
  Widget build(BuildContext context) {
    return Stepper(
      controlsBuilder: (context, details) {
        if(details.currentStep == 2) {
          return Row(children:   [
            InkWell(
              onTap: (){
                screenState.confirmPrice();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red.shade700),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:   Text('Proceed',style: TextStyle(color: Colors.red.shade700),),
                ),),
            ),

           const SizedBox(width: 15,),

            InkWell(
              onTap: (){
                screenState.rejectPrice();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('Decline'),
                ),),
            ),
          ],);
        }
        return Container();
      },
      type: StepperType.vertical,
      currentStep: currentStep ?? 0,
      elevation: 5,
      onStepCancel: (){},
      onStepContinue: (){},
      steps: [
        Step(
            title: Text("Pending"),
            subtitle: Text("your order is pending"),
            content: Container(),
            isActive: currentStep! >= 0 ? true : false,
            label: Container(),
            state: currentStep! > 0 ? StepState.complete : StepState.indexed),
        Step(
            title: const Text("Price confirmation"),
            subtitle: Text(
                "total delivery price is ${orderDetailsResponse.totalPrice} L.L"),
            content: Container(),
            isActive: currentStep! >= 2 ? true : false,
            state: currentStep! > 2 ? StepState.complete : StepState.editing),
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
        if (orderDetailsResponse.statusId == 5)
          Step(
              title: Text("Delivered"),
              subtitle: Text("Hope you had a good service"),
              content: Container(),
              isActive: true,state:   StepState.complete  )
        else if (orderDetailsResponse.statusId == 6)
          Step(
              title: Text("Cancelled"),
              subtitle: Text("Hope you had a good service"),
              content: Container(),isActive: true,state:   StepState.error  )
        else if (orderDetailsResponse.statusId == 8)
          Step(
              title: Text("Rejected By Admin"),
              subtitle: Text("rejected"),
              content: Container(),isActive: true,state:   StepState.error  )
        else if (orderDetailsResponse.statusId == 10)
          Step(
              title: Text("Rejected By Client"),
              subtitle: Text("Rejected"),
              content: Container(),isActive: true,state:   StepState.error  )
      ],
    );
  }
}
