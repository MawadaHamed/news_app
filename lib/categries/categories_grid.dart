import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_theme.dart';
import 'package:flutter_application_1/categries/category_item.dart';
import 'package:flutter_application_1/models/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  CategoriesGrid({required this.onCategorySelected});
  void Function(CategoryModel) onCategorySelected;
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
          color: AppTheme.red,
          id: 'sports',
          imageName: 'sports',
          name: 'sports'),
      CategoryModel(
          color: Color(0xFF003E90),
          id: 'general',
          imageName: 'politics',
          name: 'Politics'),
      CategoryModel(
          color: Color(0xFFED1E79),
          id: 'health',
          imageName: 'health',
          name: 'Health'),
      CategoryModel(
          color: Color(0xFFCF7E48),
          id: 'business',
          imageName: 'bussines',
          name: 'Business'),
      CategoryModel(
          color: Color(0xFF4882CF),
          id: 'general',
          imageName: 'environment',
          name: 'Environment'),
      CategoryModel(
          color: Color(0xFFF2D352),
          id: 'science',
          imageName: 'science',
          name: 'Science')
    ];

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
              itemBuilder: (_, index) {
                CategoryModel category = categories[index];
                return GestureDetector(
                  onTap: () {
                    onCategorySelected(category);
                  },
                  child: CategoryItem(
                    category: category,
                    index: index,
                  ),
                );
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
