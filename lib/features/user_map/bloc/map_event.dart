part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class MapNearbyPlaceRequested extends MapEvent {
  final double lat;
  final double lng;
  final String type;

  const MapNearbyPlaceRequested({
    required this.lat,
    required this.lng,
    required this.type,
  });
}

class MapPanelButtonTapped extends MapEvent {
  
}
