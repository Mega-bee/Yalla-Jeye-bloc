import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../abstracts/states/state.dart';
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
      this.state, this.searchTerm, this.categoryName, this.placeTypeId);

  // HomePageState homepageState;

  TextEditingController? searchTermController = TextEditingController();

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
              hintText: "Restaurant name...",
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
                            Navigator.pushNamed(context, MenuRoutes.menuPage,
                                arguments: MenuDetailsModel(
                                  categoryName: categoryName,
                                  image: searchTerm[index].image ?? '',
                                  restaurantName: searchTerm[index].title ?? '',
                                  menuImages: [],
                                  placeId: searchTerm[index].id,
                                  placeTypeId: 0,
                                ));
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
