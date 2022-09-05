import 'package:flutter/material.dart';

class CustomSearch extends StatefulWidget {
  final double height;
  final EdgeInsetsGeometry contentPadding;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  @override
  _CustomDeliverySearchState createState() => _CustomDeliverySearchState();

  const CustomSearch(
      {this.height = 50,
      this.contentPadding = const EdgeInsets.fromLTRB(0, 13.5, 0, 0),
      required this.hintText,
      this.onChanged,
      this.controller});
}

class _CustomDeliverySearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
         color: Theme.of(context).colorScheme.onTertiary,
      ),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: const Icon(Icons.filter_list),
          enabledBorder: InputBorder.none,
          contentPadding: widget.contentPadding,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
