import 'package:fixatease_worker/register_details.dart';
import 'package:fixatease_worker/register_screen.dart';
import 'package:fixatease_worker/pick_location.dart';
import 'package:fixatease_worker/services/database.dart';
import 'package:fixatease_worker/show_workers.dart';
import 'package:fixatease_worker/splash_screen.dart';
import 'package:flutter/material.dart';
import '/splash_screen.dart';
import '/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'fixatease_worker',
      options: const FirebaseOptions(
          appId: '1:662928174936:android:18f7b2fb2b5e17a3cdbf2d',
          apiKey: 'AIzaSyAmElocNXCY8i-kI1c4Vj3HDU8VxJlIO9U',
          messagingSenderId: '662928174936',
          projectId: 'fixatease'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fix@ease',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/": (context) => splash_screen(), //Database(),
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/pick_location": (context) => PickLocation(),
        '/register_details': (context) => RegisterDetails(), //LocationMain()
        '/show_workers': (context) => ShowWorkers(),
      },
    );
  }
}
