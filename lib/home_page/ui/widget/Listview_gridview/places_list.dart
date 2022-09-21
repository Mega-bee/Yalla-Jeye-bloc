import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../images_details/images_details.dart';

class PlacesList extends StatefulWidget {
final model;
final F;

PlacesList({this.model,this.F});
  @override
  State<PlacesList> createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: 18.0),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                right: 4.0, left: 8.0),
            child: Container(
              width: 280,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext
                      context) =>
                          ImageDetails(
                            // currentPlace:[],


                            image: widget.F.image,
                            title: widget.F.title,
                            menu: widget.F.menu,
                            categoryName:
                            widget.model.title,
                          ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(
                      14),
                  child: CachedNetworkImage(
                    key: UniqueKey(),
                    imageUrl:
                    widget. F.image.toString(),
                    fit: BoxFit.cover,
                    height: 170,
                    imageBuilder: (context,
                        imageProvider) =>
                        Container(
                          decoration:
                          BoxDecoration(
                            borderRadius:
                            BorderRadius
                                .circular(
                                30),
                            image:
                            DecorationImage(
                              image:
                              imageProvider,
                              fit: BoxFit
                                  .fitWidth,
                            ),
                          ),
                        ),
                    placeholder:
                        (context, url) =>
                        Padding(
                          padding:
                          const EdgeInsets
                              .all(15.0),
                          child: LoadingAnimationWidget
                              .inkDrop(
                              color: Theme.of(
                                  context)
                                  .primaryColor,
                              size: 20),
                        ),
                    errorWidget: (context,
                        url, error) =>
                        Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 9.0),
            child: Text(
              "${widget.F.title}",
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
