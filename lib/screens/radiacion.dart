import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_space_apps_final/widgets/appbarwidget.dart';
import 'dart:convert';
import 'package:nasa_space_apps_final/widgets/date.dart';

class RadiacionScreen extends StatefulWidget {
  const RadiacionScreen({super.key});

  @override
  State<RadiacionScreen> createState() => _RadiacionState();
}

class _RadiacionState extends State<RadiacionScreen> {
  late Future<Map<String, dynamic>> _data;
  final String city = 'Hermosillo,MX'; // Ciudad Obregón, Sonora, México

  @override
  void initState() {
    super.initState();
    _data = fetchSolarData();
  }

  final h = '&hourly=irradiance_w/m2';
  final Api = '96ffa7534e55465cc7b0f714d3a9ba01';
  final lat = 27.4827;
  final lon = -109.9304;

  Future<Map<String, dynamic>> fetchSolarData() async {
    final url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$Api&units=metric');
    final response = await http.get(url);
    print(url);

    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      throw Exception('Error al obtener los datos de irradiancia solar');
    }
  }

  @override
  Widget build(BuildContext context) {
    String solarIntensitySummary = '''
The average solar intensity is around 650-750 W/m², with periods of moderate solar intensity in the first five days (~450 W/m²) and then high levels starting on day 6.

Effects:
High intensity (red): Leads to dehydration, heat stress, and possible cellular damage to crops.
Moderate intensity (green): During the first five days, the lower intensity helps plants adapt to the conditions before the heat increases.

Recommendation:
- Maintain a frequent irrigation system to avoid dehydration.
- Monitor the field regularly, especially from day 6 onward, to address potential heat stress.
- Use shade nets during the hottest days to protect plants from excessive solar radiation.
''';
    print(_data);
    return Scaffold(
      appBar: const AppBarWidget(title: 'Solar Radiation Screen'),
      body: FutureBuilder(
          future: _data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text('This database has no data'),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  const DateWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 300,
                          width: 440,
                          child: Container(
                            child: Image.asset(
                              'assets/image3.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  solarIntensitySummary,
                                  style: const TextStyle(fontSize: 16),
                                  textAlign:
                                      TextAlign.left, // Aligns text to the left
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
