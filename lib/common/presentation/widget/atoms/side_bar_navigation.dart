import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sql_playground/common/domain/entities/nav_item.dart';
import 'package:sql_playground/ui/colors.dart';

class SideBarNavigation extends StatelessWidget {
  final List<NavItem> items;
  final int activeIndex;
  final Function(int) updateActiveIndex;
  const SideBarNavigation({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.updateActiveIndex,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      backgroundColor: AppColors.darkGrey,
      selectedIndex: activeIndex,
      onDestinationSelected: updateActiveIndex,
      children: [
        ...items.map((item) => NavigationDrawerDestination(
              icon: Icon(item.icon),
              label: Text(item.label),
            )),
      ],
    );
  }
}
