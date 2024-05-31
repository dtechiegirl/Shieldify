import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shieldify/extension.dart';
import 'package:shieldify/src/pages/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 4), (){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context){
            return OnboardingPage();
          })
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: '#09122B'.toColor(),
        ),
        child: Center(
          child: Image(
            image: AssetImage("assets/images/loginlogo.png"),
          ),
        ),
      ),
    );
  }
}
