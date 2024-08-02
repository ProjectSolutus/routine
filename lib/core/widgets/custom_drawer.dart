import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        color: theme.colorScheme.background, // Background color
        child: Stack(
          children: <Widget>[
            ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  color: theme.colorScheme.primary,
                  padding: const EdgeInsets.only(left: 16, right: 16,top: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Custom Drawer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.black),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate to home page
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.black),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate to settings page
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info, color: Colors.black),
                  title: const Text('About'),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate to about page
                  },
                ),
                // Add more items here
              ],
            ),
          ],
        ),
      ),
    );
  }
}
