import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_project/first.dart';
import 'package:login_project/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class MyController extends GetxController{

  var myString = 'First page'.obs; 
  change(val){
    if(val==0){
      myString("First page");
    }
    else if(val==1){
      myString("Second Page");
    }
    else{
      myString("Third Page");
    }
  }
  
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;


  
  signOut() async {
    await auth.signOut();
    Get.to(LoginPage());
  }
  final MyController _controller = Get.put(MyController());
  @override
 
  

  @override
  Widget build(BuildContext context) {
    //to always set the index for Getx to 0
    _controller.change(0);
    return Scaffold(
      body: Container(
      decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 64, 4, 72), Color.fromARGB(255, 141, 74, 143), Color.fromARGB(255, 225, 171, 207)]
              
            )
          ), 
      child: Column(
        
        children:[
          Container(
            height: MediaQuery.of(context).size.height-75,
        width: MediaQuery.of(context).size.width,
            child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(250,0,0,0),
                  child: ElevatedButton(onPressed: signOut, child: Text("Sign out")),
                ),
                SizedBox(
                  height: 650,
                  width: 350,
                  child: Card(child: Obx(() =>  Center(
                    child: Text(
                              "${_controller.myString}",
                              style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        color: Color.fromARGB(179, 4, 3, 3),
                        fontSize: 25,
                        fontWeight: FontWeight.w600)),
                      ),
                  ),),
                              ),
                ),
          ]))])),

      bottomNavigationBar: CurvedNavigationBar(items: [
        Icon(Icons.home),
        Icon(Icons.emergency),
        Icon(Icons.info_rounded),
      ],
      backgroundColor: Color.fromARGB(255, 43, 2, 51),
      onTap: (value)=>_controller.change(value),
      animationDuration: Duration(milliseconds: 400),
      ),
      
    );
  }
}

