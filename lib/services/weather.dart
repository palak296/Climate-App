import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';

const appID = "96c1d443fdd0fbe9d24370ca1c886d26";
const openWeatherMapURL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?q=$cityName&appid=$appID&units=metric");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    LocationClass locationClass = LocationClass();
    await locationClass.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?lat=${locationClass.latitude}&lon=${locationClass.longitude}&appid=$appID&units=metric");

    var weatherData = await networkHelper.getData();
    return weatherData;
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