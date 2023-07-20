import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 64, 4, 72), Color.fromARGB(255, 141, 74, 143), Color.fromARGB(255, 225, 171, 207)]
              /*colors: [
                
               Color.fromRGBO(71, 51, 148, 1),
               Color.fromRGBO(97, 71, 156, 1),
               Color.fromRGBO(133, 93, 167, 1),
               Color.fromRGBO(176, 132, 188, 0.86),

              ],*/
            )
          ), 
      child:Card(
        child: Text(
          "This is the first page that comes on clicking the home icon on the navigation bar",
          style: GoogleFonts.openSans(
              textStyle: const TextStyle(
                  color: Color.fromARGB(179, 4, 3, 3),
                  fontSize: 25,
                  fontWeight: FontWeight.w600)),
        ),
    ));
  }
}