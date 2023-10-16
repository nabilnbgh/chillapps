import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable(createToJson: false)
class Data {
  Data({required this.description, required this.amount});
  String description;
  int amount;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
