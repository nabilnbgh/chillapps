import 'package:chillapps/model/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apiresponse.g.dart';

@JsonSerializable(createToJson: false)
class APIResponse {
  String status;
  String message;
  List<Data>? items;
  APIResponse({required this.status, required this.message, this.items});
  factory APIResponse.fromJson(Map<String, dynamic> json) =>
      _$APIResponseFromJson(json);
}
