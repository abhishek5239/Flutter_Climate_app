import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const api_key = '6aa2f0ada89ef4d4f1829aab8687ca06';
const open_weather_map_url = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> get_location_weather() async {
    Get_location location = Get_location();
    await location.get_current_location();

    Networkhelper network_helper = Networkhelper(
        '$open_weather_map_url?lat=${location.get_latitude}&lon=${location.get_longitude}&appid=$api_key&units=metric');
    // getData();
    //   var weatherdata = await network_helper.getData();
    //   var temprature = weatherdata['main']['temp'];
    //
    //   var condition = weatherdata['weather'][0]['id'];
    //
    //   var city_name = weatherdata['name'];
    //
    //   print(city_name);
    //   print(condition);
    //   print(temprature);
    // }

    var get_wea = await network_helper.getData();

    return get_wea;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
