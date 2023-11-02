import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_data.dart';
import 'package:weather_app/view/search/country_card.dart';
import 'package:weather_app/view/search/search_screen.dart';
import 'package:weather_app/view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //forth  provide cubit
    return BlocProvider(
      create: (context) => GetWeatherData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const SearchScreen(),
      ),
    );
  }
}
