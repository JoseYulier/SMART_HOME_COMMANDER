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
    Future.delayed(Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          "Smart Home Commander",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        elevation: 10,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Center(
          child: Column(
            children: [
              // Image.asset(
              // 'assets/logo_prueba.png',
              //width: 150,
              //height: 150,
              //),
              Text('S.H.C App',
                  style: TextStyle(fontSize: 40, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
