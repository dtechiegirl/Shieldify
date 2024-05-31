import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:get/get.dart';
import 'package:shieldify/src/location_controller.dart';
import 'package:shieldify/widgets/locator.dart';

class GeofencingPage extends StatefulWidget {
  const GeofencingPage({super.key});

  @override
  State<GeofencingPage> createState() => _GeofencingPageState();
}
// locator()

class _GeofencingPageState extends State<GeofencingPage> {

  final StreamController<Geofence> _geofenceStreamController = StreamController<Geofence>.broadcast();
  final StreamController<Activity> _activityStreamController = StreamController<Activity>.broadcast();

// Create a [GeofenceService] instance and set options.
  final _geofenceService = GeofenceService.instance.setup(
      interval: 5000,
      accuracy: 100,
      loiteringDelayMs: 60000,
      statusChangeDelayMs: 10000,
      useActivityRecognition: true,
      allowMockLocations: false,
      printDevLog: true,
      geofenceRadiusSortType: GeofenceRadiusSortType.DESC);

// This function is to be called when the geofence status is changed.
  Future<void> _onGeofenceStatusChanged(
      Geofence geofence,
      GeofenceRadius geofenceRadius,
      GeofenceStatus geofenceStatus,
      Location location) async {
    print('geofence: ${geofence.toJson()}');
    print('geofenceRadius: ${geofenceRadius.toJson()}');
    print('geofenceStatus: ${geofenceStatus.toString()}');
    _geofenceStreamController.sink.add(geofence);
  }

// This function is to be called when the activity has changed.
  void _onActivityChanged(Activity prevActivity, Activity currActivity) {
    print('prevActivity: ${prevActivity.toJson()}');
    print('currActivity: ${currActivity.toJson()}');
    _activityStreamController.sink.add(currActivity);
  }

// This function is to be called when the location has changed.
  void _onLocationChanged(Location location) {
    print('location: ${location.toJson()}');
  }

// This function is to be called when a location services status change occurs
// since the service was started.
  void _onLocationServicesStatusChanged(bool status) {
    print('isLocationServicesEnabled: $status');
  }

// This function is used to handle errors that occur in the service.
  void _onError(error) {
    final errorCode = getErrorCodesFromError(error);
    if (errorCode == null) {
      print('Undefined error: $error');
      return;
    }

    print('ErrorCode: $errorCode');
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {

    });

  }
  @override
  void dispose() {
    _geofenceStreamController.close();
    _activityStreamController.close();
    _geofenceService
        .removeGeofenceStatusChangeListener(_onGeofenceStatusChanged);
    _geofenceService.removeLocationChangeListener(_onLocationChanged);
    _geofenceService.removeLocationServicesStatusChangeListener(
        _onLocationServicesStatusChanged);
    _geofenceService.removeActivityChangeListener(_onActivityChanged);
    _geofenceService.removeStreamErrorListener(_onError);
    _geofenceService.stop();

    super.dispose();
  }
  void location() async{
  final controller = Get.find<LocationController>();
  final currentlocation = await controller.getPosition();
  setState(() {
    geofenceList = [
      Geofence(
        id: 'place_1',
        latitude: currentlocation.latitude,
        longitude: currentlocation.longitude,
        radius: [
          // GeofenceRadius(id: 'radius_100m', length: 100),
          GeofenceRadius(id: 'radius_2m', length: 2),
          // GeofenceRadius(id: 'radius_250m', length: 250),
          // GeofenceRadius(id: 'radius_200m', length: 200),
        ],
      ),

    ];

  });
  _geofenceService.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
  _geofenceService.addLocationChangeListener(_onLocationChanged);
  _geofenceService.addLocationServicesStatusChangeListener(_onLocationServicesStatusChanged);
  _geofenceService.addActivityChangeListener(_onActivityChanged);
  _geofenceService.addStreamErrorListener(_onError);
  _geofenceService.start(geofenceList).catchError(_onError);
  }
  List<Geofence> geofenceList = [];
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
