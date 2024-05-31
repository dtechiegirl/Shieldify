import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shieldify/firebase_options.dart';
import 'package:shieldify/src/home_page.dart';
import 'package:shieldify/src/pages/Splash_Screen.dart';
import 'package:shieldify/src/pages/map_direction.dart';
import 'package:shieldify/src/pages/onboarding_screen.dart';
import 'package:shieldify/widgets/locator.dart';
//
//   void main() async{
//    WidgetsFlutterBinding.ensureInitialized();
//    await  Firebase.initializeApp();
//   runApp(const MyApp());
// }
void main() async{
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: MyHomePage(),
      home: SplashScreen(),
    );
  }
}

