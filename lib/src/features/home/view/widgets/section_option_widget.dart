import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/app_theme_extension.dart';
import '../../../../core/styles/app_colors.dart';
import 'block_sites_modal_widget.dart';

class SectionOptionItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final int action;
  final String? route;

  SectionOptionItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.action,
    this.route,
  });
}

Widget sectionWidget({
  required BuildContext context,
  required SectionOptionItem item,
  required int action,
  required BorderRadius radius,
}) {
  return Container(
    decoration: BoxDecoration(
      color: context.theme.scaffoldBackgroundColor,
      borderRadius: radius,
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
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: context.theme.primaryColor,
          ),
          child: Icon(item.icon),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.title,
                style: context.textTheme.headlineLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                item.subtitle,
                style: context.textTheme.labelMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            if (item.action == 0) {
              AutoRouter.of(context).pushPath(item.route!);
            } else if (item.action == 1) {
              showModalBottomSheet(
                backgroundColor: context.theme.scaffoldBackgroundColor,
                context: context,
                builder: (BuildContext context) {
                  return blockSitesModalWidget();
                },
              );
            }
          },
          child: _buildActionTrailingWidget(context, item.action),
        ),
      ],
    ),
  );
}

Widget _buildActionTrailingWidget(BuildContext context, int action) {
  switch (action) {
    case 1:
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.green),
          color: AppColors.green.withAlpha(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                color: AppColors.green,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              'manage',
              style: context.textTheme.labelMedium?.copyWith(
                color: AppColors.green,
                fontSize: 10.0,
              ),
            ),
          ],
        ),
      );
    case 2:
      return Switch(value: false, onChanged: (value) {});
    default:
      return const SizedBox(
        height: 40,
        width: 24,
        child: Center(child: Icon(Icons.arrow_forward_ios, size: 12)),
      );
  }
}

final List<SectionOptionItem> blockSiteOption = [
  SectionOptionItem(
    title: "Block Sites",
    subtitle: "Protection Against Sites",
    icon: Icons.shield_sharp,
    action: 1,
  ),
  SectionOptionItem(
    title: "DNS Shield",
    subtitle: "Block sites in Network Level",
    icon: Icons.cloud_download,
    action: 0,
    route: '/dns',
  ),
];

// final List<SectionOptionItem> accountPartnerOptions = [
//   SectionOptionItem(
//     title: "Accountability Partner",
//     subtitle: "Monitor and support each other",
//     icon: Icons.people_alt_rounded,
//     action: 0,
//   ),
// ];
//
// final List<SectionOptionItem> challengesOption = [
//   SectionOptionItem(
//     title: "NoFap quest",
//     subtitle: "*count active quests",
//     icon: Icons.military_tech_outlined,
//     action: 0,
//   ),
// ];

final List<SectionOptionItem> panicOption = [
  SectionOptionItem(
    title: "Panic Button",
    subtitle: "Emergency Button for urges",
    icon: Icons.emergency,
    action: 0,
    route: '/panic',
  ),
  SectionOptionItem(
    title: "Block Removal",
    subtitle: "Blocking the app uninstall ",
    icon: Icons.app_blocking,
    action: 2,
  ),
];

// final List<SectionOptionItem> trackerOption = [
//   SectionOptionItem(
//     title: "Relapse Tracker",
//     subtitle: "Track your progress",
//     icon: Icons.track_changes_rounded,
//     action: 0,
//   ),
// ];
