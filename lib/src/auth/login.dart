
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shieldify/src/auth/sign_up.dart';
import 'package:shieldify/widgets/locator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/loginbg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                  child: Image(image: AssetImage("assets/images/loginlogo.png"),),
                  ),
                ),

                Positioned(
                  left: 20,
                  top: 270,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),) ,
                    Text("Log in to Continue", style: TextStyle(color: Colors.white),)
                  ],
                  )
                ),

              ],
            ),
            // Text("heloooo", style: TextStyle(color: Colors.white),
            // )
            //,
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
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
                      onChanged: (newText){

                      },
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text(
                    "Password",
                    style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 45,
                    child: TextField(
                      expands: false,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        hintText: "",
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

                      onChanged: (newText){

                      },
                    ),
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      TextButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context){
                                  return SignupPage();
                                })
                            );
                          },
                          child: Row(
                            children: [

                              Text("Create Account",
                                style: TextStyle(
                                  color: Colors.black, fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Icon(Icons.arrow_forward_ios, size: 18,)
                            ],
                          )
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context){
                                  return LoginPage();
                                })
                            );
                          },
                          child: Row(
                            children: [
                              Text("Forgot Password?",
                                style: TextStyle(
                                  color: Colors.black, fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Icon(Icons.arrow_forward_ios, size: 18,)
                            ],
                          )
                      ),
                    ],
                  )

                ],
              ),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context){
                            return locator();
                          })
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200,45),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),

                    ),
                    child: Text("Login"),

                  ),
                    SizedBox(width: 50,),
               Image(image: AssetImage("assets/images/frame.png"))
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
//applicationId "wtm.capstone.shieldify"