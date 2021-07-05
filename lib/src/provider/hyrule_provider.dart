import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hyrule_application/src/model/hyrule_model.dart';

class HyruleProvider {
  final String _url = 'https://botw-compendium.herokuapp.com/api/v2.';
  final http = Dio();

  Future obtenerHyrule() async {
    final response = await http.get(_url);
    final responseData = response.data;
    return HyruleModel.fromJson(responseData);
  }
}
