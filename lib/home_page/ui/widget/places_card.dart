import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:untitled1/home_page/response/homepage_response.dart';
import 'package:untitled1/module_menu_details/menu_route.dart';
import 'package:untitled1/module_menu_details/model/menu_model.dart';

class PlaceCard extends StatelessWidget {
  final String categoryName;
  final int? placeTypeId;
  final Places model;
  const PlaceCard({ required this.model, required this.categoryName, this.placeTypeId});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 280,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, MenuRoutes.menuPage ,
                    arguments: MenuDetailsModel(
                  categoryName: categoryName,
                      image: model.image ?? '',
                      restaurantName: model.title ?? '',
                      menuImages: model.menu ,
                      placeId: model.id,
                      placeTypeId: 0,
                ));
              },
              child: Hero(
                tag: model.image ?? '',
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight:  Radius.circular(15)),
                  child: CachedNetworkImage(
                    key: UniqueKey(),
                    imageUrl:model.image ?? '',
                    fit: BoxFit.cover,
                    height: 170,
                    imageBuilder: (context, imageProvider) =>
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight:  Radius.circular(15)),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    placeholder: (context, url) => Center(
                      child: LoadingAnimationWidget.inkDrop(
                          color: Theme.of(context).primaryColor,
                          size: 20),
                    ),
                    errorWidget: (context, url, error) =>
                        Center(child: Icon(Icons.error)),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8,top: 8),
              child: Text(
                "${model.title}",
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
  }
}
