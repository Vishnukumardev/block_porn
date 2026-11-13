import 'package:auto_route/annotations.dart';
import 'package:block_porn/src/features/home/view/widgets/permission_widget.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/injections.dart';
import '../../../../shared/view/widgets/app_bar.dart';
import '../../bloc/home_bloc.dart';
import '../../bloc/home_event.dart';
import '../../bloc/home_state.dart';
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
                  BlocProvider(
                    create: (context) =>
                        HomeBloc()..add(CheckPermissionEvent()),

                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is PermissionLoading) {
                          return const CircularProgressIndicator();
                        }

                        if (state is PermissionEnabled) {
                          return Text("Enabled");
                        }
                        return permissionWidget(context);
                      },
                    ),
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
