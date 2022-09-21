import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../response/homepage_response.dart';
import '../images_details/homepage_ads_details.dart';

class CarouselImageSlider extends StatefulWidget {
  final HomePageModel homepage;
  final itemIndex;

  CarouselImageSlider({required this.homepage,this.itemIndex});

  @override
  State<CarouselImageSlider> createState() => _CarouselImageSliderState();
}

class _CarouselImageSliderState extends State<CarouselImageSlider> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => HomePageAdsDetails(
              image:
              widget.homepage.events!.services![widget.itemIndex].imageUrl,
            ),
          ),
        );
      },
      child: Center(
        child: Container(
          width: double.infinity,
          child: Stack(
            children: [
              CachedNetworkImage(
                // cacheManager: customCacheManager,
                // maxHeightDiskCache: 100,
                key: UniqueKey(),
                imageUrl: widget.homepage
                    .events!.services![widget.itemIndex].imageUrl
                    .toString(),
                imageBuilder: (context, imageProvider) =>
                    Container(
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
                      color: Theme.of(context).primaryColor,
                      size: 20),
                ),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
