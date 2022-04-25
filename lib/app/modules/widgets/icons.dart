import 'package:flutter/material.dart';
import 'package:todo_app/app/core/values/colors.dart';
import 'package:todo_app/app/core/values/icons.dart';

List<Icon> getIcons() {
  return const [
    Icon(IconData(personIcon, fontFamily: 'MaterialIcon'), color: green),
    Icon(IconData(workIcon, fontFamily: 'MaterialIcon'), color: purple),
    Icon(IconData(movieIcon, fontFamily: 'MaterialIcon'), color: blue),
    Icon(IconData(sportIcon, fontFamily: 'MaterialIcon'), color: yellow),
    Icon(IconData(travelIcon, fontFamily: 'MaterialIcon'), color: brown),
    Icon(IconData(shopIcon, fontFamily: 'MaterialIcon'), color: red),
  ];
}
