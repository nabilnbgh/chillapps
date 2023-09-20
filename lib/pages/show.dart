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
  bool isLoading = true;
  void setupData() async {
    await apiService.getData();
    setState(() {
      isLoading = false;
      listData = apiService.items!;
    });
  }

// CardKeuangan(
//                             description: e.description,
//                             amount: e.amount,
//                           )
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
          child: isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 6, 22, 236),
                  ),
                )
              : ListView.builder(
                  itemBuilder: ((context, index) {
                    return CardKeuangan(
                      description: listData[index].description,
                      amount: listData[index].amount,
                    );
                  }),
                  itemCount: listData.length,
                ),
        ),
      ),
    );
  }
}
