// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIResponse _$APIResponseFromJson(Map<String, dynamic> json) => APIResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
