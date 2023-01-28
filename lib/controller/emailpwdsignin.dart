import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';


class _RegisterEmailSection extends StatefulWidget {
  final String title = 'Registration';
  @override
  State<StatefulWidget> createState() => 
      _RegisterEmailSectionState();
}
class _RegisterEmailSectionState extends State<_RegisterEmailSection> {
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
late bool _success;
late String _userEmail;

@override
  Widget build(BuildContext context) {
    //TODO UI content here
  }
}