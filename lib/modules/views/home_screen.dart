import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routine/modules/views/habit_screen.dart';
import 'package:routine/modules/views/task%20screens/task_screen.dart';
import 'package:routine/modules/views/time_table_screen.dart';
import 'package:routine/modules/views/today_screen.dart';

import '../../core/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _screens = [
    const TodayScreen(),
    const HabitScreen(),
    const TaskScreen(),
    const TimeTableScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey, // Assign the GlobalKey here
      endDrawer: CustomDrawer(),
      body: Stack(
        children: [
          _screens[_selectedIndex],
          Positioned(
            top: 54,
            right: 0,
            child: IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: theme.colorScheme.onBackground,
                size: 24,
              ),
              onPressed: () {
                _scaffoldKey.currentState
                    ?.openEndDrawer(); // Use the GlobalKey to open the drawer
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 64.0, // Adjust the height here to match the desired look
        child: BottomAppBar(
          color: theme.colorScheme.surface, // Background color
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.today,
                    color: _selectedIndex == 0
                        ? theme.colorScheme.onSurface
                        : theme.colorScheme.onSecondary.withOpacity(0.5)),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: Icon(Icons.workspace_premium,
                    color: _selectedIndex == 1
                        ? theme.colorScheme.onSurface
                        : theme.colorScheme.onSecondary.withOpacity(0.5)),
                onPressed: () => _onItemTapped(1),
              ),
              IconButton(
                icon: Icon(Icons.library_add_check_rounded,
                    color: _selectedIndex == 2
                        ? theme.colorScheme.onSurface
                        : theme.colorScheme.onSecondary.withOpacity(0.5)),
                onPressed: () => _onItemTapped(2),
              ),
              IconButton(
                icon: Icon(Icons.free_cancellation,
                    color: _selectedIndex == 3
                        ? theme.colorScheme.onSurface
                        : theme.colorScheme.onSecondary.withOpacity(0.5)),
                onPressed: () => _onItemTapped(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
