import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/home_page/state_manager/homepage.dart';
import 'package:untitled1/module_menu_details/model/menu_model.dart';
import 'package:untitled1/module_menu_details/ui/widget/custom_action_botton.dart';
import '../../state_manager/menu_state_manager.dart';

@injectable
class MenuDetailsScreen extends StatefulWidget {
  final CheckOutCubit cubit;
  final AuthService _authService;
  final HomePageCubit _homePageCubit;

  const MenuDetailsScreen(
    this.cubit,
    this._authService,
    this._homePageCubit,
  );

  @override
  State<MenuDetailsScreen> createState() => MenuDetailsScreenState();
}

class MenuDetailsScreenState extends State<MenuDetailsScreen> {
  MenuDetailsModel? menuDetailsModel;
  bool flags = true;
  String id = '-1';

  @override
  void initState() {
    super.initState();
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    if (args != null && flags) {
      menuDetailsModel = args as MenuDetailsModel;
      flags = false;
    }
    // final argsId = ModalRoute.of(context)!.settings.arguments;
    // if (argsId is String && flags) {
    //   id = argsId;
    //   flags = false;
    // }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          title: Text(menuDetailsModel?.categoryName ?? '',
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: menuDetailsModel?.image ?? '',
                child: CachedNetworkImage(
                  imageUrl: menuDetailsModel?.image ?? '',
                  fit: BoxFit.fitWidth,
                  width: double.maxFinite,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  menuDetailsModel?.restaurantName ?? '',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // ListView.builder(
              //   shrinkWrap: true,
              //     itemCount: menuDetailsModel?.menuImages?.length,
              //     itemBuilder: (context, index) {
              //       return Image.network(
              //           menuDetailsModel!.menuImages![index].menuImage ?? '');
              //     })
              GridView.builder(
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      showDialog(context: context, builder: (_){
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
                            movementDuration: const Duration(milliseconds: 5),
                            child: PinchZoom(
                                resetDuration: const Duration(milliseconds: 150),
                                onZoomStart: () {},
                                onZoomEnd: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.infinity,
                                    child: Image.network(
                                      menuDetailsModel!.menuImages![index].menuImage ?? '',
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),


                            ),
                          ),

                        );
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                            width: double.infinity,
                            child: Image.network(
                              menuDetailsModel!.menuImages![index].menuImage ?? '',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                    ),
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: menuDetailsModel?.menuImages?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: (4.8 / 4),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 10,
                  )),
              SizedBox(height: 40,),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomActionButton(
            model: menuDetailsModel,
            isLoginUser: widget._authService.isLoggedIn,
            claPrice: (request) {
              widget.cubit.calculateTotalPrice(request, this);
            }),
      ),
    );
  }
}
