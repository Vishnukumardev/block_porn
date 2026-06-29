import 'package:auto_route/annotations.dart';
import 'package:block_porn/src/core/extension/app_theme_extension.dart';
import 'package:block_porn/src/core/helper/app_helper.dart';
import 'package:block_porn/src/core/styles/app_colors.dart';
import 'package:block_porn/src/core/utils/constants/local_constants.dart';
import 'package:flutter/material.dart';

import '../../../../shared/view/widgets/app_bar.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Container(
                height: 68,
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      spreadRadius: 1,                     // Extends the shadow
                      blurRadius: 5,                      // Blurs the shadow
                      offset: const Offset(2, 4),          // Moves shadow (x = right, y = down)
                    ),
                  ],

                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: context.theme.primaryColor,
                            // border: Border.all(color: AppColors.black)
                          ),
                          child: Center(child: Icon(Icons.shield_sharp)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Block Sites",
                            style: context.textTheme.headlineLarge,
                          ),
                          Text(
                            "Protection against sites",
                            style: context.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    Expanded(

                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:  15.0,horizontal: 5.0),
                        child: Container(
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.green),
                            color: AppColors.green.withAlpha(16)
                          ),
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                text: '', // Leave the root text empty
                                children: <InlineSpan>[
                                  WidgetSpan(
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: AppColors.green,
                                        borderRadius: BorderRadius.circular(
                                          100.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextSpan(text: ' manage', style: context.textTheme.labelMedium?.copyWith(color:AppColors.green,fontSize: 10.0))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text('DNS protection'),
              Container(
                height: 68,
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      spreadRadius: 1,                     // Extends the shadow
                      blurRadius: 5,                      // Blurs the shadow
                      offset: const Offset(2, 4),          // Moves shadow (x = right, y = down)
                    ),
                  ],

                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: context.theme.primaryColor,
                            // border: Border.all(color: AppColors.black)
                          ),
                          child: Center(child: Icon(Icons.cloud_download)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "DNS Shield",
                            style: context.textTheme.headlineLarge,
                          ),
                          Text(
                            "Block sites in Network Level",
                            style: context.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    Expanded(

                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:  15.0,horizontal: 5.0),
                        child: SizedBox(
                          height: 25,

                          child: Center(
                            child: Icon(Icons.arrow_forward_ios,size: 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text('Panic button'),
              Container(
                height: 68,
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      spreadRadius: 1,                     // Extends the shadow
                      blurRadius: 5,                      // Blurs the shadow
                      offset: const Offset(2, 4),          // Moves shadow (x = right, y = down)
                    ),
                  ],

                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: context.theme.primaryColor,
                            // border: Border.all(color: AppColors.black)
                          ),
                          child: Center(child: Icon(Icons.emergency)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Panic Button",
                            style: context.textTheme.headlineLarge,
                          ),
                          Text(
                            "Emergency Button for urges",
                            style: context.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    Expanded(

                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:  15.0,horizontal: 5.0),
                        child: SizedBox(
                          height: 25,

                          child: Center(
                            child: Icon(Icons.arrow_forward_ios,size: 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text('Accountability partner'),
              Container(
                height: 68,
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      spreadRadius: 1,                     // Extends the shadow
                      blurRadius: 5,                      // Blurs the shadow
                      offset: const Offset(2, 4),          // Moves shadow (x = right, y = down)
                    ),
                  ],

                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: context.theme.primaryColor,
                            // border: Border.all(color: AppColors.black)
                          ),
                          child: Center(child: Icon(Icons.people_alt_rounded)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Accountability Partner",
                            style: context.textTheme.headlineLarge,
                          ),
                          Text(
                            "Monitor and support each other",
                            style: context.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    Expanded(

                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:  15.0,horizontal: 5.0),
                        child: SizedBox(
                          height: 25,

                          child: Center(
                            child: Icon(Icons.arrow_forward_ios,size: 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text('Challenges'),
              Container(
                height: 68,
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      spreadRadius: 1,                     // Extends the shadow
                      blurRadius: 5,                      // Blurs the shadow
                      offset: const Offset(2, 4),          // Moves shadow (x = right, y = down)
                    ),
                  ],

                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: context.theme.primaryColor,
                            // border: Border.all(color: AppColors.black)
                          ),
                          child: Center(child: Icon(Icons.military_tech_outlined)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "NoFap quest",
                            style: context.textTheme.headlineLarge,
                          ),
                          Text(
                            "*count active quests",
                            style: context.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    Expanded(

                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:  15.0,horizontal: 5.0),
                        child: SizedBox(
                          height: 25,

                          child: Center(
                            child: Icon(Icons.arrow_forward_ios,size: 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text('Relapse tracker'),
              Container(
                height: 68,
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      spreadRadius: 1,                     // Extends the shadow
                      blurRadius: 5,                      // Blurs the shadow
                      offset: const Offset(2, 4),          // Moves shadow (x = right, y = down)
                    ),
                  ],

                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: context.theme.primaryColor,
                            // border: Border.all(color: AppColors.black)
                          ),
                          child: Center(child: Icon(Icons.track_changes_rounded)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Relapse Tracker",
                            style: context.textTheme.headlineLarge,
                          ),
                          Text(
                            "Track your progress",
                            style: context.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    Expanded(

                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:  15.0,horizontal: 5.0),
                        child: SizedBox(
                          height: 25,

                          child: Center(
                            child: Icon(Icons.arrow_forward_ios,size: 10,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
