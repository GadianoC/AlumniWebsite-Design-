import 'package:flutter/material.dart';
import 'package:spider/pages/homepage.dart';
import 'package:spider/pages/profile.dart';
import 'package:spider/pages/settings.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

const _navBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home_rounded),
    label: 'Homepage',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_outline_rounded),
    activeIcon: Icon(Icons.person_rounded),
    label: 'Profile',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings_outlined),
    activeIcon: Icon(Icons.settings),
    label: 'Settings',
  ),
];

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  //Scrolling through pages
  final pages = [
    HomePage(),
    Profile(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isSmallScreen = width < 600;
    final bool isLargeScreen = width > 800;

    return Scaffold(
      bottomNavigationBar: isSmallScreen
          ? BottomNavigationBar(
              items: _navBarItems,
              currentIndex: _selectedIndex,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            )
          : null,
      body: Row(
        children: <Widget>[
          if (!isSmallScreen)
            NavigationRail(
              //leading start
              leading: Center(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.abc,
                        size: 60,
                      ),
                      Column(
                        children: [
                          const Row(
                            children: [
                              const Text(
                                'Our Lady of Perpetual Succor College',
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              const Text(
                                'Alumni Tracking System',
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //leading end
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              extended: isLargeScreen,
              destinations: _navBarItems
                  .map((item) => NavigationRailDestination(
                      icon: item.icon,
                      selectedIcon: item.activeIcon,
                      label: Text(
                        item.label!,
                      )))
                  .toList(),
            ),
          const VerticalDivider(thickness: 1, width: 1),

          // Main Content of the Navigation Bar/Rail (📌📌📌📌📌)
          Expanded(child: pages[_selectedIndex])
        ],
      ),
    );
  }
}
