import 'package:flutter/material.dart';
import 'package:gridview/car.dart';
import 'list_cars.dart';

void main(){
  runApp(const TestGridView());
}

class TestGridView extends StatelessWidget{
  const TestGridView({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppGrid(),
    );
  }
}

class AppGrid extends StatefulWidget{
  const AppGrid({super.key});

  @override
  State<AppGrid> createState()=> _AppGrid();
}

class _AppGrid extends State<AppGrid>{

final _cars = cars;

           Future<void> deletecars(int index)async{
                         await showDialog(barrierDismissible: false,context: context, builder: (context){
                            return  SimpleDialog(
                                title: Text("Do You Want Delete ${_cars[index].brand}"),
                                
                            );
                        });
                    }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(title: const Text("GridView")),
       body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
          itemCount: cars.length,
          itemBuilder: (context,index){
            Car car=_cars[index];
            return Card(
              color:Colors.cyan,
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 10, 12,12),
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                   Expanded(child: car.image),
                   const Divider(color: Colors.white),
                   Text(car.model,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.white),textAlign: TextAlign.center),
                   Text(car.brand,style: const TextStyle(color: Colors.white),),
                   ElevatedButton(onPressed:(){deletecars(index);} ,style: ElevatedButton.styleFrom(backgroundColor: Colors.white), child:const Icon(Icons.delete,color: Colors.red,)),
                ]),
              ),
            );
          }),
    );
  }
}