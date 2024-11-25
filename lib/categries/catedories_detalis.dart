import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/source.dart';
import 'package:flutter_application_1/tabs/sources_tab.dart';

class CategoryDetalis extends StatefulWidget {
  CategoryDetalis(this.categoryId);
  String categoryId;

  @override
  State<CategoryDetalis> createState() => _CategoryDetalisState();
}

class _CategoryDetalisState extends State<CategoryDetalis> {
  List<Source> sources =
      List.generate(10, (index) => Source(id: '$index', name: 'Source $index'));
  @override
  Widget build(BuildContext context) {
    return SourceTab(sources);
  }
}
