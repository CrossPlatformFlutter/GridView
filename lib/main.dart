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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  AppGrid(),
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
                        int result= await showDialog(barrierDismissible: false,context: context, builder: (context){
                            return  SimpleDialog(
                                title: Text("Do You Want Delete ${_cars[index].brand}"),
                                children: [
                                 Container(
                                   child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                         SimpleDialogOption(
                                           child:const Row(
                                             children: [
                                               Text("Confirm"),
                                               Icon(Icons.airplane_ticket)
                                             ],
                                           ),
                                           onPressed: (){
                                              Navigator.pop(context,index);
                                           },
                                         ),
                                          SimpleDialogOption(
                                           child:const Row(
                                             children: [
                                               Text("Cancel"),
                                               Icon(Icons.restore_outlined)
                                             ],
                                           ),
                                           onPressed: (){
                                             Navigator.pop(context,-1);
                                           },
                                         )
                                      ],
                                   ),
                                )
                                ],
                                
                            );
                        });

                        if(result!=-1){
                           ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Remove ${_cars[index].brand}"))
                          );
                            setState(() {
                            _cars.remove(_cars[result]);
                          });
                        }
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