
import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  const TextFields({
    super.key,
    required this.textf,
  });

  final String? textf;
  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
      height: 50,
      child: TextField(
        expands: false,
        decoration: const InputDecoration(
          fillColor: Colors.white,
          hintText: "textf",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0)),
            gapPadding: 4.0,

          ),
          // prefixIcon: Icon(Icons.email, color: Colors.black38,),


        ),
      ),
    );
  }
}