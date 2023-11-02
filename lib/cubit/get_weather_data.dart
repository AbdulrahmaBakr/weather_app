import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/states.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

//Second create cubit
class GetWeatherData extends Cubit<WeatherState> {
  GetWeatherData() : super(ErrorFoundState());
  //third create funcation
  getWeather({required String cityName}) async {
    try {
      WeatherModel weatherModel =
          await WeatherService().getWeatherData(country: cityName);
      emit(ShowWeatherState(weatherModel));
    } catch (e) {
      emit(ErrorFoundState());
    }
  }

 
}
