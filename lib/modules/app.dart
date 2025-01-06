import 'package:flutter/material.dart';
import 'package:sql_playground/common/domain/entities/nav_item.dart';
import 'package:sql_playground/common/presentation/widget/atoms/bottom_bar_navigation.dart';
import 'package:sql_playground/common/presentation/widget/atoms/side_bar_navigation.dart';
import 'package:sql_playground/modules/erd/presentation/erd_view.dart';
import 'package:sql_playground/modules/playground/presentation/playground_view.dart';
import 'package:sql_playground/ui/colors.dart';
import 'package:sql_playground/ui/window_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int activeIndex = 0;
  void updateActiveIndex(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = WindowScreen().calculateScreenWidthSize(context);
    final items = <NavItem>[
      NavItem(
        selectedIcon: Icons.code,
        icon: Icons.code_outlined,
        label: 'Playground',
        screen: const PlaygroundView(),
      ),
      NavItem(
        selectedIcon: Icons.dataset,
        icon: Icons.dataset_outlined,
        label: 'ERD',
        screen: const ErdView(),
      ),
      NavItem(
        selectedIcon: Icons.storage_outlined,
        icon: Icons.storage,
        label: 'Databases',
        screen: const Placeholder(),
      ),
    ];

    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: screenSize == ScreenWidthSize.COMPACT
          ? BottomBarNavigation(
              items: items,
              activeIndex: activeIndex,
              updateActiveIndex: updateActiveIndex)
          : null,
      body: SafeArea(
        child: Row(
          children: [
            if (screenSize != ScreenWidthSize.COMPACT)
              SideBarNavigation(
                  items: items,
                  activeIndex: activeIndex,
                  updateActiveIndex: updateActiveIndex),
            if (screenSize != ScreenWidthSize.COMPACT)
              const VerticalDivider(
                  thickness: 1, width: 1, color: AppColors.grey),
            Expanded(
              child: items[activeIndex].screen,
            )
          ],
        ),
      ),
    );
  }
}
