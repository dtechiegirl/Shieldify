import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shieldify/widgets/locator.dart';
import 'package:url_launcher/url_launcher_string.dart';
// import 'package:url_launcher/url_launcher.dart';

class MapDirection extends StatefulWidget {
  const MapDirection({super.key});

  @override
  State<MapDirection> createState() => _MapDirectionState();
}

class _MapDirectionState extends State<MapDirection> {
  String locationMessage = "Current Location";
  late String lat;
  late String long;

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('location is disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("location denied ");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location serivies are permanently denied denied");
    }
    return await Geolocator.getCurrentPosition();
  }

  void _livelocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      // List<Placemark> placemarks = await placemarkFromCoordinates(lat , long);
      setState(() {
        locationMessage = 'Latitude: $lat , logitude: $long';
      });
    });
  }

  // final Uri _url = Uri.parse('https://google.com/maps/search/?api=1&query=$lat,$long')

  Future<void> openMap(String lat, String long) async {
    String googleUrl = 'https://google.com/maps/search/?api=1&query=$lat,$long';
    await canLaunchUrlString(googleUrl)
        ? await launchUrlString(googleUrl)
        : throw 'could not launch $googleUrl';
  }

  // locator(),
  // ElevatedButton(
  // onPressed: () {
  // openMap(lat, long);
  // },
  // child: Text("Open Location in Map")),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context){
                return locator();
              })
          );
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover
          ),
        ),
        child: Column(
          children: [
            Stack(children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .80,
                      height: MediaQuery.of(context).size.height * .50,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Current location on Map",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              // locationMessage,
                              locationMessage == null
                                  ? 'No Address Found'
                                  : locationMessage!,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(height: 10,),
                            ElevatedButton(
                              onPressed: () {
                                _getCurrentLocation().then((value) {
                                  lat = '${value.latitude}';
                                  long = '${value.longitude}';

                                  setState(() {
                                    locationMessage =
                                        'Latitude: $lat , logitude: $long';
                                  });
                                  _livelocation();
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(200, 45),
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Text("Update Location"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  openMap(lat, long);
                                },
                                child: Text("Open Location in Map")),
                            SizedBox(
                              height: 20,
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
                  )),
            ])
          ],
        ),
      ),
      // body: Center(
      //   child: Column(
      //     children: [
      //       // locator(),
      //       Text(
      //         // locationMessage,
      //         locationMessage == null ? 'No Address Found' : locationMessage!,
      //         textAlign: TextAlign.center,
      //         style: TextStyle(fontSize: 25),
      //       ),
      //
      //
      //
      //       ElevatedButton(
      //           onPressed: () {
      //             _getCurrentLocation().then((value) {
      //               lat = '${value.latitude}';
      //               long = '${value.longitude}';
      //
      //               setState(() {
      //                 locationMessage = 'Latitude: $lat , logitude: $long';
      //               });
      //               _livelocation();
      //             });
      //           },
      //           child: Text("get location")),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       ElevatedButton(
      //           onPressed: () {
      //             openMap(lat, long);
      //           },
      //           child: Text("Open Location in Map")),
      //
      //       SizedBox(
      //         height: 20,
      //       ),
      //
      //       // ElevatedButton(
      //       //     onPressed: () {
      //       //       _getAddressFromLatlong();
      //       //     },
      //       //     child: Text("lovation"))
      //     ],
      //   ),
      // ),
    );
  }
}
