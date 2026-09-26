import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/app_theme_extension.dart';
import '../../../../core/utils/injections.dart';
import '../../../../shared/view/widgets/app_bar.dart';
import '../../bloc/home_bloc.dart';
import '../../bloc/home_event.dart';
import '../../bloc/home_state.dart';
import '../../home_injections.dart';
import '../widgets/section_option_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<HomeBloc>(),
      child: SafeArea(
        child: Scaffold(
          appBar: customAppBar(context),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.0,
                children: [
                  ///----Permissions Block---///
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 15.0,
                        ),
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
                                    context.read<HomeBloc>().add(
                                      RequestOverlayPermissionEvent(),
                                    );
                                  },
                                  child: Text(
                                    "Grant",
                                    style: context.textTheme.labelLarge
                                        ?.copyWith(
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
                                    context.read<HomeBloc>().add(
                                      RequestBatteryPermissionEvent(),
                                    );
                                  },
                                  child: Text(
                                    "Grant",
                                    style: context.textTheme.labelLarge
                                        ?.copyWith(
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
                                    style: context.textTheme.labelLarge
                                        ?.copyWith(
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
                    },
                  ),

                  ///----Block Sites---///
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: blockSiteOption.length,
                    itemBuilder: (context, index) {
                      final isFirst = index == 0;
                      final isLast = index == blockSiteOption.length - 1;
                      final item = blockSiteOption[index];
                      return sectionWidget(
                        isFirst: isFirst,
                        isLast: isLast,
                        context: context,
                        item: item,
                        action: item.action,
                      );
                    },
                  ),

                  ///---Loophole Protection---///
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: panicOption.length,
                    itemBuilder: (context, index) {
                      final isFirst = index == 0;
                      final isLast = index == panicOption.length - 1;
                      final item = panicOption[index];
                      return sectionWidget(
                        isFirst: isFirst,
                        isLast: isLast,
                        context: context,
                        item: item,
                        action: item.action,
                      );
                    },
                  ),

                  ///---Challenges Protection---///
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: challengesOption.length,
                    itemBuilder: (context, index) {
                      final isFirst = index == 0;
                      final isLast = index == challengesOption.length - 1;
                      final item = challengesOption[index];
                      return sectionWidget(
                        isFirst: isFirst,
                        isLast: isLast,
                        context: context,
                        item: item,
                        action: item.action,
                      );
                    },
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
