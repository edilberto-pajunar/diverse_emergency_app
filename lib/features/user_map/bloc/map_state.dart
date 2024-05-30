part of 'map_bloc.dart';

enum NearbyPlaceStatus { idle, loading, success, failed }

final class MapState extends Equatable {
  final List<NearbyPlace> nearbyPlaces;
  final NearbyPlaceStatus nearbyPlaceStatus;
  final bool panelShow;
  // final Set<Marker> markers;

  const MapState({
    this.nearbyPlaces = const [],
    this.nearbyPlaceStatus = NearbyPlaceStatus.idle,
    this.panelShow = false,
    // this.markers = const {},
  });

  MapState copyWith({
    List<NearbyPlace>? nearbyPlaces,
    NearbyPlaceStatus? nearbyPlaceStatus,
    bool? panelShow,
    // Set<Marker>? markers,
  }) {
    return MapState(
      nearbyPlaces: nearbyPlaces ?? this.nearbyPlaces,
      nearbyPlaceStatus: nearbyPlaceStatus ?? this.nearbyPlaceStatus,
      panelShow: panelShow ?? this.panelShow,
      // markers: markers ?? this.markers,
    );
  }

  @override
  List<Object> get props => [
        nearbyPlaces,
        nearbyPlaceStatus,
        panelShow,
      ];
}
