// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/utilis/app_colors.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.mainColor, Colors.white],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.city.toString(),
            style: GoogleFonts.asar(fontSize: 28),
          ),
          const SizedBox(height: 40),
          Text(
            weatherModel.date.toString(),
            style: GoogleFonts.asar(fontSize: 28),
          ),
          const SizedBox(height: 40),
          Text("${weatherModel.temp!.toInt().toString()}°",
              style: GoogleFonts.abel(fontSize: 35)),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'min temp ${weatherModel.mintemp_c!.toInt()}°',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(width: 20),
              const Text('/'),
              const SizedBox(width: 20),
              Text('max temp ${weatherModel.maxtemp_c!.toInt()}°',
                  style: const TextStyle(fontSize: 22)),
            ],
          ),
          const SizedBox(height: 15),
          Text('Condation : ${weatherModel.condation}',
              style: GoogleFonts.asar(fontSize: 28)),
          const SizedBox(height: 15),
          Image.asset(weatherModel.condation == 'Sunny'
              ? 'assets/sunny.png'
              : weatherModel.condation == 'Moderate rain'
                  ? 'assets/rainy.png'
                  : weatherModel.condation == 'Partly cloudy'
                      ? 'assets/cloudy.png'
                      : weatherModel.condation == 'Patchy rain possible'
                          ? 'assets/rainy.png'
                          : weatherModel.condation == 'Moderate snow'
                              ? 'assets/snow.png'
                              : ''),
        ],
      ),
    );
  }
}
