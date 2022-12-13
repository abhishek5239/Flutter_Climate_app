import 'package:http/http.dart' as http;
//used to takeout value from the key value pair
import 'dart:convert';

class Networkhelper {
  Networkhelper(this.url_api);

  final String url_api;
  // final Map<String, double> map;

  Future getData() async {
    //copied . might be the method how to import the url

    // var endpoint = Uri.parse(
    //     'https://api.openweathermap.org/data/3.0/onecall?lat=$latitude&lon=$longitute&exclude=hourly,daily&appid=$api_key');
    //
    // var response = await http.get(endpoint);

    http.Response response = await http.get(Uri.parse(url_api));

    // Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
    //     {"lat": '$latitude', "lon": "$longitute", "appid": '$api_key'});
    //
    // //await is used here just to wait till it fetches the value
    // //Response is also an object of the package
    // http.Response response = await http.get(url);
// if state code is 200 means everything is fine but if it's between 400 to 600
    //means it's an error
    if (response.statusCode == 200) {
      //body means the output value which we are providing

      String data = response.body;
      // print(data);

      //now cord is the key in that key we are havinf lon as another key and then
      //we would ge the value which is the value with the help of jasondecode

      // var longi = jsonDecode(data)['coord']['lon'];
      // print(longi);

      var decode_data = jsonDecode(data);
      return decode_data;
    } else {
      print(response.statusCode);
    }
  }
}
