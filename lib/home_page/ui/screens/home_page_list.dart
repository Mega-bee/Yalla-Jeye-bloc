import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/custom/model/OrderModel.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/components/custom_alert_dialog/CustomDeleteDialog/CustomDeleteDialog.dart';
import '../../../utils/images/images.dart';
import '../../state_manager/homepage.dart';

@injectable
class HomePage extends StatefulWidget {
  final HomePageCubit cubit;

  const HomePage(this.cubit);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    widget.cubit.getHomePage(this);
    controller = BottomSheet.createAnimationController(this);
    controller.duration = Duration(milliseconds: 500);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  String dropdownValue = 'One';
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  late AnimationController controller;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset('assets/images/yallaJeyeLogo.png'),
        leadingWidth: 140,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => CustomDeleteDialog(
                  title: "",
                  content: 'Country',
                  contenttwo: 'City',
                  yesBtn: () {
                    Navigator.pop(context);
                  },
                  // noBtn: () {
                  //   Navigator.pop(context);
                  // },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Deliver to',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Zahle',
                          style: TextStyle(
                            color: Color(0xffFFD400),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Color(0xffFFD400),
                        size: 15,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              CupertinoIcons.search,
              color: Colors.black,
              size: 35,
            ),
          )
        ],
      ),
      body: BlocBuilder<HomePageCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: (Theme(
        data: Theme.of(context).copyWith(
            floatingActionButtonTheme: FloatingActionButtonThemeData(
          extendedSizeConstraints: BoxConstraints.tightFor(
            height: 65,
          ),
        )),
        child: FloatingActionButton.extended(
          backgroundColor: Color(0xffFFD400),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed: () {
            showModalBottomSheet(
                transitionAnimationController: controller,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                enableDrag: false,
                useSafeArea: true,
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return AnimatedContainer(
                    duration: Duration(seconds: 5),
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, left: 8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffFFD400),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
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
                                          padding: const EdgeInsets.only(
                                            top: 16.0,
                                            bottom: 16.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                            SizedBox(
                              height: 30,
                            ),
                            Container(

                              height: 550,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(25),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 4.0),
                                                  child: Text(
                                                    "Restaurant: Sahar",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              maxLines: 10,
                                              onChanged: (value) {
                                                //Do something with the user input.
                                              },
                                              decoration: InputDecoration(
                                                hintText:
                                                'What do you want to order',
                                                hintStyle: TextStyle(
                                                  color: Color.fromRGBO(
                                                      204, 204, 204, 0.5),
                                                ),
                                                contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 20.0),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          5.0)),
                                                ),
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderSide:
                                                  const BorderSide(
                                                      color: Color
                                                          .fromRGBO(
                                                          204,
                                                          204,
                                                          204,
                                                          0.5),
                                                      width: 2.0),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                    Radius.circular(5.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.all(
                                                    Radius.circular(5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                    "Driver will pay your order"),
                                                Switch(
                                                  dragStartBehavior:
                                                  DragStartBehavior
                                                      .down,
                                                  activeColor:
                                                  Color(0xffFFD400),
                                                  value: isChecked,
                                                  onChanged: (value) =>
                                                      setState(() {
                                                        isChecked = value;
                                                        print("changed");
                                                      }),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                        itemCount: orderModelList.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(18.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  left: 4.0),
                                                          child: Text(
                                                            orderModelList[index].RestaurantName.toString(),
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                        IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              orderModelList.removeAt(index);
                                                            });

                                                          },
                                                          icon: Icon(
                                                            Icons.delete,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    TextField(
                                                      maxLines: 10,
                                                      onChanged: (value) {
                                                        //Do something with the user input.
                                                      },
                                                      decoration: InputDecoration(
                                                        hintText:
                                                            'What do you want to order',
                                                        hintStyle: TextStyle(
                                                          color: Color.fromRGBO(
                                                              204, 204, 204, 0.5),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsets.symmetric(
                                                                vertical: 10.0,
                                                                horizontal: 20.0),
                                                        border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      5.0)),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          204,
                                                                          204,
                                                                          204,
                                                                          0.5),
                                                                  width: 2.0),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(5.0),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(5.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            "Driver will pay your order"),
                                                        Switch(
                                                          dragStartBehavior:
                                                              DragStartBehavior
                                                                  .down,
                                                          activeColor:
                                                              Color(0xffFFD400),
                                                          value: isChecked,
                                                          onChanged: (value) =>
                                                              setState(() {
                                                            isChecked = value;
                                                            print("changed");
                                                          }),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: Container(
                                height: 999,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 18.0),
                                      child: Text("Total: 99 L.L"),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 18.0),
                                      child: Row(
                                        // mainAxisAlignment:
                                        // MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              orderModelList.add(
                                                OrderModel(
                                                  Description: 'Rahaf',
                                                  RestaurantName: 'Peter',
                                                ),
                                              );
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                top: 13,
                                                bottom: 13,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              side: BorderSide(
                                                width: 1.0,
                                                color: Color.fromRGBO(
                                                    12, 105, 126, 0.5),
                                              ),
                                            ),
                                            child: Text(
                                              'Add place',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    12, 105, 126, 0.5),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          MaterialButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Checkout',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            color: Color(0xffFFD400),
                                            elevation: 0,
                                            padding: EdgeInsets.only(
                                                left: 75,
                                                right: 75,
                                                top: 13,
                                                bottom: 13),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
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
                      ),
                    ),
                  );
                });
          },
          label: Row(
            children: [
              Icon(Icons.calendar_month),
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
      ))
    );
  }
}
