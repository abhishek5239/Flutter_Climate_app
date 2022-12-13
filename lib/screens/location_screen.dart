import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.location_weather});

  final location_weather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel get_weather_info = WeatherModel();

  int temperature;
  int condition;
  String city_name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //NOW AS LOCATION_WEATHER IS IN THE LOCATIONSCREEN OBJECT AND WE HAVE TO DISPLAY
    //THE WEATHER ON SCREEN AND TO DISPLAY IT WE WANT THE DATA INTO THE LOCATIONSCREENSTATE

    //SO WE WILL BE USING THE WIDGET.ANYTHING YOU WANT FROM THE LOCATIONSCREEN
    // print(widget.location_weather);

    update_weather(widget.location_weather);
  }

  //here we will be constructing one function in which we will be passign the
  //information related to the weather

  void update_weather(var weather_data) {
    setState(() {
      double temp = weather_data['main']['temp'];
      //AS WE NEEDED THE TEMPERATURE IN THE FORM OF THE INT SO WE CONVERTED IT INTO TOINT
      temperature = temp.toInt();
      condition = weather_data['weather'][0]['id'];
      city_name = weather_data['name'];
    });

    // print(city_name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var get_weather_data =
                          await get_weather_info.get_location_weather();
                      update_weather(get_weather_data);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final typed_name = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      print(typed_name);
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      get_weather_info.getWeatherIcon(condition),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  get_weather_info.getMessage(temperature),
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
