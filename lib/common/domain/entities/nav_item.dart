import 'package:flutter/material.dart';

class NavItem {
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final Widget screen;

  NavItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.screen,
  });
}
