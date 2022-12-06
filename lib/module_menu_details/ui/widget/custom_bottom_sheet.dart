import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/custom/model/OrderModel.dart';
import 'package:untitled1/di/di_config.dart';
import 'package:untitled1/home_page/state_manager/homepage.dart';
import 'package:untitled1/home_page/ui/screens/home_page.dart';
import 'package:untitled1/module_addresses/address_route.dart';
import 'package:untitled1/module_addresses/response/address_response.dart';
import 'package:untitled1/module_menu_details/model/menu_model.dart';
import 'package:untitled1/module_menu_details/request/calculate_price_request.dart';
import 'package:untitled1/module_menu_details/ui/widget/order_card_widget.dart';
import 'package:untitled1/navigation_bar/ui/screens/navigationBar.dart';
import 'package:untitled1/utils/Colors/colors.dart';
import 'package:untitled1/utils/global/global_state_manager.dart';
import 'package:untitled1/utils/images/images.dart';

class CustomBottomSheet extends StatefulWidget {
  final List<CartOrderModel> placesOrders;
  final MenuDetailsModel? model;
  final Function(CalculatePriceRequest) calculatePrice;
  const CustomBottomSheet({required this.placesOrders, required this.calculatePrice ,required this.model});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
 late CartOrderModel  currentCartModel;


  @override
  void initState() {
    super.initState();
    currentCartModel = CartOrderModel(categoryName: widget.model?.categoryName,
    makeOrder: true,payOrder: true,placeId: widget.model?.placeId,
    placeName: widget.model?.restaurantName ,placeTypeId: widget.model?.placeTypeId);
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
                      padding: const EdgeInsets.all(5),
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

                    checkIfDesOrPlaceExist() ? Container():    OrderCardWidget(orderModel:
                    currentCartModel,
                      onDelete: (){},isCurrentItem: true) ,

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
                              },isCurrentItem: false,)
                          );
                        }),
                   const SizedBox(height: 100,)
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(3, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 80,
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(

                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          const  Spacer(),
                            MaterialButton(
                              onPressed: () {
                                if (widget.model != null) {
                                  if (widget.model?.placeId != 0) {
                                    var containP = orderModelList.where(
                                            (element) =>
                                        element.placeId == widget.model?.placeId);
                                    if (containP.isEmpty) {
                                      orderModelList.insert(
                                          0,
                                          currentCartModel);

                                    }
                                  }
                                  else {
                                    var contain = orderModelList.where((element) =>
                                    element.placeTypeId == widget.model?.placeTypeId &&
                                        element.placeId == widget.model?.placeId);
                                    if (contain.isEmpty) {
                                      orderModelList.insert(
                                          0,
                                          currentCartModel);

                                    }
                                  }
                                  print('seend event');
                                  getIt<GlobalStateManager>().update();
                                }
                                Navigator.pop(context);
                              },
                              color: Colors.white,
                              elevation: 0,
                              padding: const EdgeInsetsDirectional.only(start: 30,end: 30,top: 5 ,bottom: 5),
                              shape:
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    25),
                              ),
                              child: const Text(
                                'Add place',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.red,
                                    fontWeight:
                                    FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 15,),
                            MaterialButton(
                              onPressed: () {
                                if(selectedAddressModel == null){
                                  Fluttertoast.showToast(msg: 'Select Address Please');
                                }
                                else {
                                  if (widget.model != null) {
                                    if (widget.model?.placeId != 0) {
                                      var containP = orderModelList.where(
                                              (element) =>
                                          element.placeId == widget.model?.placeId);
                                      if (containP.isEmpty) {
                                        orderModelList.insert(
                                            0,
                                            currentCartModel);

                                      }
                                    }
                                    else {
                                      var contain = orderModelList.where((element) =>
                                      element.placeTypeId == widget.model?.placeTypeId &&
                                          element.placeId == widget.model?.placeId);
                                      if (contain.isEmpty) {
                                        orderModelList.insert(
                                            0,
                                            currentCartModel);

                                      }
                                    }
                                    print('seend event');
                                  }
                                  List<int> allPlacesIds = [];
                                  List<int> allPlacesTypes = [];
                                  for (var element in widget.placesOrders) {
                                    if(element.placeId == 0){
                                      allPlacesTypes.add(element.placeTypeId ?? -1);
                                    }
                                   else {
                                      allPlacesIds.add(element.placeId ?? -1);
                                    }
                                  }
                                  widget.calculatePrice(CalculatePriceRequest(
                                   addressId:selectedAddressModel?.id,placesId:  allPlacesIds,placeTypes: allPlacesTypes));
                                }
                              },
                              color: redColor,
                              elevation: 0,
                              padding: const EdgeInsetsDirectional.only(start: 30,end: 30,top: 5 ,bottom: 5),
                              shape:  RoundedRectangleBorder(
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

                          ],
                        ),
                      ),
                  ]),
                ),
              )
            ],
          ),
        );
      }),
    );
  }

 bool checkIfDesOrPlaceExist(){
    if(widget.model == null){
      return true;
    }
    else {
   if (widget.model?.placeId != 0) {
     var containP = orderModelList.where(
             (element) =>
         element.placeId == widget.model?.placeId);
     if (containP.isEmpty) {
       return false;
     }else{
       return true;
     }
   }
   else {
     var contain = orderModelList.where((element) =>
     element.placeTypeId == widget.model?.placeTypeId &&
         element.placeId == widget.model?.placeId);
     if (contain.isEmpty) {
       return false;
     }else {
       return true;
     }
   }
  }}
}
