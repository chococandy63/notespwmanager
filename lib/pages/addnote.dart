import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/pages/notepage.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late String title;
  late String dis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Row(children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NotesPage(),
                  ),
                );
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.pinkAccent[100])),
              child: const Icon(
                Icons.arrow_back_ios_new_sharp,
              ),
            ),
            const SizedBox(
              width: 250,
            ),
            ElevatedButton(
              onPressed: () {
                add();
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.pinkAccent[100]),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 8.0,
                    ),
                  )),
              child: const Text("SAVE"),
            )
          ]),
          const SizedBox(
            height: 20,
          ),
          Form(
              child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration.collapsed(hintText: "Title"),
                style: const TextStyle(
                  fontSize: 32.0,
                  fontFamily: "mansalva",
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                onChanged: (val) {
                  title = val;
                },
              ),
              
              Container(
                //MediaQuery.of(context).size.height=0.75,
                height:MediaQuery.of(context).size.height, //ERROR HERE
                padding:const EdgeInsets.only(top:12.0),
                child: TextFormField(
                
                  decoration:
                      const InputDecoration.collapsed(hintText: "Description"),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontFamily: "mansalva",
                    color: Colors.grey,
                  ),
                  onChanged: (val) {
                    dis = val;
                  },
                ),
              )
            ],
          ))
        ]),
      ),
    );
  }

  void add() {
    //saving to database:firebase
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('notes');
    var data = {
      'title': title,
      'description': dis,
      'created': DateTime.now(),
    };
    ref.add(data);
    Navigator.pop(context);
  }
}
