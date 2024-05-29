part of 'app_bloc.dart';

enum AppLocationStatus { idle, loading, success, failed }

final class AppState extends Equatable {
  final ServiceStatus? serviceStatus;
  final LocationPermission? locationPermission;
  final AppLocation? currentLocation;
  final AppLocationStatus appLocationStatus;
  final GoogleMapController? googleMapController;

  const AppState({
    this.serviceStatus,
    this.locationPermission,
    this.currentLocation,
    this.appLocationStatus = AppLocationStatus.idle,
    this.googleMapController,
  });

  AppState copyWith({
    ServiceStatus? serviceStatus,
    LocationPermission? locationPermission,
    AppLocation? currentLocation,
    AppLocationStatus? appLocationStatus,
    GoogleMapController? googleMapController,
  }) {
    return AppState(
      serviceStatus: serviceStatus ?? this.serviceStatus,
      locationPermission: locationPermission ?? this.locationPermission,
      currentLocation: currentLocation ?? this.currentLocation,
      appLocationStatus: appLocationStatus ?? this.appLocationStatus,
      googleMapController: googleMapController ?? this.googleMapController,
    );
  }

  @override
  List<Object?> get props => [
        serviceStatus,
        locationPermission,
        currentLocation,
        appLocationStatus,
        googleMapController,
      ];
}
