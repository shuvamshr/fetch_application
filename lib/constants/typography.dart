import 'package:fetch_application/constants/colors.dart';
import 'package:flutter/material.dart';

// Typography Primitives

const TextStyle circularRegular = TextStyle(
  fontFamily: 'CircularBook',
);

const TextStyle circularProminent = TextStyle(
  fontFamily: 'CircularMedium',
);

// AppBar Token

TextStyle appBarTitleStyle =
    circularProminent.copyWith(fontSize: 16, color: appBarPrimaryForeground);
