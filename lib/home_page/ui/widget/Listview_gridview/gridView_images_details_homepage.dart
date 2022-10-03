import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../hive/hive.dart';
import '../../../response/homepage_response.dart';
import '../images_details/category_details.dart';

class GridViewDetails extends StatefulWidget {
  final HomePageModel homepage;
  final index;

  GridViewDetails({required this.homepage, this.index});

  @override
  State<GridViewDetails> createState() => _GridViewDetailsState();
}

class _GridViewDetailsState extends State<GridViewDetails> {
  ListCart cart = ListCart();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => CategoryDetails(
                    image: widget.homepage.destinations![widget.index].image,
                    title: widget.homepage.destinations![widget.index].title,
                    homePageModel: widget.homepage,
                    CategoryName: widget
                        .homepage.destinationWithPlaces![widget.index].title,
                    creatingCartList: cart
                        .updatedCart(
                          placeCategory: widget.homepage
                              .destinationWithPlaces![widget.index].title,
                          placeName: widget
                              .homepage
                              .destinationWithPlaces![widget.index]
                              .places![widget.index]
                              .title,
                        )!
                        .toList(),
                  )),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          children: [
            Card(
              elevation: 1,
              child: CachedNetworkImage(
                // cacheManager: customCacheManager,
                // maxHeightDiskCache: 100,
                key: UniqueKey(),
                imageUrl: widget.homepage.destinations![widget.index].image
                    .toString(),
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                placeholder: (context, url) => Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: LoadingAnimationWidget.inkDrop(
                      color: Theme.of(context).primaryColor, size: 20),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            )
          ],
        ),
      ),
    );
  }
}
