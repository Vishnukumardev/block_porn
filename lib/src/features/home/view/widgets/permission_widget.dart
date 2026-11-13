import 'package:block_porn/src/features/home/bloc/home_event.dart'
    show
        CheckPermissionEvent,
        RequestOverlayPermissionEvent,
        RequestBatteryPermissionEvent,
        RequestAccessibilityPermissionEvent;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/extension/app_theme_extension.dart';
import '../../bloc/home_bloc.dart';

Widget permissionWidget(BuildContext context) {
  return Container(
    width: context.width,
    decoration: BoxDecoration(
      color: context.theme.scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.2),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(2, 4),
        ),
      ],
    ),
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
    child: Column(
      spacing: 10.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Please enable these Permissions : ",
          style: context.textTheme.bodyLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Display over other apps"),
            InkWell(
              onTap: () {
                debugPrint("Clicked");
                context.read<HomeBloc>().add(RequestOverlayPermissionEvent());
              },
              child: Text(
                "Grant",
                style: context.textTheme.labelLarge?.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Battery Optimization"),
            InkWell(
              onTap: () {
                debugPrint("Clicked");
                context.read<HomeBloc>().add(RequestBatteryPermissionEvent());
              },
              child: Text(
                "Grant",
                style: context.textTheme.labelLarge?.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Accessibility Service"),
            InkWell(
              onTap: () {
                debugPrint("Clicked");

                context.read<HomeBloc>().add(
                  RequestAccessibilityPermissionEvent(),
                );
              },
              child: Text(
                "Grant",
                style: context.textTheme.labelLarge?.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
