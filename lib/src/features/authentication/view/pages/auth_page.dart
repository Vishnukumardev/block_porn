import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/extension/app_theme_extension.dart';
import '../../../../core/router/custom_app_router.gr.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Authentication Page')),
          SizedBox(height: context.height * .1),
          ElevatedButton(
            onPressed: () => AutoRouter.of(context).replaceAll([const MainRoute()]),
            child: Text('Go to Main'),
          ),
        ],
      ),
    );
  }
}
