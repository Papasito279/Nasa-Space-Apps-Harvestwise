import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:nasa_space_apps_final/screens/radiacion.dart';
import 'package:nasa_space_apps_final/screens/plantas.dart';
import 'package:nasa_space_apps_final/screens/precipitacion.dart';
import 'package:nasa_space_apps_final/screens/suelo.dart';
import 'package:nasa_space_apps_final/widgets/NewButton.dart';
import 'package:intl/intl.dart';
import 'package:nasa_space_apps_final/widgets/appbarwidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm Insights Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        secondaryHeaderColor: Colors.brown,
        scaffoldBackgroundColor: const Color.fromARGB(255, 244, 241, 233),
      ),
      home: const FarmDashboard(),
    );
  }
}

class FarmDashboard extends StatefulWidget {
  const FarmDashboard({super.key});

  @override
  _FarmDashboardState createState() => _FarmDashboardState();
}

class _FarmDashboardState extends State<FarmDashboard> {
  final TextEditingController _plantController = TextEditingController();
  var _plantInfo;

  final Map<String, Map<String, String>> plantDatabase = {
    'tomato': {
      'sunlight': 'Full sun',
      'water': 'Moderate',
      'temperature': '20-30°C'
    },
    'basil': {
      'sunlight': 'Full sun',
      'water': 'Moderate',
      'temperature': '18-25°C'
    },
    'lavender': {
      'sunlight': 'Full sun',
      'water': 'Low',
      'temperature': '15-25°C'
    },
    'fern': {
      'sunlight': 'Partial shade',
      'water': 'High',
      'temperature': '18-24°C'
    },
  };

  void _searchPlant() {
    setState(() {
      _plantInfo = plantDatabase[_plantController.text.toLowerCase()];
    });
  }

