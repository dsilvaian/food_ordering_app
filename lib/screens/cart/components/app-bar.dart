import 'package:flutter/material.dart';

AppBar cartAppBar({BuildContext context}) {
  return AppBar(
    centerTitle: true,
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => {Navigator.of(context).pop()},
    ),
    title: Text(
      "Food Cart",
      textAlign: TextAlign.center,
    ),
  );
}
