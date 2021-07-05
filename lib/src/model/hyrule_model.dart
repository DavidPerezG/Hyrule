import 'package:flutter/material.dart';

class HyruleModel {
  String url;

  HyruleModel({
    this.url,
  });

  factory HyruleModel.fromJson(Map<String, dynamic> cat) {
    return HyruleModel(
      url: cat['url'],
    );
  }
}
