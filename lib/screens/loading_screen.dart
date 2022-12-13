import 'dart:convert';
import 'package:clima/screens/location_screen.dart';

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import 'package:clima/services/weather.dart';

//used to takeout value from the key value pair
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    get_loc_info(); // print('START');
  }

  void get_loc_info() async {
    WeatherModel get_wea = WeatherModel();
    var get_weather = await get_wea.get_location_weather();

    //created an object of the class get_location from location.dart

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        location_weather: get_weather,
      );
    }));
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    // print('END');
  }

  @override
  Widget build(BuildContext context) {
    //

    // print('BUILDING STARTED');
    return Scaffold(
      body: Center(
        //its the package we import from the flutter and it's used for loader
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
