import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/controller/googleauth.dart';
import 'package:notes/pages/addnote.dart';
import 'package:notes/pages/home.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddNote(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.pinkAccent,
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 300,),
        child: Text("ADD NOTES",
            textAlign: TextAlign.center,
            style: GoogleFonts.mansalva(
              fontSize: 30,
            ),
            ),
      ),
    );
  }
}
