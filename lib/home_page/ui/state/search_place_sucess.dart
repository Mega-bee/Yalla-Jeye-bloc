import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:untitled1/home_page/ui/screens/placess_list_screen.dart';
import 'package:untitled1/home_page/ui/widget/destination_card.dart';
import 'package:untitled1/home_page/ui/widget/destination_place_card.dart';
import 'package:untitled1/home_page/ui/widget/title_home.dart';
import '../../../abstracts/states/state.dart';
import '../../../module_menu_details/menu_route.dart';
import '../../../module_menu_details/model/menu_model.dart';
import '../../../utils/Colors/colors.dart';
import '../../request/search_terms_request.dart';
import '../../response/homepage_response.dart';
import '../../response/search_terms_response.dart';
import '../screens/home_page.dart';
import '../screens/search_places.dart';
import '../widget/Carousel_slider_widget/carousel_image_slider.dart';

class SearchPlaceSuccess extends States {
  List<SearchTermsModel> searchTerm;
  SearchPlacesState state;

  SearchPlaceSuccess(this.state, this.searchTerm);

  // HomePageState homepageState;

  TextEditingController? searchTermController = TextEditingController();

  @override
  Widget getUI(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: TextField(
            onChanged: (valuee) {
              state.getSearch(SearcPlacesRequest(
                isSearch: valuee,
              ));
            },
            //controller: searchTermController,
            cursorColor: redColor,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              prefixIcon: Icon(CupertinoIcons.search),
              labelText: "Search",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: "Restaurant name...",
              labelStyle: TextStyle(color: Colors.black),
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
            // keyboardType: TextInputType.text,
            // validator: MultiValidator([
            //   RequiredValidator(
            //       errorText: 'Mobile number Required *'),
            // ]),
            // autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: searchTerm.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          MenuRoutes.menuPage,
                          arguments: searchTerm[index].id.toString(),
                        );
                      },
                      child: ListTile(
                        // leading: Image.network(searchTerm[index].image.toString()),
                        title: Text("${searchTerm[index].title}"),
                        subtitle: Text("${searchTerm[index].description}"),
                      ),
                    )
                  ],
                );
              }),
        )
      ],
    );
  }
}
