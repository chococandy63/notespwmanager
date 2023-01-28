import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/controller/googleauth.dart';
import 'package:notes/pages/home.dart';
import 'package:email_validator/email_validator.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final User? user = _auth.currentUser;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _success;
  late String _userEmail;

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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) => EmailValidator.validate(value!)
                      ? null
                      : "Please enter a valid email",
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'Enter email id',
                    labelStyle: GoogleFonts.mansalva(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'Enter password',
                    labelStyle: GoogleFonts.mansalva(
                      fontSize: 20,
                    ),
                  ),
                  validator: Validators.compose([
                    Validators.required('Password is required'),
                    Validators.patternString(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                        'Invalid Password')
                  ]),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 10),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          {
                            _register();
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 181, 84, 116)),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Register",
                              style: GoogleFonts.mansalva(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.login,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          {
                            _login();
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 181, 84, 116)),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "LogIn",
                              style: GoogleFonts.mansalva(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.login,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              SnackBar(
                // ignore: unnecessary_null_comparison
                content: Text( _success==null?'':(
                         _success?'Successfully registered'+_userEmail
                        : 'Registration failed')),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                          vertical: 10,
                        )))),
              ),
            ]),
          ),
        ));
  }

  void _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email!;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }

  void _login() {}
}
