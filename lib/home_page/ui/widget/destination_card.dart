import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:untitled1/home_page/response/homepage_response.dart';
import 'package:untitled1/module_menu_details/menu_route.dart';
import 'package:untitled1/module_menu_details/model/menu_model.dart';

class DestinationCard extends StatelessWidget {
  final Destinations model;
  const DestinationCard({ required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, MenuRoutes.menuPage ,
            arguments: MenuDetailsModel(
                categoryName: model.title ?? '',
                image: model.image ?? '',
                restaurantName: model.title ?? '',
                menuImages: [] ,
                placeTypeId: model.id,
                placeId: 0
            ));
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
        color: Colors.grey.shade50,
        child: Hero(
          tag: model.image ?? '',
          child: CachedNetworkImage(
            // cacheManager: customCacheManager,
            // maxHeightDiskCache: 100,
            key: UniqueKey(),
            imageUrl: model.image ?? '',
            fit: BoxFit.cover,
            color: Colors.grey.shade50,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fitWidth,

                ),
              ),
            ),
            placeholder: (context, url) => Center(
              child: LoadingAnimationWidget.inkDrop(
                  color: Theme.of(context).primaryColor, size: 20),
            ),
            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
          ),
        ),
      ),
    );
  }
}
