import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hyrule_application/src/model/hyrule_model.dart';
import 'package:get/get.dart';

class HyruleProvider {
  final String _url = 'https://botw-compendium.herokuapp.com/api/v2';
  final http = Dio();

  Future<List<HyruleModel>> obtenerHyrule(int pagina) async {
    final response = await http.get(_url, queryParameters: {'offset': pagina});
    List<dynamic> responseData = response.data['data']['equipment'];
    return responseData
        .map((equipamiento) => HyruleModel.fromJson(equipamiento))
        .toList();
  }
}
