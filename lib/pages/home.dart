// ignore_for_file: unnecessary_const

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/pages/login.dart';
import 'package:notes/pages/notepage.dart';
import 'package:notes/pages/passwordspage.dart';
import 'package:notes/controller/googleauth.dart';
import 'package:notes/controller/googleauth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //creating a signout function to sign out from the current account
  void _signOut() {
    googleSignIn.signOut();
    print("User Signed Out");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  bool page = true;

  @override
  void initState() {
    page = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Row(
            children: [
              Text(
                'HOME PAGE',
                style: GoogleFonts.mansalva(
                  fontSize: 32,
                ),
              ),
            ],
          ),
          elevation:
              defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
          backgroundColor: const Color.fromARGB(255, 167, 76, 106)),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 167, 76, 106),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,  
               foregroundImage: NetworkImage(accimage),
               child: Text(
                accname[0],
                style: GoogleFonts.mansalva(
                  fontSize: 40,
                ),
              ),
               
            ),
            accountName: Text(accname,
            overflow: TextOverflow.ellipsis,
                style: GoogleFonts.mansalva(
                  fontSize: 18,
                )),
            accountEmail: Text(accemail,
            overflow: TextOverflow.ellipsis,
                style: GoogleFonts.mansalva(
                  fontSize: 18,
                )),
          ),
          ListTile(
            title: Text("Notes",
                style: GoogleFonts.mansalva(
                  fontSize: 17,
                )),
            leading: const Icon(Icons.notes),
              // onTap: () => Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) => const NotesPage(),
              //       ),
              onTap: () {
                setState(
                  () {
                    page = true;
                  },
                );
                Navigator.pop(context);
              }),
           ListTile(
            leading: const Icon(Icons.password),
            title: Text("Passwords",
                style: GoogleFonts.mansalva(
                  fontSize: 17,
                  
                )),
            // onTap: () => Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => const PasswordsPage(),
            //   ),
            onTap: () {
              setState(
                () {
                  page = false;
                },
              );
              Navigator.pop(context);
            },
                      ),
          const SizedBox(
            height: 460,
          ),
           const Divider(
            color: Colors.white,
            thickness: 1,
          ),
          ListTile(title:Text("Log Out",style: GoogleFonts.mansalva(
                  fontSize: 17,
                )),
                leading: const Icon(Icons.logout),
                onTap: ()=>_signOut(),
          
          )
        ],
      )),
      body: page ? NotesPage() : PasswordsPage(),
    );
  }
}
