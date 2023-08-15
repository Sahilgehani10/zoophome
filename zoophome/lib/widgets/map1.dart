

import 'package:flutter/material.dart';
// import 'pages/page1.dart';
// import 'pages/page2.dart';
import 'dart:math';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';




class osm1 extends StatefulWidget {
  const osm1({super.key});

  @override
  State<osm1> createState() => _osm1State();
}

class _osm1State extends State<osm1> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: OpenStreetMapSearchAndPick(

        center: LatLong(19.0760, 72.8777),
    // buttonColor: Colors.pinkAccent,
    buttonText: 'Set Current Location',
    onPicked: (pickedData) {



          // Container(color: Colors.red,height: 200,width: 200,);
        
    },
    ),

    );
  }
}











Widget _modal(BuildContext context){
      return Container(
        color: Colors.orange,
        height: 300,
        child: Container(
          color: Colors.red,

          height: 100,
        ),
      );

}
















