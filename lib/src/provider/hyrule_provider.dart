import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hyrule_application/src/model/hyrule_model.dart';

class HyruleProvider {
  final String _url = 'https://botw-compendium.herokuapp.com/api/v2.';
  final http = Dio();

  Future<List<HyruleModel>> obtenerHyrule() async {
    final response = await http.get(_url);
    List<dynamic> responseData = response.data['data']['equipment'];
    return responseData
        .map((equipamiento) => HyruleModel.fromJson(equipamiento))
        .toList();
  }
}
