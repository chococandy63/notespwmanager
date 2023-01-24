import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:notes/pages/addnote.dart';
import 'package:notes/pages/home.dart';
import 'package:notes/pages/viewnote.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('notes');

  List<Color> myColors = [
    const Color.fromARGB(255, 172, 245, 150),
    const Color.fromARGB(255, 163, 100, 163),
    const Color.fromARGB(255, 154, 203, 243),
    const Color.fromARGB(255, 213, 203, 155),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 164, 143, 143),
          onPressed: () {
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => const AddNote(),
              ),
            )
                .then((value) {
              print("calling set state!");
              setState(() {});
            });
          },
          child: const Icon(
            Icons.add,
            color: Color.fromARGB(255, 92, 22, 45),
          ),
        ),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.navigate_before),
              tooltip: 'Previous page',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
          ],
          title: Text(
            'NOTES',
            style: GoogleFonts.mansalva(
              fontSize: 32,
            ),
          ),
          elevation: 100.0,
          backgroundColor: const Color.fromARGB(5, 22, 21, 21),
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: ref.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  // ignore: prefer_const_constructors, unnecessary_new
                  Random random = new Random();
                  Color bg = myColors[random.nextInt(4)];
                  Map? data = snapshot.data?.docs[index].data() as Map?;
                  DateTime mydateTime = data!['created']?.toDate();
                  String formattedTime =
                      DateFormat.yMMMd().add_jm().format(mydateTime);
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(
                            MaterialPageRoute(
                              builder: (context) => ViewNote(
                                  data,
                                  formattedTime,
                                  snapshot.data!.docs[index].reference),
                            ),
                          )
                          .then((value) => setState(() {}));
                    },
                    child: Card(
                        color: bg,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${data['title']}",
                                  style: GoogleFonts.mansalva(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      //using intl plugin to format date and time:
                                      formattedTime,
                                      style: GoogleFonts.mansalva(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ))
                              ]),
                        )),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("Loading!!"),
              );
            }
          },
        ));
  }
}
