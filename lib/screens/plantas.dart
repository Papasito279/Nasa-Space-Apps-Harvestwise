import 'package:flutter/material.dart';
import 'package:nasa_space_apps_final/widgets/appbarwidget.dart';
import 'package:nasa_space_apps_final/widgets/date.dart';

class PlantasScreen extends StatefulWidget {
  const PlantasScreen({super.key});

  @override
  State<PlantasScreen> createState() => _PlantasScreenState();
}

class _PlantasScreenState extends State<PlantasScreen> {
  final _datos = ['Grape', 'Corn', 'Orange Pepper', 'Walnut'];
  final vegetables = {
    'images': [
      'carrot.png',
      'tomato.png',
      'broccoli.png',
      'cucumber.png',
      'pepper.png',
      'orange.png',
      'watermelon.png',
    ],
    'name': [
      'Carrot',
      'Tomato',
      'Broccoli',
      'Cucumber',
      'Pepper',
      'Orange',
      'Watermelon',
    ],
  };

  var selectedVegetable = {'images': [], 'name': []};
  @override
  Widget build(BuildContext context) {
    void showVegetableBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 250,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Select a Vegetable or Fruit',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: vegetables['name']!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(vegetables['name']![index]),
                        onTap: () {
                          // Update selected vegetable and close the bottom sheet
                          setState(() {
                            selectedVegetable['name']!
                                .add(vegetables['name']![index]);
                            selectedVegetable['images']!
                                .add(vegetables['images']![index]);
                            vegetables['name']!.removeAt(index);
                            vegetables['images']!.removeAt(index);
                          });
                          Navigator.pop(context); // Close the bottom sheet
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: const AppBarWidget(title: 'Plants Screen'),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const DateWidget(),
                const SizedBox(height: 20),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: selectedVegetable['name']!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/${selectedVegetable['images']![index]}',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Name container
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              selectedVegetable['name']![index],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 300,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Center(
                              child: Text(
                                'Plants that are in season',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 40),
                            ..._datos.map(
                              (item) {
                                return Column(
                                  children: [
                                    Text(
                                      item,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Positioned Button at the bottom right
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: showVegetableBottomSheet,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button's background color
                shape: const CircleBorder(), // Rounded shape
                padding: const EdgeInsets.all(24), // Padding inside the button
              ),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
