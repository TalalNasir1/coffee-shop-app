import 'package:flutter/material.dart';

class LightText extends StatelessWidget {
 LightText({super.key,required this.title,
 this.size=20,this.color=Colors.black});

final String title;
final double? size;
final Color? color;



  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(fontSize: size,color: color), );
  }
}