import 'package:block_porn/src/core/utils/app_assets.dart';
import 'package:block_porn/src/core/utils/constants/local_constants.dart';
import 'package:flutter/material.dart';
import '../../../core/extension/app_theme_extension.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    automaticallyImplyLeading: false,
    backgroundColor: context.appBarTheme.backgroundColor,
    surfaceTintColor: context.appBarTheme.surfaceTintColor,
    leading: Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: Image.asset(AppAssets.appIcon),
    ),
    title: Text('No Fap'),
    toolbarHeight: 50,
    scrolledUnderElevation: elevation,
    actions: [
      IconButton(
        icon: Icon(Icons.notifications), onPressed: () {  },
      ),
    ],
  );
}