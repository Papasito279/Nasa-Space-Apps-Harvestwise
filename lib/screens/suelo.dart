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
                  child: Image.asset('assets/image2.png', fit: BoxFit.fill,),
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
                
                
                Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Image.asset('assets/image7.png', fit:  BoxFit.fill,),
                ),
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
