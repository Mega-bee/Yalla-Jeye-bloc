import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/custom/model/OrderModel.dart';
import 'package:untitled1/module_addresses/address_route.dart';
import 'package:untitled1/module_addresses/response/address_response.dart';
import 'package:untitled1/module_menu_details/request/calculate_price_request.dart';
import 'package:untitled1/module_menu_details/ui/widget/order_card_widget.dart';
import 'package:untitled1/utils/Colors/colors.dart';
import 'package:untitled1/utils/images/images.dart';

class CustomBottomSheet extends StatefulWidget {
  final List<CartOrderModel> placesOrders;
  final Function(CalculatePriceRequest) calculatePrice;
  const CustomBottomSheet({required this.placesOrders, required this.calculatePrice});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {



  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return  Container(
      height: MediaQuery.of(context).size.height * 0.950,
      color: Colors.grey.shade100,
      child: StatefulBuilder(builder: (context, setStatet) {
        return AnimatedContainer(
          duration: Duration(seconds: 5),
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.8),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: redColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(25),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_month),
                                SizedBox(width: 15),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(
                                    top: 16.0,
                                    bottom: 16.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        "What's your order?",
                                        style: TextStyle(
                                            fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "What do you want to order?",
                                        style: TextStyle(
                                            fontSize: 10),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              ImageAsset.cancel_Icon,
                              height: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(children: [
                                const Text('Deliver To:   '),
                                Text(selectedAddressModel?.title ?? '' , style: TextStyle(fontWeight: FontWeight.bold),),
                              ],),
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, AddressRoutes.VIEW_ADDRESS, arguments: true).then((value) {
                                    if(value != null && value is AddressResponse){
                                      selectedAddressModel = value;
                                     setState((){} );
                                    }
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                   ),
                                ),
                                child: Text('Select'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                        orderModelList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                              padding:
                              const EdgeInsets.all(
                                  8.0),
                              child: OrderCardWidget(orderModel: orderModelList[index],onDelete: (){
                                setStatet((){});
                               setState((){});
                              },)
                          );
                        }),
                    SizedBox(height: 100,)
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Container(
                  color: Colors.grey.shade100,
                  height: 80,
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Spacer(),
                            MaterialButton(
                              onPressed: () {
                                if(selectedAddressModel == null){
                                  Fluttertoast.showToast(msg: 'Select Address Please');
                                }else {
                                  List<int> allPlacesIds = [];
                                  for (var element in widget.placesOrders) {
                                    allPlacesIds.add(element.placeId ?? -1);
                                  }
                                  widget.calculatePrice(CalculatePriceRequest(
                                      selectedAddressModel?.id, allPlacesIds));
                                }
                              },
                              color: redColor,
                              elevation: 0,
                              padding: EdgeInsets.only(
                                  left: 75,
                                  right: 75,
                                  top: 13,
                                  bottom: 13),
                              shape:
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    25),
                              ),
                              child: const Text(
                                'Checkout',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight:
                                    FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 80,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
