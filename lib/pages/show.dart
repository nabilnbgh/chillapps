import 'package:flutter/material.dart';
import '../model/data.dart';
import '../model/apiservice.dart';
import '../model/cardkeuangan.dart';

class ShowDataScreen extends StatefulWidget {
  const ShowDataScreen({super.key});

  @override
  State<ShowDataScreen> createState() => _ShowDataScreenState();
}

class _ShowDataScreenState extends State<ShowDataScreen> {
  List<Data> listData = [];
  APIService apiService = APIService();
  void setupData() async {
    await apiService.getData();
    setState(() {
      listData = apiService.items!;
    });
  }

  @override
  void initState() {
    super.initState();
    setupData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: listData
                .map((e) => CardKeuangan(
                      description: e.description,
                      amount: e.amount,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
