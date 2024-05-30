part of 'map_bloc.dart';

enum NearbyPlaceStatus { idle, loading, success, failed }

final class MapState extends Equatable {
  final List<NearbyPlace> nearbyPlaces;
  final NearbyPlaceStatus nearbyPlaceStatus;
  // final Set<Marker> markers;

  const MapState({
    this.nearbyPlaces = const [],
    this.nearbyPlaceStatus = NearbyPlaceStatus.idle,
    // this.markers = const {},
  });

  MapState copyWith({
    List<NearbyPlace>? nearbyPlaces,
    NearbyPlaceStatus? nearbyPlaceStatus,
    // Set<Marker>? markers,
  }) {
    return MapState(
      nearbyPlaces: nearbyPlaces ?? this.nearbyPlaces,
      nearbyPlaceStatus: nearbyPlaceStatus ?? this.nearbyPlaceStatus,
      // markers: markers ?? this.markers,
    );
  }

  @override
  List<Object> get props => [
        nearbyPlaces,
        NearbyPlaceStatus,
      ];
}
