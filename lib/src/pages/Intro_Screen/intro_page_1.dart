import 'package:flutter/material.dart';

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({super.key});

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
                image: AssetImage("assets/images/plainbg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Image(image: AssetImage("assets/images/childplainbg.png"),),
            ),
          ),
          Text("Welcome Abroad", style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),),
          Text("You are one-stop shop away from keeping your device", style: TextStyle(
            fontSize: 15
          ),),
          Text("safe and sound", style: TextStyle(
            fontSize: 15
          ),
          ),

        ],
      ),
    );
  }
}
