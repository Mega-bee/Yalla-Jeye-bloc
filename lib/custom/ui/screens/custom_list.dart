import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/home_page/ui/state/home_state.dart';
import 'package:untitled1/utils/components/custom_alert_dialog.dart';
import '../../../abstracts/states/state.dart';
import '../../request/custom_request.dart';
import '../../state_manager/custom.dart';
import '../state/custom_sucess.dart';

@injectable
class CustomPage extends StatefulWidget {
  final CustomCubit cubit;
  final AuthService _authService;

  const CustomPage(this.cubit, this._authService);

  @override
  State<CustomPage> createState() => CustomPageState();
}

class CustomPageState extends State<CustomPage> {
  late AsyncSnapshot loadingSnapshotLogin;
  @override
  void initState() {
    super.initState();
    loadingSnapshotLogin = AsyncSnapshot.nothing();
    widget.cubit.loadingStream.listen((event) {
      if (mounted) {
        setState(() {
          loadingSnapshotLogin = event;
        });
      }
    });
    widget.cubit.emit(CustomSuccess(customPageState: this));
  }

  CustomOrder(CustomOrderRequest request){
   widget._authService.isLoggedIn ?
   widget.cubit.calculateCustomPrice(  request ,this) :
   showDialog(context: context, builder: (context) => CustomDialogBox(title:"You should login first to make order"),);
  }

 bool checkIsUserLogged(){
  return  widget._authService.isLoggedIn;
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Text(
          "Custom order",
          style: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // elevation: 1,
        // centerTitle: true,
      ),
      body: BlocBuilder<CustomCubit, HomeStates>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
