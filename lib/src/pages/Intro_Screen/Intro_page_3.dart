import 'package:flutter/material.dart';

class IntroPageThree extends StatelessWidget {
  const IntroPageThree({super.key});

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
                image: AssetImage("assets/images/3.png"),
                fit: BoxFit.cover,
              ),
            ),

          ),
          Text("Get Loud!", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),),
          Text("Make that thief jump! Activate a loud alarm to", style: TextStyle(
              fontSize: 15
          ),),
          Text("scare them away", style: TextStyle(
              fontSize: 15
          ),
          ),

        ],
      ),
    );
  }
}
