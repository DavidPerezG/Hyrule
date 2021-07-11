import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyrule_application/src/model/hyrule_model.dart';
import 'package:hyrule_application/src/provider/hyrule_provider.dart';

class HyruleState extends GetxController {
  List<HyruleModel> herramientas = [];
  int _paginado = 0;
  final _hyruleProvider = HyruleProvider();

  Future<void> obtenerHerramientas() async {
    final herra = await _hyruleProvider.obtenerHyrule(_paginado);
    herramientas.addAll(herra);
    _paginado += 20;
    update();
  }
}
