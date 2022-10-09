import 'package:flutter/material.dart';
import 'package:untitled1/home_page/response/homepage_response.dart';
import 'package:untitled1/home_page/ui/widget/places_card.dart';
import 'package:untitled1/home_page/ui/widget/title_home.dart';

class DestWithPlaceCard extends StatelessWidget {
  final DestinationWithPlaces? model;
  const DestWithPlaceCard({  this.model});

  @override
  Widget build(BuildContext context) {
    return model!.places!.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleHome(
                  title: model!.title ?? '', body: model!.description ?? ''),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return PlaceCard(model: model!.places![index],categoryName: model!.title ?? '',placeTypeId: model!.id,);
                  }),
                  itemCount: model!.places?.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                ),
              )
            ],
          )
        : Container();
  }
}
