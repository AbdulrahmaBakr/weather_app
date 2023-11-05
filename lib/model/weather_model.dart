// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class WeatherModel {
  final String? city;
  final String? condation;

  final String? date;
  final double? mintemp_c;
  final double? maxtemp_c;
  final double? temp;

  WeatherModel(
      {this.temp,
      required this.city,
      required this.condation,
      required this.date,
      required this.mintemp_c,
      required this.maxtemp_c});

  factory WeatherModel.jsonData(json, i) {
    return WeatherModel(
      temp: json['forecast']['forecastday'][i]['day']['avgtemp_c'],
      city: json['location']['name'],
      condation: json['current']['condition']['text'],
      date: json['forecast']['forecastday'][i]['date'],
      mintemp_c: json['forecast']['forecastday'][i]['day']['mintemp_c'],
      maxtemp_c: json['forecast']['forecastday'][i]['day']['maxtemp_c'],
    );
  }
}
