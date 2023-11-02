import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeatherData({required String country}) async {
    Response response = await Dio().get(
        'https://api.weatherapi.com/v1/forecast.json?key=dbcdc412997e4c92a14211612231204&q=$country&days=10');

    WeatherModel weatherModel = WeatherModel.jsonData(response.data, 0);

    return weatherModel;
  }

  Future<List<WeatherModel>> getForecast({required String country}) async {
    List<WeatherModel> weatherList = [];
    Response response = await Dio().get(
        'https://api.weatherapi.com/v1/forecast.json?key=dbcdc412997e4c92a14211612231204&q=$country&days=10');

    for (int i = 0; i < 3; i++) {
      WeatherModel weatherModel = WeatherModel.jsonData(response.data, i);
      weatherList.add(weatherModel);
    }

    return weatherList;
  }
}
