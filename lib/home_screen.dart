import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_theme.dart';
import 'package:flutter_application_1/categries/catedories_detalis.dart';
import 'package:flutter_application_1/categries/categories_grid.dart';
import 'package:flutter_application_1/drawer/home_drawer.dart';
import 'package:flutter_application_1/models/category_model.dart';
import 'package:flutter_application_1/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppTheme.white,
            image: DecorationImage(
                image: AssetImage('assets/images/pattern.png'))),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              selectedCategory != null
                  ? selectedCategory!.name
                  : selectedDrawerItem == DrawerItem.categories
                      ? 'News App'
                      : 'Settings',
            ),
          ),
          drawer: HomeDrawer(onItemSelected: onDrawerItemSelected),
          body: selectedCategory != null
              ? CategoryDetalis(selectedCategory!.id)
              : selectedDrawerItem == DrawerItem.categories
                  ? CategoriesGrid(
                      onCategorySelected: onCategorySelected,
                    )
                  : SettingsTab(),
        ));
  }

  void onDrawerItemSelected(DrawerItem item) {
    selectedDrawerItem = item;
    selectedCategory = null;
    setState(() {});
    Navigator.of(context).pop();
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
