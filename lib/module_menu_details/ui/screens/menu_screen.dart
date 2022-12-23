import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
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

  const MenuDetailsScreen(this.cubit, this._authService, this._homePageCubit);

  @override
  State<MenuDetailsScreen> createState() => MenuDetailsScreenState();
}

class MenuDetailsScreenState extends State<MenuDetailsScreen> {
  MenuDetailsModel? menuDetailsModel;
  bool flags = true;

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
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args != null && flags) {
      menuDetailsModel = args as MenuDetailsModel;
      flags = false;
    }
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
              menuDetailsModel!.menuImages!.isNotEmpty
                  ? GridView.builder(
                      itemBuilder: (context, index) => Image.network(
                          menuDetailsModel!.menuImages![index].menuImage ?? ''),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: menuDetailsModel!.menuImages!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (3.5 / 4),
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 10,
                      ))
                  : Container()
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
        CustomActionButton(
            model: menuDetailsModel,
            isLoginUser: widget._authService.isLoggedIn,
            claPrice: (request) {
              widget.cubit.calculateTotalPrice(request, this);
            }),

      ),
    );
  }
}
