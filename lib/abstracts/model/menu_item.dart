import 'package:flutter/material.dart';

class ItemModel{
  final String title;
  final Widget icon;
  final Function onTap;

  ItemModel(this.title, this.icon, this.onTap);

}