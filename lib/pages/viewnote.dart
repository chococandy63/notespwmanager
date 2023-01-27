
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/pages/home.dart';
import 'package:notes/pages/notepage.dart';

class ViewNote extends StatefulWidget {
  final Map data;
  final String time;
  final DocumentReference ref;
  ViewNote(this.data, this.time, this.ref);

  //const ViewNote({super.key});
  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  late String title;
  late String dis;
  final _controllerTitle= TextEditingController();
  final _controllerDescription=TextEditingController();
  final _controllerCreated=TextEditingController();

  
 

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
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
                      builder: (context) => const HomePage(),
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
                width: 20,
              ),
              ElevatedButton(
                  onPressed: update,
                  child: const Icon(
                    Icons.edit_note,
                    size: 24,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.red[300],
                      ),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 8.0,
                      )))),
              const SizedBox(
                width: 140,
              ),
              ElevatedButton(
                  onPressed: delete,
                  child: const Icon(
                    Icons.delete_forever,
                    size: 24,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.red[300],
                      ),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 8.0,
                      ))))
            ]),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.data['title']}",
                  style: GoogleFonts.mansalva(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(
                  top: 12.0,
                  bottom: 12.0,
                )),
                Text(
                  widget.time,
                  style: GoogleFonts.mansalva(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  height:
                      MediaQuery.of(context).size.height * 0.75, //ERROR HERE
                  child: Text(
                    "${widget.data['description']}",
                    style: GoogleFonts.mansalva(
                      fontSize: 20.0,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );

}
   void update() async {
    


    String tit="$widget.data['title']";
    setState(() {
      tit=_controllerTitle.text;
    });
    //modifying the contents of notes:
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('notes');
    var data = {
      'title': tit,
      'description': dis,
      'created': DateTime.now(),
    };
   
    ref.add(data);
    Navigator.pop(context);
  }
  
void delete() async {
    //deleting the widget from database
    await widget.ref.delete();
    Navigator.pop(context);
  }
  }
  

  

  