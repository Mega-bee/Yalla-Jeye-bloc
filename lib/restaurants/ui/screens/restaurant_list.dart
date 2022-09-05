import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../request/Restaurants_request.dart';
import '../../state_manager/Restaurants.dart';

@injectable
class RestaurantPage extends StatefulWidget {
  final RestaurantseCubit cubit;

  const RestaurantPage(this.cubit);

  @override
  State<RestaurantPage> createState() => RestaurantPageState();
}

class RestaurantPageState extends State<RestaurantPage> {
  @override

  void initState() {
    widget.cubit.getRestaurants(this);
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
      body: BlocBuilder<RestaurantseCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
