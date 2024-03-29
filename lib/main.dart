import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:towner/controller/firebase_controller.dart';
import 'package:towner/controller/service_controller.dart';
import 'package:towner/firebase_options.dart';
import 'package:towner/screens/add_image_screen.dart';
import 'package:towner/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ServiceController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FirebaseController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Towner Solutions',
        home: const HomeScreen(),
        routes: {
          '/addscreen': (context) => AddScreen(),
          '/home': (context) => const HomeScreen()
        },
      ),
    );
  }
}
