import 'package:flutter/material.dart';

class HyruleModel {
  int attack;
  String defense;
  String description;
  int id;
  String image;
  String name;

  HyruleModel(
      {this.attack,
      this.defense,
      this.description,
      this.id,
      this.image,
      this.name});

  factory HyruleModel.fromJson(Map<String, dynamic> equipamiento) {
    return HyruleModel(
        attack: equipamiento['attack'],
        defense: equipamiento['defense'],
        description: equipamiento['description'],
        id: equipamiento['id'],
        image: equipamiento['image'],
        name: equipamiento['name']);
  }
}
