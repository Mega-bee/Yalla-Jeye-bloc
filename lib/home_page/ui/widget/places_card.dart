import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:untitled1/home_page/response/homepage_response.dart';
import 'package:untitled1/module_menu_details/menu_route.dart';
import 'package:untitled1/module_menu_details/model/menu_model.dart';
import 'package:intl/intl.dart';
import '../../../hive/hive.dart';
import 'package:intl/intl.dart';

class PlaceCard extends StatefulWidget {
  final String categoryName;
  final int? placeTypeId;
  final Places model;

  PlaceCard(
      {required this.model,
      required this.categoryName,
      this.placeTypeId,
      required this.selectedDate});

  DateTime selectedDate;

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {

  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setStateBuilder) {
      return Container(
        width: 280,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              InkWell(
                onTap: () {
                  print("REQUIRES AGE ONE: ${widget.model.requiresAge}");
                  if (widget.model.requiresAge == true &&
                      SelectedDateHive().getToken() == null) {
                    print("REQUIRES AGE TWO: ${widget.model.requiresAge}");
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Verification of conditions'),
                          content: Text(
                              'Are you over 18 years of age and are you a smoker or user of other nicotine products?'),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                "No I'm not",
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: Text(
                                'Yes I am',
                                style: TextStyle(color: Colors.green),
                              ),
                              onPressed: () {
                                SelectedDateHive().getToken() == null
                                    ? showCupertinoModalPopup(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            color: Colors.white,
                                            height: 300,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: CupertinoDatePicker(
                                                    // initialDateTime:
                                                    //     selectedDate,
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .date,
                                                    minimumYear: 1900,
                                                    maximumYear:
                                                        DateTime.now().year,
                                                    onDateTimeChanged:
                                                        (DateTime value) {
                                                      String date = DateFormat(
                                                              'dd/MM/yyyy')
                                                          .format(value);
                                                      SelectedDateHive()
                                                          .setToken(date);
                                                      final savedDate =
                                                          SelectedDateHive()
                                                              .getToken();
                                                      print(savedDate);
                                                      widget.selectedDate =
                                                          value;
                                                    },
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: CupertinoButton(
                                                        child: Text('Cancel'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Expanded(
                                                      child: CupertinoButton(
                                                        child: Text('Confirm'),
                                                        onPressed: () {
                                                          print(
                                                              "DATE One:${widget.selectedDate}");
                                                          print('-----------------------');
                                                          print("REQUIRES AGE TWO: ${widget.model.requiresAge}");

                                                          if (widget
                                                              .selectedDate
                                                              .add(Duration(
                                                                  days:
                                                                      365 * 18))
                                                              .isAfter(DateTime
                                                                  .now())) {
                                                            print(
                                                                "DATE Two:${widget.selectedDate}");
                                                            SelectedDateHive().clearDate();
                                                            showCupertinoDialog(
                                                                context:
                                                                    context,
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    CupertinoAlertDialog(
                                                                      title: Text(
                                                                          "Error"),
                                                                      content: Text(
                                                                          "You must be at least 18 years old."),
                                                                      actions: [
                                                                        CupertinoDialogAction(
                                                                          child:
                                                                              Text("OK"),
                                                                          onPressed:
                                                                              () {
                                                                            print('under 18');
                                                                            Navigator.of(context).pop();
                                                                            Navigator.of(context).pop();
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ));
                                                          } else {
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              20),
                                                                  title: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Sharing your information with',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            4,
                                                                      ),
                                                                      Text(
                                                                        'Iqos Store - Beirut (Up To 6 Hrs Delivery)',
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              16,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            8,
                                                                      ),
                                                                      Container(
                                                                        alignment: Alignment.centerLeft,
                                                                        child: Text(
                                                                          'I accept to share information about me and/or my purchase with Philip Morris Management Services and its affiliates to benefit from additional Customer Care services',
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                                  16,
                                                                              fontWeight:
                                                                                  FontWeight.w400),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  content: Row(
                                                                    children: [
                                                                      StatefulBuilder(
                                                                        builder: (BuildContext
                                                                                context,
                                                                            StateSetter
                                                                                setState) {
                                                                          return Checkbox(
                                                                            value:
                                                                                _isChecked,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                _isChecked = value;
                                                                              });
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          "I agree to share my information (optional)",
                                                                          style:
                                                                              TextStyle(fontSize: 14),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),

                                                                  actions: [
                                                                    Center(
                                                                      child:
                                                                          TextButton(
                                                                        child:
                                                                            Text(
                                                                          "Confirm",
                                                                          style:
                                                                              TextStyle(fontSize: 15),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          FocusScope.of(context)
                                                                              .requestFocus();
                                                                          if (AcceptSmoke().getSmoke() == null &&
                                                                              _isChecked == true) {
                                                                            Navigator.pop(context);
                                                                            Navigator.pop(context);
                                                                            Navigator.pop(context);
                                                                            Navigator.pushNamed(context,
                                                                                MenuRoutes.menuPage,
                                                                                arguments: MenuDetailsModel(
                                                                                  categoryName: widget.categoryName,
                                                                                  image: widget.model.image ?? '',
                                                                                  restaurantName: widget.model.title ?? '',
                                                                                  menuImages: widget.model.menu,
                                                                                  placeId: widget.model.id,
                                                                                  placeTypeId: 0,
                                                                                ));
                                                                          } else {
                                                                            Navigator.pop(context);
                                                                            Navigator.pop(context);
                                                                            Navigator.pop(context);
                                                                            Navigator.pushNamed(context,
                                                                                MenuRoutes.menuPage,
                                                                                arguments: MenuDetailsModel(
                                                                                  categoryName: widget.categoryName,
                                                                                  image: widget.model.image ?? '',
                                                                                  restaurantName: widget.model.title ?? '',
                                                                                  menuImages: widget.model.menu,
                                                                                  placeId: widget.model.id,
                                                                                  placeTypeId: 0,
                                                                                ));
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      )

                                    : Navigator.pushNamed(
                                        context, MenuRoutes.menuPage,
                                        arguments: MenuDetailsModel(
                                          categoryName: widget.categoryName,
                                          image: widget.model.image ?? '',
                                          restaurantName:
                                              widget.model.title ?? '',
                                          menuImages: widget.model.menu,
                                          placeId: widget.model.id,
                                          placeTypeId: 0,
                                        ));
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    print("Pushedd");
                    Navigator.pushNamed(context, MenuRoutes.menuPage,
                        arguments: MenuDetailsModel(
                          categoryName: widget.categoryName,
                          image: widget.model.image ?? '',
                          restaurantName: widget.model.title ?? '',
                          menuImages: widget.model.menu,
                          placeId: widget.model.id,
                          placeTypeId: 0,
                        ));
                  }
                },
                child: Hero(
                  tag: widget.model.image ?? '',
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: CachedNetworkImage(
                      key: UniqueKey(),
                      imageUrl: widget.model.image ?? '',
                      fit: BoxFit.cover,
                      height: 170,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Center(
                        child: LoadingAnimationWidget.inkDrop(
                            color: Theme.of(context).primaryColor, size: 20),
                      ),
                      errorWidget: (context, url, error) =>
                          Center(child: Icon(Icons.error)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 8, top: 8),
                child: Text(
                  "${widget.model.title}",
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
