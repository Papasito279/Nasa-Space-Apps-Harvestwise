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
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Image.asset(
                    'assets/image6.png',
                    fit: BoxFit.fill,
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
          Row(
            children: [
              const SizedBox(width: 20,),
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: Text(
                      'This chart represents the relative humidity across the months in Ciudad Obregón. Low humidity during the warmer months can dry out plants and limit their water retention, causing growth issues and dehydration.'),
                ),
              ),
              const SizedBox(width: 20,)
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
