import 'package:darkmode_and_lightmode/pages/home_page.dart';
import 'package:darkmode_and_lightmode/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UIProvider()..init(),
      child: Consumer(builder: (context, UIProvider notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'lIGHT AND DARK THEME',
          // by default theme setting, you can also set to light or dark theme
          themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
          // custom theme for light mode and dark mode
          darkTheme: notifier.isDark ? notifier.darkTheme : notifier.lightTheme,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
        );
      }),
    );
  }
}
