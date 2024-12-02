import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({required this.onItemSelected});

  void Function(DrawerItem) onItemSelected;

  @override
  Widget build(BuildContext context) {
    TextStyle? titlelargeStyle =
        Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24);
    Size screenSize = MediaQuery.sizeOf(context);
    return SizedBox(
      width: screenSize.width * .7,
      child: Column(
        children: [
          Container(
            height: screenSize.height * .2,
            width: double.infinity,
            color: AppTheme.primary,
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context)!.newapp,
              style: titlelargeStyle,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.only(
                top: 12,
                start: 12,
              ),
              color: AppTheme.white,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.categories),
                    child: Row(
                      children: [
                        Icon(Icons.menu),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          AppLocalizations.of(context)!.categories,
                          style:
                              titlelargeStyle?.copyWith(color: AppTheme.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.settings),
                    child: Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          AppLocalizations.of(context)!.settings,
                          style:
                              titlelargeStyle?.copyWith(color: AppTheme.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum DrawerItem {
  categories,
  settings,
}
