import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle =
    TextStyle(fontSize: 30.0, fontFamily: 'Spartan MB', color: Colors.white);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const ktextfield_style = InputDecoration(
  //means we want to filled the color
  filled: true,
  //add the fill color
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide.none),
);
