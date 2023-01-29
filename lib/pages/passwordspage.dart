//this shows the password page and adds the passwords to the firebase db

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
//import 'package:flutter_string_encryption/flutter_string_encryption.dart';



FirebaseFirestore firestore = FirebaseFirestore.instance;

class PasswordsPage extends StatefulWidget {
  const PasswordsPage({super.key});

  @override
  State<PasswordsPage> createState() => _PasswordsPageState();
}

class _PasswordsPageState extends State<PasswordsPage> {
  // TextEditingController pass = TextEditingController();
  // var key = "null";
  // late String encryptedS,decryptedS;
  // var password = "null";
  // late PlatformStringCryptor cryptor;


  late String type = '';
  late String user_email = '';
  late String pwd = '';
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('passwords');

  bool passwordVisible = false;
  @override
  void initState() {
    passwordVisible = true;
    super.initState();
  }

  void addPassword() async {
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
                onChanged: (val) {
                  type = val;
                },
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
                  onChanged: (val) {
                    user_email = val;
                  },
                  validator: Validators.compose([
                    Validators.required('Username/email is required'),
                    Validators.minLength(
                        1, 'UserName/Email cannot be less than 1 characters'),
                    Validators.maxLength(40,
                        'UserName/Email cannot be greater than 40 characters'),
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
                  //controller: pass,
                  onChanged: (val) {
                    pwd = val;
                  },
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
                    onPressed: add,
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

  void add() async {
    var data = {
      'type': type,
      'username/email': user_email,
      'password': pwd,
    };

    ref.add(data);
    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: () async {
            addPassword();
          },
          child: const Icon(
            Icons.add,
            color: Colors.pinkAccent,
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: ref.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    Color bg = Color.fromARGB(255, 121, 156, 215);
                    Map? data = snapshot.data?.docs[index].data() as Map?;
                    return Card(
                      color: bg,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          children: <Widget>[
                            const Icon(
                              color: Color.fromARGB(255, 8, 30, 47),
                              Icons.lock,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data!['type']}",
                                    style: GoogleFonts.mansalva(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "${data['username/email']}",
                                    style: GoogleFonts.mansalva(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "${data['password']}",
                                    style: GoogleFonts.mansalva(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: Text("loading..."),
              );
            }
          },
        ));
  }

  // void Encrypt() async{
  //   cryptor = PlatformStringCryptor();
  //   final salt = await cryptor.generateSalt();
  //   password = pass.text;
  //   key = await cryptor.generateKeyFromPassword(password, salt);
  // // here pass the password entered by user and the key
  //   encryptedS = await cryptor.encrypt(password, key);
  //   print(encryptedS);
  // }
// method to decrypt String Password
  // void Decrypt() async{
  //   try{
  //     //here pass encrypted string and the key to decrypt it 
  //     decryptedS = await cryptor.decrypt(encryptedS, key);
  //     print(decryptedS);
  //   }on MacMismatchException{
  //   }
  // }

}