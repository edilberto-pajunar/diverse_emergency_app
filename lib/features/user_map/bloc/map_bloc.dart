import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:emergency_test/models/nearby_place.dart';
import 'package:emergency_test/repository/place_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final PlaceRepository _placeRepository;

  MapBloc({
    required PlaceRepository placeRepository,
  })  : _placeRepository = placeRepository,
        super(const MapState()) {
    on<MapNearbyPlaceRequested>(_onNearbyPlaceRequested);
    on<MapPanelButtonTapped>(_onPanelButtonTapped);
  }

  void _onNearbyPlaceRequested(
    MapNearbyPlaceRequested event,
    Emitter<MapState> emit,
  ) async {
    emit(state.copyWith(nearbyPlaceStatus: NearbyPlaceStatus.loading));

    try {
      final nearbyPlaces = await _placeRepository.getPlacesFromNearby(
        lat: event.lat,
        lng: event.lng,
        type: event.type,
      );

      final markers = nearbyPlaces
          .map((place) => Marker(
                point:
                    LatLng(place.location.latitude!, place.location.longitude!),
                child: const Icon(
                  Icons.place,
                  color: Colors.green,
                ),
              ))
          .toList();

      emit(state.copyWith(
        nearbyPlaces: nearbyPlaces,
        markers: markers,
      ));
    } catch (e) {
      log("Error: $e");
      emit(state.copyWith(
        nearbyPlaceStatus: NearbyPlaceStatus.failed,
      ));
    }
  }

  void _onPanelButtonTapped(
      MapPanelButtonTapped event, Emitter<MapState> emit) {
    final updatedPanel = !state.panelShow;
    emit(state.copyWith(panelShow: updatedPanel));
  }
}
