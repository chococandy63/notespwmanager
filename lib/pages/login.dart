import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/controller/googleauth.dart';
import 'package:notes/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Center(
              child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0, bottom: 100),
            child: Text(
              'Write Notes \n & \nManage Passwords',
              style: GoogleFonts.mansalva(
                fontSize: 32,
              ),
            ),
          ),
          Text(
            "Login",
            style: GoogleFonts.mansalva(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter email id',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: ElevatedButton(
                //calling a fn
                //
                onPressed: () {
                  signInWithGoogle(context);
                },
        
                // ignore: sort_child_properties_last
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Continue With Google",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mansalva(
                          fontSize: 20,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'assets/images/google-login-icon.png',
                      height: 36.0,
                    ),
                  ],
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 181, 84, 116)),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      vertical: 10,
                    )))),
          ),
              ]),
            ),
        ));
  }
}
