import 'package:flutter/material.dart';
import 'package:sql_playground/common/domain/entities/nav_item.dart';

class BottomBarNavigation extends StatelessWidget {
  final List<NavItem> items;
  final int activeIndex;
  final Function(int) updateActiveIndex;
  const BottomBarNavigation({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.updateActiveIndex,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: updateActiveIndex,
      selectedIndex: activeIndex,
      destinations: <Widget>[
        ...items.map((item) => NavigationDestination(
              selectedIcon: Icon(item.selectedIcon),
              icon: Icon(item.icon),
              label: item.label,
            ))
      ],
    );
  }
}
