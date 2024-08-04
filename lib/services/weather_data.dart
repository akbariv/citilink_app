class WeatherData {
  final Temperature temperature;

  WeatherData({required this.temperature});
  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temperature: Temperature.fromJson(json['main']['temp']),
    );
  }
}

class Temperature {
  final double current;

  Temperature({required this.current});

  factory Temperature.fromJson(dynamic json) {
    return Temperature(
      current: (json - 273.15), // Kelvin to Celsius
    );
  }
}
