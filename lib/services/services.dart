import 'dart:convert';

import 'package:citilink_app/services/weather_data.dart';
import 'package:http/http.dart' as http;

class WeatherServices{
  fetchWeather() async{
    final response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=-6.200000&lon=106.816666&appid=bea4d654cebafed2135a17e8e6260665'));
  

  try {
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      return WeatherData.fromJson(json);
    }
    else{
      throw Exception('Failed to load weather');
    }
  } catch(e){ 
      print(e.toString());
  }

  }
}

