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
  double _getAge(DateTime birthdate) {
    final ageInDays = DateTime.now().difference(birthdate).inDays;
    return ageInDays / 365.25;
  }

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  // void _checkAge() {
  bool _isChecked = false;

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
                  widget.model.requiresAge == true
                      ? SelectedDateHive().getToken() == null
                          ? showDialog(
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
                                                builder:
                                                    (BuildContext context) {
                                                  return Container(
                                                    color: Colors.white,
                                                    height: 300,
                                                    child: Column(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              CupertinoDatePicker(
                                                            // initialDateTime:
                                                            //     selectedDate,
                                                            mode:
                                                                CupertinoDatePickerMode
                                                                    .date,
                                                            minimumYear: 1900,
                                                            maximumYear:
                                                                DateTime.now()
                                                                    .year,
                                                            onDateTimeChanged:
                                                                (DateTime
                                                                    value) {
                                                              String date =
                                                                  DateFormat(
                                                                          'dd/MM/yyyy')
                                                                      .format(
                                                                          value);
                                                              SelectedDateHive()
                                                                  .setToken(
                                                                      date);
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
                                                              child:
                                                                  CupertinoButton(
                                                                child: Text(
                                                                    'Cancel'),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            Expanded(
                                                              child:
                                                                  CupertinoButton(
                                                                child: Text(
                                                                    'Confirm'),
                                                                onPressed: () {
                                                                  if (widget
                                                                      .selectedDate
                                                                      .add(Duration(
                                                                          days: 365 *
                                                                              18))
                                                                      .isAfter(
                                                                          DateTime
                                                                              .now())) {
                                                                    showCupertinoDialog(
                                                                        context:
                                                                            context,
                                                                        builder: (BuildContext
                                                                                context) =>
                                                                            CupertinoAlertDialog(
                                                                              title: Text("Error"),
                                                                              content: Text("You must be at least 18 years old."),
                                                                              actions: [
                                                                                CupertinoDialogAction(
                                                                                  child: Text("OK"),
                                                                                  onPressed: () => Navigator.of(context).pop(),
                                                                                ),
                                                                              ],
                                                                            ));
                                                                  } else {
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text("Your Title"),
                                                                          content:
                                                                              Row(
                                                                            children: [
                                                                              Checkbox(
                                                                                value: _isChecked,
                                                                                focusNode: FocusNode(),
                                                                                onChanged: (bool? value) {
                                                                                 setState(() {
                                                                                   _isChecked = value!;
                                                                                 });
                                                                                },
                                                                              ),
                                                                              Text("Checkbox"),
                                                                            ],
                                                                          ),

                                                                          actions: [
                                                                            ElevatedButton(
                                                                              child: Text("OK"),
                                                                              onPressed: () {
                                                                                FocusScope.of(context).requestFocus();
                                                                                if (AcceptSmoke().getSmoke() == null && _isChecked == true) {
                                                                                  Navigator.pop(context);
                                                                                  Navigator.pop(context);
                                                                                  Navigator.pop(context);
                                                                                  Navigator.pushNamed(context, MenuRoutes.menuPage,
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
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    // Navigator.pop(
                                                                    //     context);
                                                                    // Navigator.pop(
                                                                    //     context);

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
                                                  categoryName:
                                                      widget.categoryName,
                                                  image:
                                                      widget.model.image ?? '',
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
                            )
                          : Navigator.pushNamed(context, MenuRoutes.menuPage,
                              arguments: MenuDetailsModel(
                                categoryName: widget.categoryName,
                                image: widget.model.image ?? '',
                                restaurantName: widget.model.title ?? '',
                                menuImages: widget.model.menu,
                                placeId: widget.model.id,
                                placeTypeId: 0,
                              ))
                      : Navigator.pushNamed(context, MenuRoutes.menuPage,
                          arguments: MenuDetailsModel(
                            categoryName: widget.categoryName,
                            image: widget.model.image ?? '',
                            restaurantName: widget.model.title ?? '',
                            menuImages: widget.model.menu,
                            placeId: widget.model.id,
                            placeTypeId: 0,
                          ));
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
