import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/core/constants.dart';
import 'package:test_app/core/notifier.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('images/yeah.png'),
            radius: 60,
          ),
          SizedBox(height: kdouble10),
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Music'),
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('About'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Contact'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleDarkMode,
        child: ValueListenableBuilder(
          valueListenable: isDarkNotifier,
          builder: (context, isDark, child) {
            if (isDark) {
              return const Icon(Icons.dark_mode);
            } else {
              return const Icon(Icons.light_mode);
            }
          },
        ),
      ),
    );
  }

  void toggleDarkMode() {
    isDarkNotifier.value = !isDarkNotifier.value;

    // Save the dark mode state to SharedPreferences
    saveDarkModeState(isDarkNotifier.value);
  }

  void saveDarkModeState(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDarkMode);
  }
}
