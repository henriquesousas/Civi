import 'package:flutter/material.dart';

class MyItem {
  final String name;
  final IconData icon;
  bool isSelected;

  MyItem(this.name, this.icon, this.isSelected);

  changeSelected() {
    this.isSelected = !isSelected;
  }
}
