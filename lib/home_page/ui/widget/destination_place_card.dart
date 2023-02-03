import 'package:flutter/material.dart';
import 'package:untitled1/home_page/response/homepage_response.dart';
import 'package:untitled1/home_page/ui/widget/places_card.dart';
import 'package:untitled1/home_page/ui/widget/title_home.dart';
import 'package:untitled1/module_menu_details/model/menu_model.dart';

class DestWithPlaceCard extends StatefulWidget {
  final DestinationWithPlaces? model;
  const DestWithPlaceCard({  this.model});

  @override
  State<DestWithPlaceCard> createState() => _DestWithPlaceCardState();
}

class _DestWithPlaceCardState extends State<DestWithPlaceCard> {

   DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return widget.model!.places!.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleHome(
                  title: widget.model!.title ?? '', body: widget.model!.description ?? ''),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return PlaceCard(model: widget.model!.places![index],categoryName: widget.model!.title ?? '',placeTypeId: widget.model!.id,selectedDate: selectedDate??DateTime.now(),);
                  }),
                  itemCount: widget.model!.places?.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                ),
              )
            ],
          )
        : Container();
  }
}
