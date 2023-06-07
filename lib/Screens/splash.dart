import 'package:flutter/material.dart';
import 'package:freefire/Screens/home.dart';
import 'package:freefire/Screens/login.dart';
import 'package:freefire/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    userlogincheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
            'assets/images/Garena-Free-Fire-Logo-PNG-HD-Isolated.png'),
      ),
    );
  }

  Future<void> gotologin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return LoginScreen();
    }));
  }

  Future<void> userlogincheck() async {
    final sharedprefs = await SharedPreferences.getInstance();
    final usercheck = sharedprefs.getBool(savekey);

    if (usercheck == null || usercheck == false) {
      gotologin();
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return Homescreen();
      }));
    }
  }
}
