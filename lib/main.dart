
import 'dart:convert';

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
    var _future ;
    var data ;
      List dataList =[];


  @override
  void initState() {
    super.initState();
    setUpTimedFetch();
  }
  setUpTimedFetch() {
    Timer.periodic( const Duration(milliseconds: 5000), (timer) {
      setState(() {
        _future =  fetchData().then((value) => data=value);
        if(data !=null){
          dataList=[] ;
          Map<String, dynamic> jsonData =
          json.decode(data.body) as Map<String, dynamic>;
          dataList.add(jsonData['Sensor \\#1 Humidty(%)']['value']) ;
          dataList.add(jsonData['Sensor \\#1 Temperature(C)']['value']);
          dataList.add(jsonData['Sensor \\#2 Humidty(%)']['value']) ;
          dataList.add(jsonData['Sensor \\#2 Temperature(C)']['value']);

        }
      });
    });
  }


  @override
  Widget build(BuildContext context){
     Size size = MediaQuery.of(context).size;
     final height = MediaQuery.of(context).size.height;
     final width = MediaQuery.of(context).size.width;
     return Scaffold(
      backgroundColor: Colors.white,
      body:   FutureBuilder(
          future:_future  ,
          builder:  (context,snapshot  ) {
            return dataList.isNotEmpty?
            Stack(
                children:[ Column(
                  children: [
                    Text(
                      "${dataList[0]}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                ]
            ) ,
                ]
            )
                :const Center(child: CircularProgressIndicator(),);
          }
      )
        );
                
              
            
      
   }
}