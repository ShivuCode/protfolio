import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:velocity_x/velocity_x.dart';

import 'components/login.dart';

Future<void> main() async {
  // if (kIsWeb) {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp(
  //       options: const FirebaseOptions(
  //     apiKey: "AIzaSyB1X9wfi14-I5EB8l7hunOIg4EKsSfx-CU",
  //     projectId: "protfolio-18cd0",
  //     messagingSenderId: "239302820975",
  //     appId: "1:239302820975:web:6d0327e2a48919f5c7f99a",
  //   ));
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: Vx.purple800,
          primaryColor: Vx.purple900,
          useMaterial3: true,
          fontFamily: "custom"),
      home: const Login(),
    );
  }
}
