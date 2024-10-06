import 'package:darkmode_and_lightmode/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SETTINGS'),
      ),
      body: Consumer<UIProvider>(
        builder: (context, UIProvider notifier, child) {
          return Column(
          children: [
            ListTile(
              leading: notifier.isDark ? const Icon(Icons.dark_mode) : const Icon(Icons.light_mode),
              //title: const Text(''),
              trailing: Switch(
                value: notifier.isDark,
                onChanged: (value) => notifier.changeTheme(),
              )
            ),

            // some text
            const Text('lorem lorem lorem')
          ],
        );
        },
      ),
    );
  }
}