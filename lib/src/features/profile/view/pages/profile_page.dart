import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../main.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appNotifier = Provider.of<AppNotifier>(context);
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: appNotifier.isDarkTheme,
            onChanged: (bool value) {
              appNotifier.updateTheme(value);
            },
          ),
        ],
      )
    );
  }
}
