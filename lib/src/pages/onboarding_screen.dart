import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shieldify/src/auth/login.dart';
import 'package:shieldify/src/pages/Intro_Screen/Intro_page_2.dart';
import 'package:shieldify/src/pages/Intro_Screen/Intro_page_3.dart';
import 'package:shieldify/src/pages/Intro_Screen/Intro_page_4.dart';
import 'package:shieldify/src/pages/Intro_Screen/intro_page_1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 3);
            });
          },
          children: [
            IntroPageOne(),
            IntroPageTwo(),
            IntroPageThree(),
            IntroPageFour(),
          ],
        ),
        Container(
          alignment: Alignment(0, 0.7),
          child: SmoothPageIndicator(
            controller: _controller,
            count: 4,
            effect: SlideEffect(dotColor: Colors.grey),
          ),
        ),
        Positioned(
          top: 630,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _controller.jumpToPage(3);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(100, 45),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text("Skip"),
                ),
                SizedBox(
                  width: 150,
                ),
                onLastPage
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 45),
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text("Login"),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          _controller.nextPage(
                              duration: Duration(microseconds: 500),
                              curve: Curves.easeIn);
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 45),
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text("Next"),
                      ),
                // Image(image: AssetImage("assets/images/frame.png"))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
