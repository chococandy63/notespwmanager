// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       body:
       Column(
         children: [
           Padding(padding:const EdgeInsets.symmetric(horizontal:20.0,
vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                //calling a fn
                
              },
              // ignore: sort_child_properties_last
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "NOTES",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.mansalva(
                      fontSize: 20,
                    )
                  ),
                  const SizedBox(
                    width:10,
                  ),
                  Image.asset('assets/images/notes.jpg',height:36.0,),

                ],
              ),
              style:ButtonStyle(
                backgroundColor:MaterialStateProperty.all(const Color.fromARGB(255, 181, 84, 116)
                ),padding:MaterialStateProperty.all(const EdgeInsets.symmetric(
                  vertical: 10,
                )) )
            ),
            ),


             Padding(padding:const EdgeInsets.symmetric(horizontal:20.0,
vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                //calling a fn
                
              },
              // ignore: sort_child_properties_last
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "PASSWORDS",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.mansalva(
                      fontSize: 20,
                    )
                  ),
                  const SizedBox(
                    width:10,
                  ),
                  Image.asset('assets/images/password.png',height:36.0,),

                ],
              ),
              style:ButtonStyle(
                backgroundColor:MaterialStateProperty.all(const Color.fromARGB(255, 181, 84, 116)
                ),padding:MaterialStateProperty.all(const EdgeInsets.symmetric(
                  vertical: 10,
                )) )
            ),
            ),
         ],
       ),   
    );
  }
}