import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:emergency_test/models/nearby_place.dart';
import 'package:emergency_test/repository/place_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final PlaceRepository _placeRepository;

  MapBloc({
    required PlaceRepository placeRepository,
  })  : _placeRepository = placeRepository,
        super(const MapState()) {
    on<MapNearbyPlaceRequested>(_onMapNearbyPlaceRequested);
  }

  void _onMapNearbyPlaceRequested(
    MapNearbyPlaceRequested event,
    Emitter<MapState> emit,
  ) async {
    emit(state.copyWith(nearbyPlaceStatus: NearbyPlaceStatus.loading));
    Set<Marker> markers = {};

    try {
      final nearbyPlaces = await _placeRepository.getPlacesFromNearby(
        lat: event.lat,
        lng: event.lng,
        type: event.type,
      );

      markers.add(
        Marker(
          markerId: const MarkerId("currentLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(event.lat, event.lng),
        ),
      );

      for (final place in nearbyPlaces) {
        markers.add(
          Marker(
            markerId: MarkerId(place.placeId),
            position: LatLng(
                place.geometry.location.lat, place.geometry.location.lng),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
          ),
        );
      }

      emit(
        state.copyWith(
          nearbyPlaces: nearbyPlaces,
          nearbyPlaceStatus: NearbyPlaceStatus.success,
          markers: markers,
        ),
      );
    } catch (e) {
      log("Error: $e");
      emit(state.copyWith(nearbyPlaceStatus: NearbyPlaceStatus.failed));
    }
  }
}
