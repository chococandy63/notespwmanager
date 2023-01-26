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

class PasswordsPage extends StatefulWidget {
  const PasswordsPage({super.key});

  @override
  State<PasswordsPage> createState() => _PasswordsPageState();
}

class _PasswordsPageState extends State<PasswordsPage> {
  void addPassword() {
    showDialog(
      context: context,
      builder: (context) => Theme(
        data: ThemeData(),
        child: SimpleDialog(title: const Text("ADD DATA"), children: <Widget>[
          Form(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Select Type",
                 
            
                ),
               
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                  labelText: "Enter Username/email",
                 
            
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
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: OutlinedButton(onPressed: () {}, child: Text("ADD")),
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
      appBar: AppBar(
        title: Text(
          'PASSWORDS',
          style: GoogleFonts.mansalva(
            fontSize: 32,
          ),
        ),
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(5, 5, 5, 5),
      ),
    );
  }
}
