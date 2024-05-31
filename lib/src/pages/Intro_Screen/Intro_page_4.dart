import 'package:flutter/material.dart';

class IntroPageFour extends StatelessWidget {
  const IntroPageFour({super.key});

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
                image: AssetImage("assets/images/4.png"),
                fit: BoxFit.cover,
              ),
            ),

          ),
          Text("You are in control", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),),
          Text("Manage all your device from one place,", style: TextStyle(
              fontSize: 15
          ),),
          Text("easy as pie. Easy as pie", style: TextStyle(
              fontSize: 15
          ),
          ),

        ],
      ),
    );
  }
}
