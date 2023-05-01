import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../abstracts/states/state.dart';
import '../../../hive/hive.dart';
import '../../../module_menu_details/menu_route.dart';
import '../../../module_menu_details/model/menu_model.dart';
import '../../../utils/Colors/colors.dart';
import '../../request/search_terms_request.dart';
import '../../response/search_terms_response.dart';
import '../screens/search_places.dart';

class SearchPlaceSuccess extends States {
  List<SearchTermsModel> searchTerm;
  SearchPlacesState state;
  final String categoryName;
  final int? placeTypeId;

  SearchPlaceSuccess(
    this.state,
    this.searchTerm,
    this.categoryName,
    this.placeTypeId,
  );

  // HomePageState homepageState;

  TextEditingController? searchTermController = TextEditingController();
  DateTime? selectedDate;
  bool? _isChecked = false;

  @override
  Widget getUI(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: TextField(
            onChanged: (value) {
              state.getSearch(SearcPlacesRequest(
                isSearch: value,
              ));
            },
            //controller: searchTermController,
            cursorColor: redColor,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              prefixIcon: const Icon(CupertinoIcons.search),
              labelText: "Search",
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: "what you are looking for",
              labelStyle: const TextStyle(color: Colors.black),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.black12,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
            ),

            autofocus: true,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Expanded(
          child: searchTerm.isNotEmpty
              ? ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemCount: searchTerm.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            print(
                                "REQUIRES AGE ONE: ${searchTerm[index].requiresAge}");
                            if (searchTerm[index].requiresAge == true &&
                                SelectedDateHive().getToken() == null) {
                              print(
                                  "REQUIRES AGE TWO: ${searchTerm[index].requiresAge}");
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
                                                                print(
                                                                    savedDate);
                                                                selectedDate =
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
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 10),
                                                              Expanded(
                                                                child:
                                                                    CupertinoButton(
                                                                  child: Text(
                                                                      'Confirm'),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        "DATE One:${selectedDate}");
                                                                    print(
                                                                        '-----------------------');
                                                                    print(
                                                                        "REQUIRES AGE TWO: ${searchTerm[index].requiresAge}");

                                                                    if (selectedDate!
                                                                        .add(Duration(
                                                                            days: 365 *
                                                                                18))
                                                                        .isAfter(
                                                                            DateTime.now())) {
                                                                      print(
                                                                          "DATE Two:${selectedDate}");
                                                                      SelectedDateHive()
                                                                          .clearDate();
                                                                      showCupertinoDialog(
                                                                          context:
                                                                              context,
                                                                          builder: (BuildContext context) =>
                                                                              CupertinoAlertDialog(
                                                                                title: Text("Error"),
                                                                                content: Text("You must be at least 18 years old."),
                                                                                actions: [
                                                                                  CupertinoDialogAction(
                                                                                    child: Text("OK"),
                                                                                    onPressed: () {
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
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                            contentPadding:
                                                                                EdgeInsets.all(20),
                                                                            title:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'Sharing your information with',
                                                                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 4,
                                                                                ),
                                                                                Text(
                                                                                  'Iqos Store - Beirut (Up To 6 Hrs Delivery)',
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontSize: 16,
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 8,
                                                                                ),
                                                                                Container(
                                                                                  alignment: Alignment.centerLeft,
                                                                                  child: Text(
                                                                                    'I accept to share information about me and/or my purchase with Philip Morris Management Services and its affiliates to benefit from additional Customer Care services',
                                                                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            content:
                                                                                Row(
                                                                              children: [
                                                                                StatefulBuilder(
                                                                                  builder: (BuildContext context, StateSetter setState) {
                                                                                    return Checkbox(
                                                                                      value: _isChecked,
                                                                                      onChanged: (value) {
                                                                                        setState(() {
                                                                                          _isChecked = value;
                                                                                        });
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                ),
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    "I agree to share my information (optional)",
                                                                                    style: TextStyle(fontSize: 14),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            actions: [
                                                                              Center(
                                                                                child: TextButton(
                                                                                  child: Text(
                                                                                    "Confirm",
                                                                                    style: TextStyle(fontSize: 15),
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    FocusScope.of(context).requestFocus();
                                                                                    if (AcceptSmoke().getSmoke() == null && _isChecked == true) {
                                                                                      Navigator.pop(context);
                                                                                      Navigator.pop(context);
                                                                                      Navigator.pop(context);
                                                                                      Navigator.pushNamed(context, MenuRoutes.menuPage,
                                                                                          arguments: MenuDetailsModel(
                                                                                            categoryName: categoryName,
                                                                                            image: searchTerm[index].image ?? '',
                                                                                            restaurantName: searchTerm[index].title ?? '',
                                                                                            menuImages: [],
                                                                                            placeId: searchTerm[index].id,
                                                                                            placeTypeId: 0,
                                                                                          ));
                                                                                    } else {
                                                                                      Navigator.pop(context);
                                                                                      Navigator.pop(context);
                                                                                      Navigator.pop(context);
                                                                                      Navigator.pushNamed(context, MenuRoutes.menuPage,
                                                                                          arguments: MenuDetailsModel(
                                                                                            categoryName: categoryName,
                                                                                            image: searchTerm[index].image ?? '',
                                                                                            restaurantName: searchTerm[index].title ?? '',
                                                                                            menuImages: [],
                                                                                            placeId: searchTerm[index].id,
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
                                                    categoryName: categoryName,
                                                    image: searchTerm[index]
                                                            .image ??
                                                        '',
                                                    restaurantName:
                                                        searchTerm[index]
                                                                .title ??
                                                            '',
                                                    menuImages: [],
                                                    placeId:
                                                        searchTerm[index].id,
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
                                    categoryName: categoryName,
                                    image: searchTerm[index].image ?? '',
                                    restaurantName:
                                        searchTerm[index].title ?? '',
                                    menuImages: [],
                                    placeId: searchTerm[index].id,
                                    placeTypeId: 0,
                                  ));
                            }
                          },
                          child: ListTile(
                            // leading: Image.network(searchTerm[index].image.toString()),
                            title: Text("${searchTerm[index].title}"),
                            subtitle: Text("${searchTerm[index].description}"),
                          ),
                        )
                      ],
                    );
                  })
              : Text("No result found"),
        )
      ],
    );
  }
}
