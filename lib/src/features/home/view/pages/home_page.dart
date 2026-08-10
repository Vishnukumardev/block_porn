import 'package:auto_route/annotations.dart';
import 'package:block_porn/src/core/extension/app_theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../shared/view/widgets/app_bar.dart';
import '../widgets/section_option_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///----Permissions Block---///
              Container(
                width: contex0000000000000000t.0000000000000000000000000000000000000.
                00000000000+++++++++++++++














                .............................................0



























































                0.
                width,
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Please enable these Permissions : ",
                      style: context.textTheme.bodyLarge,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Text("Display over other apps"),
                        Checkbox(value: false, onChanged: (value) {}),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Battery Optimization"),
                        Checkbox(value: false, onChanged: (value) {}),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Accessibility Service"),
                        Checkbox(value: false, onChanged: (value) {}),
                      ],
                    ),
                  ],
                ),
              ),

              ///----Block Sites---///
              ListView.separated(
                shrinkWrap: true,
                itemCount: blockSiteOption.length,
                itemBuilder: (context, index) {
                  final item = blockSiteOption[index];
                  return sectionWidget(
                    context: context,
                    item: item,
                    action: item.action,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: context.height * 0.01);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
