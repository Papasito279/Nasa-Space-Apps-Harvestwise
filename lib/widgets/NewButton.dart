import 'package:flutter/material.dart';

class NewButton extends StatefulWidget {
  const NewButton({super.key, required this.text, this.logo});
  final String text;
  final IconData? logo;

  @override
  State<NewButton> createState() => _NewButtonState();
}

class _NewButtonState extends State<NewButton> {
  @override
  Widget build(BuildContext context) {
    return widget.logo != null
        ? TextButton.icon(
            onPressed: () {},
            label: Text(widget.text),
            icon: Icon(widget.logo),
          )
        : Container(
            child: Text(widget.text),
          );
  }
}
