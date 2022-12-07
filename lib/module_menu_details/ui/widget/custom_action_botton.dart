import 'package:flutter/material.dart';
import 'package:tip_dialog/tip_dialog.dart';
import 'package:untitled1/custom/model/OrderModel.dart';
import 'package:untitled1/module_menu_details/model/menu_model.dart';
import 'package:untitled1/module_menu_details/request/calculate_price_request.dart';
import 'package:untitled1/module_menu_details/ui/widget/custom_bottom_sheet.dart';
import 'package:untitled1/utils/Colors/colors.dart';
import 'package:untitled1/utils/components/custom_alert_dialog.dart';

class CustomActionButton extends StatefulWidget {
  final MenuDetailsModel? model;
  final bool isLoginUser;
  final Function(CalculatePriceRequest)  claPrice;
  const CustomActionButton({this.model, required this.isLoginUser, required this.claPrice});

  @override
  State<CustomActionButton> createState() => _CustomActionButtonState();
}

class _CustomActionButtonState extends State<CustomActionButton>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(milliseconds: 500);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Theme(
        data: Theme.of(context).copyWith(
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
          extendedSizeConstraints: BoxConstraints.tightFor(
            height: 65,
          ),
        )),
        child: FloatingActionButton.extended(
          backgroundColor: redColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed: () {
            if(!widget.isLoginUser){
              showDialog(context: context, builder: (context) =>
                  CustomDialogBox(title: 'You should login to make new order'),);
            }else {
              showModalBottomSheet(
                transitionAnimationController: controller,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      CustomBottomSheet(placesOrders: orderModelList,
                        calculatePrice: (req) {
                        widget.claPrice(req);
                      },model: widget.model),
                      TipDialogContainer(
                          duration: const Duration(seconds: 2),
                          outsideTouchable: true,
                          onOutsideTouch: (Widget tipDialog) {
                            if (tipDialog is TipDialog &&
                                tipDialog.type == TipDialogType.LOADING) {
                              TipDialogHelper.dismiss();
                            }
                          })
                    ],
                  );
                },
              );
            }},
          label: Row(
            children: [
              Icon(Icons.shopping_cart),
              SizedBox(width: 15),
              Padding(
                padding: const EdgeInsets.only(
                  top: 70.0,
                  bottom: 70.0,
                  right: 120.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What's your order?",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "What do you want to order?",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
              Icon(
                Icons.add_circle_outline,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
