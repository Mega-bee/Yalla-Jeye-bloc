import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';

import '../../response/homepage_response.dart';
import 'images_details/images_details.dart';

class ViewAllCategories extends StatefulWidget {
  String? image;
  String? name;
  String? title;
  final List<Places> homePageModel;

  // final HomePageModel homepage;

  ViewAllCategories({
    required this.image,
    required this.title,
    required this.name,
    required this.homePageModel,

    // required this.homepage,
  });

  @override
  State<ViewAllCategories> createState() => _ViewAllCategoriesState();
}

class _ViewAllCategoriesState extends State<ViewAllCategories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "${widget.title}",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body:

            Container(
              height: 900,
              child: ListView.builder(
                  // separatorBuilder: (BuildContext context, int index) =>
                  //     const Divider(),
                  scrollDirection: Axis.vertical,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.homePageModel.length,
                  itemBuilder: (context, index) {
                    final F = widget.homePageModel[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 4.0, left: 8.0),
                            child: Container(
                              width: 400,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ImageDetails(

                                              image: F.image.toString(),
                                              title: F.title,
                                              menu: F.menu,
                                              creatingCartList: [],
                                            )),
                                  );
                                },
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: ClipRRect(

                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.network(
                                      F.image.toString(),
                                      height: 240,

                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              "${F.title}",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 30,)
                        ],
                      ),
                    );
                  }),
            ),


      ),
    );
  }
}
