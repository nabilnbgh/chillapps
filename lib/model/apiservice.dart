import 'dart:convert';

import 'package:chillapps/model/data.dart';
import 'package:chillapps/model/keuanganpost.dart';
import 'package:http/http.dart';

// A class to get and retrieve "Keuangan" from API

class APIService {
  List<Data>? items;
  String? status;
  String? message;

  Future<void> getData() async {
    Response response = await get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbxvZfr0PwID9B0Vte98h4-_GHl8BTb_VHU9pZKBQn5uLO_cAbVeutlacpla78doZxTeTw/exec?code=1'));
    Map data = jsonDecode(response.body);
    status = data['status'];
    message = data['message'];
    if (status == "Success") {
      List tempList = data['items'] as List;
      items = [];
      for (var element in tempList) {
        items!.add(Data(
            description: element['description'], amount: element['amount']));
      }
    }
  }

  Future<String> postData(KeuanganPost data) async {
    String responseBody = jsonEncode(data);
    Response res = await post(
        Uri.parse(
            'https://script.google.com/macros/s/AKfycbxvZfr0PwID9B0Vte98h4-_GHl8BTb_VHU9pZKBQn5uLO_cAbVeutlacpla78doZxTeTw/exec'),
        body: responseBody,
        headers: {"Content-Type": "application/json"});
    if (res.statusCode == 200) {
      status = "Success";
    } else {
      if (res.statusCode == 302) {
        status = "Success but Moved Temporary";
      } else {
        status = "Something Went Wrong";
      }
    }
    return "${res.statusCode} $status";
  }
}
