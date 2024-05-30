import 'dart:async';

import 'package:emergency_test/models/app_location.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationRepository {
  GeolocationRepository() {
    Geolocator.getServiceStatusStream()
        .listen((status) => serviceStatusController.add(status));
  }

  final serviceStatusController = StreamController<ServiceStatus>.broadcast();
  final permissionStatusController =
      StreamController<LocationPermission>.broadcast();

  Stream<AppLocation> getLocationStream() {
    final positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(distanceFilter: 5),
    );

    return positionStream.map((pos) => AppLocation(
          location: (pos.latitude, pos.longitude),
        ));
  }

  
}
