import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/custom/model/OrderModel.dart';
import 'package:untitled1/di/di_config.dart';
import 'package:untitled1/module_menu_details/ui/widget/custom_action_botton.dart';
import 'package:untitled1/module_notifications/service/fire_notification_service/fire_notification_service.dart';
import 'package:untitled1/utils/global/global_state_manager.dart';
import '../../../abstracts/states/state.dart';
import '../../../hive/hive.dart';
import '../../../module_notifications/request/notification_request.dart';
import '../../../utils/images/images.dart';
import '../../state_manager/homepage.dart';
import '../../state_manager/search_terms.dart';

@injectable
class SearchPlaces extends StatefulWidget {
  final SearchTermsCubit cubit;
  final AuthPrefsHelper locationHelper;
  final AuthService _authService;

  SearchPlaces(this.cubit,this.locationHelper, this._authService);

  @override
  State<SearchPlaces> createState() => SearchPlacesState();
}

class SearchPlacesState extends State<SearchPlaces> with TickerProviderStateMixin {
  StreamSubscription? _globalStateManager;
  @override
  void initState() {
    super.initState();


  }

  static FireNotificationService fireNotificationService = FireNotificationService();



  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void refresh() {
    print('reffesss hommee');
    if (mounted) {
      setState(() {});
    }
  }

  // String dropdownValue = 'One';
  // GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  late AnimationController controller;

  // TextEditingController textFieldController = TextEditingController();

  String currentLocation = 'Zahle';
  // final DestinationWithPlaces homepage = DestinationWithPlaces();
  // final Destinations dest = Destinations();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(ImageAsset.LOGO),
        leadingWidth: 150,
        backgroundColor: Colors.grey.shade50,elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<SearchTermsCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),

    );
  }
}
