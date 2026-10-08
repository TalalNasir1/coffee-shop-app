import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
 BoldText({super.key,required this.title,
 this.size=20,this.color=Colors.black,this.letterSpacing});

final String title;
final double? size;
final Color? color;
final double? letterSpacing;



  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(fontSize: size,color: color,fontWeight: FontWeight.bold,letterSpacing: letterSpacing), );
  }
}