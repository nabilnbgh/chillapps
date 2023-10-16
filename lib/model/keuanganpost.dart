import 'package:json_annotation/json_annotation.dart';

part 'keuanganpost.g.dart';

@JsonSerializable(createFactory: false)
class KeuanganPost {
  //constructor
  KeuanganPost({this.desc, this.amount, this.category, this.source});
  //property
  String? desc;
  int? amount;
  String? category;
  String? source;

  Map<String, dynamic> toJson() => _$KeuanganPostToJson(this);
}
