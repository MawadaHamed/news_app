import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  String imageName;
  Color color;

  CategoryModel({
    required this.color,
    required this.id,
    required this.imageName,
    required this.name,
  });
}
