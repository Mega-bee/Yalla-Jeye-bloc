import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../request/homepage_request.dart';
import '../../state_manager/homepage.dart';

@injectable
class HomePage extends StatefulWidget {
  final HomePageCubit cubit;

  const HomePage(this.cubit);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override

  void initState() {
    widget.cubit.getHomePage(this);
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        centerTitle: true,
       actions: [
         Icon(Icons.shopping_cart,color: Colors.redAccent,)
       ],
      ),
      body: BlocBuilder<HomePageCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
