import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavigationBar extends StatefulWidget {
  final ValueChanged<int>? onTabChange;
  const NavigationBar({Key? key, this.onTabChange}) : super(key: key);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.blue.shade900,
            gap: 8,
            padding: EdgeInsets.all(8),
            tabMargin: EdgeInsets.all(16),
            onTabChange: (index) {
              widget.onTabChange?.call(index);
            },
            tabs: [
              GButton(
                  icon: Icons.home,
                  text: 'Lists'
              ),
              GButton(
                icon: Icons.group,
                text: 'Group',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        )
    );
  }
}