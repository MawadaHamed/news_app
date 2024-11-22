import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_theme.dart';
import 'package:flutter_application_1/categries/category_item.dart';
import 'package:flutter_application_1/models/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  CategoriesGrid({required this.onCategorySelected});
  void Function(CategoryModel) onCategorySelected;
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = List.generate(
        6,
        (index) => CategoryModel(
            color: AppTheme.red,
            id: '$index',
            imageName: 'sports',
            name: 'sports'));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'pick your category OF interest',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppTheme.navy),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemBuilder: (_, index) => CategoryItem(
                category: categories[index],
                index: index,
              ),
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
