import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_theme.dart';
import 'package:flutter_application_1/categries/categories_grid.dart';
import 'package:flutter_application_1/drawer/home_drawer.dart';
import 'package:flutter_application_1/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem selectedDrawerItem = DrawerItem.categories;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppTheme.white,
            image: DecorationImage(
                image: AssetImage('assets/images/pattern.png'))),
        child: Scaffold(
          appBar: AppBar(
            title: Text('News App'),
          ),
          drawer: HomeDrawer(onItemSelected: onDrawerItemSelected),
          body: selectedDrawerItem == DrawerItem.categories
              ? CategoriesGrid()
              : SettingsTab(),
        ));
  }

  void onDrawerItemSelected(DrawerItem item) {
    selectedDrawerItem = item;
    setState(() {});
    Navigator.of(context).pop();
  }
}
