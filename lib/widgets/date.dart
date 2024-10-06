import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatefulWidget {
  const DateWidget({super.key});

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  @override
  DateTime date = DateTime.now();
  String _formattedDateFunc(DateTime datef) {
      return DateFormat('MM/dd/yyyy').format(datef);
    }

    void _update(up) {
      setState(() {
        if (up) {
          date = date.add(const Duration(days: 1));
        } else {
          date = date.subtract(const Duration(days: 1));
        }
      });
    }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'Date',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _update(false);
              },
              child: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset(
                  'assets/image1.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              child: Text(
                _formattedDateFunc(date),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: (){
                _update(true);
              },
              child: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset(
                  'assets/image0.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
