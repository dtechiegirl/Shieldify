import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shieldify/src/home_page.dart';
import 'package:shieldify/src/pages/map_direction.dart';
import '../src/location_controller.dart';

class locator extends StatelessWidget {
  const locator({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
        init: LocationController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context){
                      return MapDirection();
                    })
                );
              }, icon: Icon(Icons.arrow_back)),
              centerTitle: true,
              title:  Text('Tracking',),
            ),
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
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Center(
                              child: controller.isLoading.value
                             ?  CircularProgressIndicator()
                              : SizedBox(

                                width:  MediaQuery.of(context).size.width * .80,
                                height: MediaQuery.of(context).size.height * .30,
                                child:  DecoratedBox(
                                  decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.grey
                                  ), child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Current location", style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    Text(controller.currentLocation == null
                                        ? 'No Address Found'
                                        : controller.currentLocation!,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async{
                                        await controller.getCurrentLocation();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: Size(300,45),
                                        backgroundColor: Colors.black,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8)
                                        ),

                                      ),
                                      child: Text("Update Location"),

                                    ),
                                  ],
                                ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                            left: 330,
                            top: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(image: AssetImage("assets/images/close-square.png"))
                              ],
                            )
                        ),

                      ]
                  )

                ],
              ),
            )
            // body: SizedBox(
            //   height: 300,
            //   width: 300,
            //   child: Center(
            //     child: controller.isLoading.value
            //         ? const CircularProgressIndicator()
            //         : Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 16),
            //           child: Text(
            //             controller.currentLocation == null
            //                 ? 'No Address Found'
            //                 : controller.currentLocation!,
            //             style: const TextStyle(fontSize: 23),
            //             textAlign: TextAlign.center,
            //           ),
            //         ),
            //         const SizedBox(height: 20),
            //         ElevatedButton(
            //           onPressed: () async {
            //             await controller.getCurrentLocation();
            //           },
            //           child: const Text('Get Current Location'),
            //         ),
            //
            //
            //       ],
            //     ),
            //   ),
            // ),
          );
        });
  }
}