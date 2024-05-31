import 'package:flutter/material.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/2.png"),
                fit: BoxFit.cover,
              ),
            ),

          ),
          Text("Track It Down. Fast", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),),
          Text("Find your phone on map, just like finding your", style: TextStyle(
              fontSize: 15
          ),),
          Text("keys with a whistle (but way cooler)", style: TextStyle(
              fontSize: 15
          ),
          ),

        ],
      ),
    );
  }
}
