import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

  Future<AppLocation> getLocation({bool withAddress = false}) async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) /* Geolocator.openLocationSettings(); */ {
      // return Future.error(ServiceStatus.disabled);
    }
    final locPermission = await Geolocator.checkPermission();
    if (locPermission == LocationPermission.denied) {
      // return Future.error(locPermission);
      /* await Geolocator.requestPermission(); */
    }
    try {
      Position? position = await Geolocator.getLastKnownPosition();
      position ??= await Geolocator.getCurrentPosition();

      final (lat, lng) = (position.latitude, position.longitude);
      final appLocation = AppLocation(
        location: (position.latitude, position.longitude),
      );

      if (!withAddress) return appLocation;
      final address = await getAddressStringFromLoc(lat: lat, lng: lng);
      return appLocation.copyWith(address: address);
    } catch (e) {
      e as Exception;
      switch (e.runtimeType) {
        case LocationServiceDisabledException:
          serviceStatusController.add(ServiceStatus.disabled);
          break;
        case PermissionDeniedException:
          permissionStatusController.add(LocationPermission.denied);
          break;
      }
      throw Exception(e);
    }
  }

  Future<String?> getAddressStringFromLoc({
    required double lat,
    required double lng,
  }) async {
    final addressServiceUrl = Uri.parse(
      "https://nominatim.openstreetmap.org/reverse?lat=$lat&lon=$lng&format=json",
    );

    final response = await http.get(addressServiceUrl);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      return responseData["display_name"];
    } else {
      throw Exception("Error retrieving address for location");
    }
  }
}
