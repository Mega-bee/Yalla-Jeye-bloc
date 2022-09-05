
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class CustomNetworkImage extends StatelessWidget {
  final List<String>? imageSource;
  final int? indexPage;
  final String thumbnail;
  CustomNetworkImage({this.imageSource, required this.thumbnail, this.indexPage}) : super() {
    dd = PageController(initialPage: indexPage ?? 0);
  }

 late PageController dd;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black38,
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                backgroundColor: Colors.black,
                body: Dismissible(
                  direction: DismissDirection.down,
                  key: const Key('key'),
                   onDismissed: (_) => Navigator.of(context).pop(),
                  movementDuration: Duration(milliseconds: 5),
                  child: PhotoViewGallery.builder(
                    scrollPhysics: const BouncingScrollPhysics(),
                    pageController: dd,
                    builder: (BuildContext context, int index) {
                      return PhotoViewGalleryPageOptions(
                        imageProvider: CachedNetworkImageProvider(imageSource![index]),
                        initialScale: PhotoViewComputedScale.contained * 1.0,
                        minScale: PhotoViewComputedScale.contained * 1.0,
                        maxScale: PhotoViewComputedScale.contained * 3.0,
//                      initialScale: PhotoViewComputedScale.contained * 0.8,
                      );
                    },
                    itemCount: imageSource!.length,
                    loadingBuilder: (context, event) => Center(
                        child: Center(
                            child: LoadingAnimationWidget.staggeredDotsWave(
                                color: Theme.of(context).primaryColor,
                                size: 30))),

                  ),
                ),
              );
            });
      },
      child: CachedNetworkImage(
        imageUrl: thumbnail,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 20),
            child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Theme.of(context).primaryColor, size: 30))),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
