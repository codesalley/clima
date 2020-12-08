import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

String api = 'https://api.openweathermap.org/data/2.5/weather?';
String apiKey = 'd99b973d20d539514e32d6e226a97250';

class WeatherModel {
  Future getWeaderData() async {
    Location location = Location();
    await location.getLocation();
    GetNetworkData getNetworkData = await GetNetworkData(
        '${api}lat=${location.latitude}&lon=${location.longtitude}&appid=${apiKey}&units=metric');

    var data = await getNetworkData.getWeather();

    return data;
  }

  Future<dynamic> getCityWeather(String cityname) async {
    GetNetworkData getNetworkData = await GetNetworkData(
        '${api}q=${cityname}&appid=${apiKey}&units=metric');

    var data = await getNetworkData.getWeather();
    return data;
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
