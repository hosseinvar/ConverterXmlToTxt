import 'package:flutter/material.dart';

import 'colors.dart';

final theme = ThemeData(
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: mainColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'ProximaNova',
  textTheme: const TextTheme(
    headline2: TextStyle(
      color: darkGray,
      fontWeight: FontWeight.w700,
      fontSize: 24,
    ),
    subtitle1: TextStyle(
      color: darkGray,
      height: 1.5,
      fontWeight: FontWeight.w700,
      fontSize: 18,
    ),
    subtitle2: TextStyle(
      color: darkGray,
      height: 1.5,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    overline: TextStyle(
      color: darkGray,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    caption: TextStyle(
      color: darkGray,
      fontWeight: FontWeight.w400,
      fontSize: 10,
    ),
    bodyText1: TextStyle(
      color: darkGray,
      height: 1.5,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    bodyText2: TextStyle(
      color: darkGray,
      height: 1.5,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
  ),
);

BoxDecoration cardBoxDecoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [buttonBoxShadow()]);
}

BoxShadow buttonBoxShadow() {
  return BoxShadow(
    offset: const Offset(0.0, 6.0),
    blurRadius: 20.0,
    spreadRadius: 0,
    color: Colors.black.withOpacity(.1),
  );
}

AppBar appBar(BuildContext context, String title, bool isBack) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: Theme.of(context).textTheme.headline2,
    ),
    elevation: 5,
    titleSpacing: 0,
    shadowColor: lightGray,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10))),
    automaticallyImplyLeading: true,
    leading: isBack ? IconButton(
      onPressed: () {
        Navigator.of(context).pop(false);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: darkGray,
      ),
      padding: EdgeInsets.zero,
      iconSize: 25,
    ):const SizedBox(),
  );
}
