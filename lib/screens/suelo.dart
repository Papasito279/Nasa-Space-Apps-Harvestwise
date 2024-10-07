import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nasa_space_apps_final/widgets/appbarwidget.dart';
import 'package:nasa_space_apps_final/widgets/date.dart';

class SueloScreen extends StatefulWidget {
  const SueloScreen({super.key});

  @override
  State<SueloScreen> createState() => _SueloState();
}

class _SueloState extends State<SueloScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Ground Screen'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DateWidget(),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Image.asset(
                    'assets/image2.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 100,
                  child: const Text(
                    'This chart represents the maximum and minimum\n temperatures in Ciudad Obregón throughout the year. High\n temperatures during summer can stress plants, leading to\n dehydration and stunted growth due to the excessive heat.',
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Image.asset(
                    'assets/image7.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                const SizedBox(width: 20,),
                Container(
                  child: const Text('This chart represents the estimated distribution of pests\n per hectare in different crops. High pest populations in\n crops like maize and sorghum can severely impact plant\n health and yields if not controlled'),
                ),
                const SizedBox(width: 20,),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
