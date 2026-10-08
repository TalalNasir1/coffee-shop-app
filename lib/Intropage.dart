// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'HomePage.dart';

class Intropage extends StatelessWidget {
  const Intropage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      body: Column(
        
        children: [
          SizedBox(height: 180),
          Center(
            child: Image.asset("assets/1.png",
            height: 300,
              width: 300,

              
            ),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
            },
            child: Container(
              height: 60,
              width: 250,
              child: Center(
                child: 
                Text('Home Page', 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: "arial",
                  
                  )),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
            ),
          ) 
        ],
      )
    );
  }
}