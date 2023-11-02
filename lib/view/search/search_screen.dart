import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_data.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';
import 'package:weather_app/utilis/app_colors.dart';
import 'package:weather_app/view/search/country_card.dart';
import 'package:weather_app/view/weather_detalies/weather_detailes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.mainColor, Colors.white],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    // controller: search,
                    onSubmitted: (value) async {
                      var getWeather = BlocProvider.of<GetWeatherData>(context);
                      getWeather.getWeather(cityName: value);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const WeatherDetailesScreen()),
                      );
                    },
                    decoration: InputDecoration(
                        label: const Text('Search Location'),
                        hintStyle: const TextStyle(fontSize: 22),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 35,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ),
              FutureBuilder(
                  future: WeatherService().getForecast(country: 'cairo'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // While the data is being fetched, display a loading indicator.
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      // If an error occurs, display an error message.
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData) {
                      // If there is no data, display a message indicating no data.
                      return const Text('No data available');
                    } else {
                      // If the data is available, display the weather forecast.
                      final weatherForecast = snapshot.data;
                      final maxTemp = weatherForecast![1].maxtemp_c;
                      final minTemp = weatherForecast[1].mintemp_c;
                      final temp = weatherForecast[1].temp;
                      final city = weatherForecast[1].city;
                      final date = weatherForecast[1].date;
                      final maxTemp2 = weatherForecast[0].maxtemp_c;
                      final minTemp2 = weatherForecast[0].mintemp_c;
                      final temp2 = weatherForecast[0].temp;
                      final city2 = weatherForecast[0].city;
                      final date2 = weatherForecast[0].date;

                      return Column(
                        children: [
                          CountryCard(
                              date: date!,
                              cityName: city!,
                              temp: temp!.toInt().toString(),
                              maxTemp: maxTemp!.toInt().toString(),
                              minTemp: minTemp!.toInt().toString()),
                          CountryCard(
                              date: date2!,
                              cityName: city2!,
                              temp: temp2!.toInt().toString(),
                              maxTemp: maxTemp2!.toInt().toString(),
                              minTemp: minTemp2!.toInt().toString()),
                        ],
                      );
                    }
                  }),
              const SizedBox(height: 61),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(150),
                        topRight: Radius.circular(150))),
                child: Image.asset('assets/splash.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
