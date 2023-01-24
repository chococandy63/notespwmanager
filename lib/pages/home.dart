// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/pages/login.dart';
import 'package:notes/pages/notepage.dart';
import 'package:notes/pages/passwordspage.dart';
import 'package:notes/controller/googleauth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //creating a signout function to sign out from the current account
  void _signOut() {
    googleSignIn.signOut();
    print("User Signed Out");
    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 250),
              child: ElevatedButton(
                  onPressed: 
                    _signOut,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 167, 76, 106))),
                  child: const Text("Sign Out")),
            ),
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const NotesPage(),
                      ),
                    );
                  },
                  // ignore: sort_child_properties_last
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("NOTES",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mansalva(
                            fontSize: 20,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'assets/images/notes.jpg',
                        height: 36.0,
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 181, 84, 116)),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.symmetric(
                        vertical: 10,
                      )))),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PasswordsPage(),
                      ),
                    );
                  },
                  // ignore: sort_child_properties_last
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("PASSWORDS",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mansalva(
                            fontSize: 20,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'assets/images/password.png',
                        height: 36.0,
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 181, 84, 116)),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.symmetric(
                        vertical: 10,
                      )))),
            ),
          ],
        ),
      ),
    );
  }
}
