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

// AppBody Token

TextStyle appBodyNoteStyle =
    circularRegular.copyWith(fontSize: 16, color: appBodySecondaryForeground);

// Filter Token

TextStyle filterTabTitleActiveStyle = circularRegular.copyWith(
    fontSize: 14, color: filterTabPrimaryForegroundActive);
TextStyle filterTabTitleInactiveStyle = circularRegular.copyWith(
    fontSize: 14, color: filterTabPrimaryForegroundInactive);

// Card Token

TextStyle cardListTitleStyle =
    circularProminent.copyWith(fontSize: 16, color: cardPrimaryForeground);
TextStyle cardTitleStyle =
    circularProminent.copyWith(fontSize: 16, color: cardPrimaryForeground);
TextStyle cardSubheadingStyle =
    circularRegular.copyWith(fontSize: 14, color: cardSecondaryForeground);
TextStyle cardFootnoteStyle =
    circularRegular.copyWith(fontSize: 12, color: cardSecondaryForeground);
