import 'package:flutter/material.dart';
import 'package:smart_home_commander/views/screens/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Text(
            "Smart Home Commander",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
        elevation: 10,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 150.0),
              child: Image.asset(
                'assets/icon_android.png',
                width: 150,
                height: 150,
              ),
            ),
            const Text('S.H.C App',
                style: TextStyle(fontSize: 30, color: Colors.white)),
            const Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 15, color: Colors.white54),
            )
          ],
        ),
      ),
    );
  }
}
