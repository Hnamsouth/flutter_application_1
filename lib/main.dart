import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/nav/nav_screen.dart';
import 'package:flutter_application_1/provider/channel_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ChannelProvider()),
    ],
    child: const MyApp(),
  ));
  // runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppWidget();
}

class _MyAppWidget extends State<MyApp> {
  bool useMaterial3 = true;
  ThemeMode themeMode = ThemeMode.system;

  bool get useLightMode {
    switch (themeMode) {
      case ThemeMode.system:
        return View.of(context).platformDispatcher.platformBrightness ==
            Brightness.light;
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
    }
  }

  void handleBrightnessChanged(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey.shade900,
          // onprimary
          primary: const Color.fromARGB(169, 55, 55, 55),
          background: Colors.white60,
          // ···
          // surfaceVariant: const Color.fromARGB(255, 241, 51, 51),
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          background: const Color.fromARGB(169, 55, 55, 55),
          seedColor: Colors.white,
          // ontab
          secondary: Colors.white,
          // onprimary
          primary: Colors.white,
          // ···
          brightness: Brightness.dark,
        ),
      ),
      home: NavScreen(
          handleBrightnessChanged: handleBrightnessChanged,
          themeMode: themeMode),
    );
  }
}
