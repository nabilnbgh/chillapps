import 'package:flutter/material.dart';

class PostDataForm extends StatelessWidget {
  const PostDataForm({
    super.key,
    required this.label,
    required this.controller,
  });

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: Color.fromARGB(255, 31, 39, 90),
          ),
        ),
        floatingLabelStyle: const TextStyle(
            color: Color.fromARGB(255, 31, 39, 90),
            fontFamily: 'Barlow',
            fontWeight: FontWeight.w300),
        border: const OutlineInputBorder(),
        label: Text(label),
        hintText: label,
      ),
    );
  }
}
