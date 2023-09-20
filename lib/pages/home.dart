import 'package:chillapps/model/keuanganpost.dart';
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
      TextEditingController(text: "Pengeluaran");
  final TextEditingController sourceController =
      TextEditingController(text: "Makan Siang");

  void postData() async {
    KeuanganPost data = createDatatoPost();
    String status = await apiService.postData(data);
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(status),
        ),
      );
    });
  }

  KeuanganPost createDatatoPost() {
    return KeuanganPost(
        desc: descController.text,
        amount: int.parse(amountController.text),
        category: categoryController.text,
        source: sourceController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16.0),
              child: const Text(
                'Input Data',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0,
                  color: Color.fromARGB(255, 32, 33, 36),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1,
                ),
              ),
              margin: const EdgeInsets.all(16.0),
              elevation: 20.0,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: descController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Description'),
                        hintText: 'Description',
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Amount",
                        label: Text('Amount'),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      controller: categoryController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Category",
                        label: Text('Category'),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      controller: sourceController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Source",
                        label: Text('Source'),
                      ),
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
