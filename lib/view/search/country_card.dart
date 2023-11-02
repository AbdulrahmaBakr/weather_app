import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({
    super.key,
    required this.cityName,
    required this.maxTemp,
    required this.minTemp,
    required this.temp,
    required this.date,
  });
  final String cityName;
  final String maxTemp;
  final String minTemp;
  final String temp;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        tileColor: const Color.fromRGBO(77, 140, 186, 0.68),
        title: Row(
          children: [
            Text(
              cityName,
              style: const TextStyle(fontSize: 28, color: Colors.white),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              date,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              '$maxTemp°' '/' '$minTemp°',
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
          ],
        ),
        trailing: Column(
          children: [
            Text(
              '$temp°',
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
