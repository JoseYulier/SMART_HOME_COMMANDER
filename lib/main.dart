import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_commander/providers/turbine_provider.dart';
import 'package:smart_home_commander/views/screens/splash_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TurbineProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Home Commander',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}
