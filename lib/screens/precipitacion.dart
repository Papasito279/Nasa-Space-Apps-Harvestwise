import 'package:flutter/material.dart';
import 'package:nasa_space_apps_final/widgets/appbarwidget.dart';
import 'package:nasa_space_apps_final/widgets/date.dart';

class PrecipitacionScreen extends StatefulWidget {
  const PrecipitacionScreen({super.key});

  @override
  State<PrecipitacionScreen> createState() => _PrecipitacionScreenState();
}

class _PrecipitacionScreenState extends State<PrecipitacionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Water Screen'),
      body: Column(
        children: [
          const DateWidget(),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  child: Image.asset(
                    'assets/image6.png',
                    fit: BoxFit.fill,
                  ),
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            child: Text('Relative Humidity in the city of Obregon'),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
            ),
            width: 200,
            height: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          
        ],
      ),
    );
  }
}
