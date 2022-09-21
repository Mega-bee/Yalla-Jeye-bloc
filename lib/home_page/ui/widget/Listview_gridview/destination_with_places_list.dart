import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:untitled1/home_page/ui/widget/Listview_gridview/places_list.dart';
import 'package:untitled1/home_page/ui/widget/view_all_categories.dart';

import '../../../../utils/Colors/colors.dart';
import '../../../response/homepage_response.dart';
import '../images_details/images_details.dart';

class DestinationWithPlacesList extends StatefulWidget {
  final HomePageModel homepage;
  final model;
  final index;
  DestinationWithPlacesList({required this.homepage,this.model,this.index});


  @override
  State<DestinationWithPlacesList> createState() => _DestinationWithPlacesListState();
}

class _DestinationWithPlacesListState extends State<DestinationWithPlacesList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "${widget.model.title}",
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ViewAllCategories(
                              image: widget.model
                                  .places![widget.index].image,
                              title: widget.model.title,
                              name: widget.model
                                  .places![widget.index].title,
                              homePageModel: widget.model.places!
                            // homepage: homepage,
                          ),
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: redColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "${widget.model.description}",
              style: GoogleFonts.poppins(
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                  color: Colors.grey),
            ),
          ),
          SizedBox(height: 34),
          Container(
            height: 240,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: widget.model.places!.take(6).length,
                itemBuilder: (context, index) {
                  final F = widget.model.places![index];
                  return PlacesList(
                    F: F[index],
                    model: widget.model,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
