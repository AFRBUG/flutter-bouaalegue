
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'comun/shared.dart';



void main() {
runApp(
  MaterialApp(
    home: Dashboard(),
    )
);
 }
 class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Timer? timer ;
   var response ;
    var  _future;


  @override
  void initState() {
    super.initState();
    setUpTimedFetch();
  }
  setUpTimedFetch() {
    Timer.periodic(Duration(milliseconds: 5000), (timer) {
      setState(() {
        _future =  fetchData();
        print(_future.hashCode) ;
      });
    });
  }

  @override

  Widget build(BuildContext context){

     Size size = MediaQuery.of(context).size;
     final height = MediaQuery.of(context).size.height;
     final width = MediaQuery.of(context).size.width;
     var data ;
     return Scaffold(

      backgroundColor: Colors.white,

      body:   FutureBuilder(
          future:_future  ,
          builder:  (context,medications  ) {

            return _future.hashCode!=null ?
            Stack(
                children:[ Column(
                  children: [

                    Text(
                      "$data",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),

                ]
            )
                ]
            )
                :const Center(
            child: CircularProgressIndicator(),
            );
          }
      )
        );
                
              
            
      
   }
}