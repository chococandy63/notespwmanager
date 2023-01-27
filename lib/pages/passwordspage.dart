//import 'dart:html';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:notes/pages/addnote.dart';
import 'package:notes/pages/home.dart';
import 'package:notes/pages/viewnote.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class PasswordsPage extends StatefulWidget {
  const PasswordsPage({super.key});

  @override
  State<PasswordsPage> createState() => _PasswordsPageState();
}

class _PasswordsPageState extends State<PasswordsPage> {
  
bool passwordVisible= false;
  @override
  void initState() {
    passwordVisible = true;
    super.initState();
  }

  void addPassword() {
    showDialog(
      context: context,
      builder: (context) => Theme(
        data: ThemeData(),
        child: SimpleDialog(children: <Widget>[
          Form(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                validator: Validators.required('Type is required!'),
                decoration: InputDecoration(
                  labelText: "Select Type",
                  labelStyle: GoogleFonts.mansalva(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: TextFormField(
                  validator: Validators.compose([
      Validators.required('Username/email is required'),
      Validators.minLength(1, 'UserName/Email cannot be less than 1 characters'),
      Validators.maxLength(40, 'UserName/Email cannot be greater than 40 characters'),
    ]),
                  
                  
                  decoration: InputDecoration(
                    labelText: "Enter Username/email",
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
                  obscureText: passwordVisible,
                   validator: Validators.compose([
                    Validators.required('Password is required'),
                    Validators.patternString(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                        'Invalid Password')
                  ]),
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'Enter password',
                    
                    helperText: "Password must contain special\ncharacter",
                    helperStyle: const TextStyle(color: Colors.green),
                    labelStyle: GoogleFonts.mansalva(
                      fontSize: 20,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                          
                      onPressed: () {
                      
                        setState(
                          () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                 textInputAction: TextInputAction.done,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 181, 84, 116)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                          vertical: 10,
                        ))),
                    child: Text(
                      "ADD",
                      style: GoogleFonts.mansalva(
                        fontSize: 20,
                      ),
                    )),
              ),
            ],
          ))
        ]),
      ),
    );
  }
   @override
     Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          addPassword();
        },
        child: const Icon(
          Icons.add,
          color: Colors.pinkAccent,
        ),
      ),
    );
  }
}
