import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../request/custom_request.dart';
import '../../state_manager/custom.dart';
import '../state/custom_sucess.dart';

@injectable
class CustomPage extends StatefulWidget {
  final CustomCubit cubit;

  const CustomPage(this.cubit);

  @override
  State<CustomPage> createState() => CustomPageState();
}

class CustomPageState extends State<CustomPage> {
  @override
  void initState() {
    // widget.cubit.getAddress(this);
    widget.cubit.emit(
      CustomSuccess(customPageState: this),
    );
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
        title: Text(
          "Custom order",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1,
        // centerTitle: true,
      ),
      body: BlocBuilder<CustomCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
