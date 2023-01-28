
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notes/pages/login.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotesPasswordManager',
      theme: ThemeData.dark().copyWith(
        primaryColor:Color.fromARGB(255, 167, 76, 106), 

      ),
      home: const LoginPage(),   );
  }
}

