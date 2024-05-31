import 'package:flutter/material.dart';
import 'package:shieldify/src/auth/login.dart';
import 'package:shieldify/widgets/textfields_widget.dart';

import '../../widgets/textwidget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {


  String fullname = "";
  String emailAddress = "";
  String Password = "";

  // int _value = 1;
  String selectedOption = "None Selected";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textwidget(
                      text: "Create an\naccount",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Name",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        expands: false,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(14.0)),
                            gapPadding: 4.0,
                          ),
                        ),
                        onChanged: (newText) {
                          fullname = newText;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Email",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        expands: false,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          hintText: "janedoe@gmail.com",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(14.0)),
                            gapPadding: 4.0,
                          ),
                        ),
                        onChanged: (newText) {
                          emailAddress = newText;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Phone",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        expands: false,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          hintText: "000...",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(14.0)),
                            gapPadding: 4.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Password",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        expands: false,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          // hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(14.0)),
                            gapPadding: 4.0,
                          ),

                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.black38,
                          ),
                        ),
                        onChanged: (newText) {
                          Password = newText;
                        },
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Confirm Password",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        expands: false,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          // hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(14.0)),
                            gapPadding: 4.0,
                          ),

                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 15,
                      child: RadioMenuButton(
                        value: "I am 16 years",
                        groupValue: selectedOption,
                        onChanged: (selectedValue) {
                          setState(() => selectedOption = selectedValue!);
                        },
                        child: Text("i am 16 years"),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      height: 20,
                      child: RadioMenuButton(
                          value:
                              "I have read the Terms of Service & Privacy Policy",
                          groupValue: selectedOption,
                          onChanged: (selectedValue) {
                            setState(() => selectedOption = selectedValue!);
                          },
                          child: Row(
                            children: [
                              Text("I have read"),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "the terms and conditions",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  // fontSize: 15
                                ),
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_isUserInputValid()) {

                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(380, 45),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text("SIGN UP"),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }));
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Icon(Icons.arrow_forward_ios, size: 18,)
                              ],
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
  bool _isUserInputValid() {
    String errMsg = "";
    if (fullname.isEmpty) {
      errMsg = "Fullname cannot be empty";
      // return false
    } else if (emailAddress.isEmpty) {
      errMsg = "Email cannot be empty";
    } else if (Password.isEmpty || Password.length < 8) {
      errMsg = "Enter a valid password";
    }
    if (errMsg.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errMsg)));
      return false;
    }

    return true;
  }

}
