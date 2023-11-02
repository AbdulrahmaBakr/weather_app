import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/cubit/get_weather_data.dart';
import 'package:weather_app/cubit/states.dart';
import 'package:weather_app/utilis/app_colors.dart';
import 'package:weather_app/view/weather_detalies/weather_data_screen.dart';

class WeatherDetailesScreen extends StatelessWidget {
  const WeatherDetailesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //fifth integrate cubit
          BlocBuilder<GetWeatherData, WeatherState>(builder: ((context, state) {
        if (state is ShowWeatherState) {
          return WeatherData(
            weatherModel: state.weatherModel,
          );
        } else {
          return const Center(child: Text('chose country first'));
        }
      })),
    );
  }
}
