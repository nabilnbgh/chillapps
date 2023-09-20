import 'package:flutter/material.dart';

class CardKeuangan extends StatelessWidget {
  const CardKeuangan(
      {super.key, required this.description, required this.amount});

  final String description;
  final int amount;

  String formatToIDR(int value) {
    // Convert the integer to a string
    String stringValue = value.toString();

    // If the value is less than 100, return it as is
    if (stringValue.length <= 2) {
      return stringValue;
    }
    // Initialize an empty result string
    String result = "";

    // Add thousands separator (.) from right to left
    int counter = 0;
    for (int i = stringValue.length - 1; i >= 0; i--) {
      result = stringValue[i] + result;
      counter++;
      if (counter == 3 && i > 0) {
        result = ".$result";
        counter = 0;
      }
    }
    return "Rp $result";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: const Color.fromARGB(255, 47, 56, 85),
      child: ListTile(
        enabled: false,
        onTap: () {},
        title: Text(
          description,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          formatToIDR(amount),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