  var date = DateTime.now();
  late String _formattedDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formattedDate = DateFormat('MM/dd/yyyy').format(date);
  }

  double lat = 10.0;
  double lon = 9.0;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final longitudeController = TextEditingController();
    final latitudeController = TextEditingController();

    void submitData() {
      if (formKey.currentState!.validate()) {
        double longitude = double.parse(longitudeController.text);
        double latitude = double.parse(latitudeController.text);
        setState(() {
          lat = latitude;
          lon = longitude;
        });

        // Display a snackbar with longitude and latitude values
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Longitude: $longitude, Latitude: $latitude'),
          ),
        );
        Navigator.pop(context); // Close the bottom sheet after submitting
      }
    }

    void showLocationBottomSheet() {
      showModalBottomSheet(
        context: context,
        isScrollControlled:
            true, // Makes the bottom sheet taller and scrollable
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom, // Adjust for keyboard
              left: 16,
              right: 16,
              top: 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Adjust height based on content
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onFieldSubmitted: (value) {
                            setState(() {
                              lon = double.parse(longitudeController.text);
                            });
                          },
                          controller: longitudeController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: const InputDecoration(
                            labelText: 'Longitude',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter longitude';
                            }
                            final longitude = double.tryParse(value);
                            if (longitude == null) {
                              return 'Enter a valid number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          onFieldSubmitted: (value) {
                            setState(() {
                              lat = double.parse(latitudeController.text);
                            });
                          },
                          controller: latitudeController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: const InputDecoration(
                            labelText: 'Latitude',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter latitude';
                            }
                            final latitude = double.tryParse(value);
                            if (latitude == null) {
                              return 'Enter a valid number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                          onPressed: submitData,
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    void navRadiacion() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RadiacionScreen(),
        ),
      );
    }

    void navPrecipitacion() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PrecipitacionScreen(),
        ),
      );
    }

    void navSuelo() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SueloScreen(),
        ),
      );
    }

    void navPlantas() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PlantasScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: const AppBarWidget(title: 'Main  Page'),
      body: Row(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const NewButton(
                text: 'Profile',
                logo: Icons.person,
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: showLocationBottomSheet,
                child: const NewButton(text: 'Location'),
              ),
              const Row(
                children: [
                  Text('Lat'),
                  SizedBox(width: 10),
                  Text('Lon'),
                ],
              ),
              Row(
                children: [
                  Text(
                    lat.toString(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    lon.toString(),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const NewButton(text: 'My Fields'),
              const SizedBox(
                height: 30,
              ),
              const NewButton(text: 'My Plants'),
              const Expanded(child: SizedBox()),
              GestureDetector(
                onTap: () {}, // Trigger the onPressed callback
                child: const CircleAvatar(
                  radius: 50, // Adjust the radius to change the size
                  backgroundColor:
                      Colors.blue, // Background color of the button
                  child: Text(
                    'About us',
                    style: TextStyle(color: Colors.blue), // Text color
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // Align the widgets at the start (top) of the column
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Text(_formattedDate),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 200,
                    height: 200,
                    padding: const EdgeInsets.all(0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Image.asset(
                      'assets/image5.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      GestureDetector(
                        onTap: navRadiacion,
                        child: _buildInfoCard(
                            'Solar Radiation', '20°C', Icons.sunny),
                      ),
                      GestureDetector(
                        onTap: navPrecipitacion,
                        child: _buildInfoCard('Water', '65mm', Icons.opacity),
                      ),
                      GestureDetector(
                        onTap: navSuelo,
                        child:
                            _buildInfoCard('Ground', 'Low', Icons.thermostat),
                      ),
                      GestureDetector(
                        onTap: navPlantas,
                        child: _buildInfoCard('Plants', 'Good', Icons.spa),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Other widgets like the Card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Weather Trends',
                              style: Theme.of(context).textTheme.headlineLarge),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 200,
                            child: BarChart(
                              BarChartData(
                                alignment: BarChartAlignment.spaceAround,
                                maxY: 100,
                                barTouchData: BarTouchData(enabled: false),
                                titlesData: FlTitlesData(
                                  show: true,
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      getTitlesWidget:
                                          (double value, TitleMeta meta) {
                                        const style = TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        );

                                        Widget text;
                                        switch (value.toInt()) {
                                          case 0:
                                            text =
                                                const Text('Jan', style: style);
                                            break;
                                          case 1:
                                            text =
                                                const Text('Feb', style: style);
                                            break;
                                          case 2:
                                            text =
                                                const Text('Mar', style: style);
                                            break;
                                          case 3:
                                            text =
                                                const Text('Apr', style: style);
                                            break;
                                          case 4:
                                            text =
                                                const Text('May', style: style);
                                            break;
                                          case 5:
                                            text =
                                                const Text('Jun', style: style);
                                            break;
                                          default:
                                            text = const Text('');
                                            break;
                                        }
                                        return SideTitleWidget(
                                          axisSide: meta.axisSide,
                                          child: text,
                                        );
                                      },
                                      reservedSize: 42,
                                    ),
                                  ),
                                ),
                                borderData: FlBorderData(show: false),
                                barGroups: [
                                  _buildBarGroup(0, 49, 7),
                                  _buildBarGroup(1, 55, 9),
                                  _buildBarGroup(2, 60, 12),
                                  _buildBarGroup(3, 70, 16),
                                  _buildBarGroup(4, 80, 20),
                                  _buildBarGroup(5, 75, 24),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Plant care guide
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Plant Care Guide',
                              style: Theme.of(context).textTheme.headlineLarge),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _plantController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter plant name',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: _searchPlant,
                                child: const Text('Search'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          if (_plantInfo != null &&
                              _plantInfo != 'Plant not found')
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sunlight: ${_plantInfo!['sunlight']}',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                const SizedBox(height: 5),
                                Text('Water: ${_plantInfo!['water']}',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                const SizedBox(height: 5),
                                Text(
                                    'Temperature: ${_plantInfo!['temperature']}',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                              ],
                            )
                          else
                            Text('Plant not found',
                                style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const SizedBox(
                      height: 100,
                      width: 20,
                      child: Card(
                        color: Colors.white,
                        elevation: 4,
                        child: Center(
                          child: Text(
                            'Redirect to the forum',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 40, color: Colors.green),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 5),
            Text(value,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _buildBarGroup(int x, double rainfall, double temperature) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: rainfall,
          color: Colors.lightBlue,
          width: 15,
        ),
        BarChartRodData(
          toY: temperature,
          color: Colors.orange,
          width: 15,
        ),
      ],
    );
  }
}
