// ignore_for_file: public_member_api_docs, sort_constructors_first
//First thing make states
import 'package:weather_app/model/weather_model.dart';

class WeatherState {}

class ShowWeatherState extends WeatherState {
  final WeatherModel weatherModel;
  ShowWeatherState(this.weatherModel);
}

class ErrorFoundState extends WeatherState {}
 