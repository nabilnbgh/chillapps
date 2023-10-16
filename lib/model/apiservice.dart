import 'dart:convert';

import 'package:chillapps/model/apiresponse.dart';
import 'package:chillapps/model/data.dart';
import 'package:chillapps/model/keuanganpost.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

// A class to get and retrieve "Keuangan" from API

class APIService {
  String url = 'https://assorted-plausible-citrus.glitch.me/';
  final Dio dio = Dio();
  APIResponse apiResponse = APIResponse(status: "", message: "");

  Future<List<Data>?> getData() async {
    try {
      final response = await dio.getUri(Uri.parse(
          'https://script.google.com/macros/s/AKfycbz6Y0-lHdWftlnSoF6bbWXIFHEnaZTUBEah8_LGSP2vIE9aOf27t4pjiH8xLVPTipGTrg/exec?code=1'));
      apiResponse = APIResponse.fromJson(response.data);
      if (apiResponse.status == "Success") {
        return apiResponse.items;
      } else {
        throw Exception("items is null");
      }
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future<String> postData(KeuanganPost data) async {
    print(data);
    String responseBody = jsonEncode(data);
    print(responseBody);
    http.Response res = await http.post(
        Uri.parse(
            'https://script.google.com/macros/s/AKfycbz6Y0-lHdWftlnSoF6bbWXIFHEnaZTUBEah8_LGSP2vIE9aOf27t4pjiH8xLVPTipGTrg/exec'),
        body: responseBody,
        headers: {"Content-Type": "application/json"});
    if (res.statusCode == 200) {
      apiResponse.status = "Success";
    } else {
      if (res.statusCode == 302) {
        apiResponse.status = "Success but Moved Temporary";
      } else {
        apiResponse.status = "Something Went Wrong";
      }
    }
    return "${res.statusCode} ${apiResponse.status}";
  }
}
