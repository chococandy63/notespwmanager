import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: Column(
        children: [
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
                onChanged: (val){
                  title=val;
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}
