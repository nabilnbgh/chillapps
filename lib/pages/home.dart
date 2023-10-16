import 'package:chillapps/model/keuanganpost.dart';
import 'package:chillapps/shared/constant.dart';
import 'package:chillapps/shared/postdataform.dart';
import 'package:chillapps/shared/postdropdown.dart';
import 'package:flutter/material.dart';

import '../model/apiservice.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<KeuanganPost> listData = [];
  APIService apiService = APIService();
  final TextEditingController descController =
      TextEditingController(text: "Makan Siang");
  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController =
      TextEditingController(text: "Makan");
  final TextEditingController sourceController =
      TextEditingController(text: "Pengeluaran");

  String? source;
  int postSource = 0;
  void postData() async {
    KeuanganPost? data = createDatatoPost();
    String status = "Error Cek Amount";
    if (data != null) {
      status = await apiService.postData(data);
    }
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(status),
        ),
      );
    });
  }

  KeuanganPost? createDatatoPost() {
    return amountController.text != ""
        ? KeuanganPost(
            desc: descController.text,
            amount: int.parse(amountController.text) * 1000,
            category: categoryController.text,
            source: postSource == 0 ? sourceController.text : source)
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Input Data',
          style: TextStyle(
            fontFamily: 'Barlow',
            fontWeight: FontWeight.w300,
            fontSize: 24.0,
            color: Color.fromARGB(255, 31, 39, 90),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: Color.fromARGB(255, 31, 39, 90),
                  width: 1,
                ),
              ),
              margin: const EdgeInsets.all(16.0),
              elevation: 20.0,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    PostDataForm(
                      controller: descController,
                      label: 'Description',
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    PostDataForm(
                      controller: amountController,
                      label: 'Amount',
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    PostDropDownForm(
                      controller: categoryController,
                      label: 'Category',
                      options: categoryOptions,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    PostDropDownForm(
                      controller: sourceController,
                      label: 'Source',
                      options: sourceOptions,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Divider(
                      height: 2,
                      color: Colors.black,
                    ),
                    RadioListTile(
                      title: const Text("Pengeluaran"),
                      value: "Pengeluaran",
                      groupValue: source,
                      onChanged: (value) {
                        setState(() {
                          source = value.toString();
                          postSource = 1;
                          postData();
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text("Uang Saku Keluar"),
                      value: "Uang Saku Keluar",
                      groupValue: source,
                      onChanged: (value) {
                        setState(() {
                          source = value.toString();
                          postSource = 1;
                          postData();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton.icon(
              style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size.fromHeight(48.0)),
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromARGB(255, 48, 79, 255),
                ),
              ),
              label: const Text(
                "Post Data",
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              icon: const Icon(Icons.upload),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Sending Data"),
                ));
                postSource = 0;
                postData();
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ElevatedButton.icon(
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size.fromHeight(48.0)),
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 48, 79, 255),
                  ),
                ),
                label: const Text(
                  "Show Data",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
                icon: const Icon(Icons.show_chart_rounded),
                onPressed: () {
                  Navigator.pushNamed(context, '/show');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
