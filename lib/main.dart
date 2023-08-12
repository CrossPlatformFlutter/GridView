import 'package:flutter/material.dart';


void main(){
  runApp(TestGridView());
}

class TestGridView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppGrid(),
    );
  }
}

class AppGrid extends StatefulWidget{
  AppGrid({super.key});
  
  @override
  State<AppGrid> createState()=> _AppGrid();
}

class _AppGrid extends State<AppGrid>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(title: Text("ddd")),
    );
  }
}