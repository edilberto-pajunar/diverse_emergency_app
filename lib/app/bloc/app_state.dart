part of 'app_bloc.dart';

enum AppLocationStatus { idle, loading, success, failed }

enum SignoutStatus { signingOut, signOutSuccess, signOutFailure }

final class AppState extends Equatable {
  final ServiceStatus? serviceStatus;
  final LocationPermission? locationPermission;
  final AppLocation? currentLocation;
  final AppLocationStatus appLocationStatus;
  final GoogleMapController? googleMapController;
  final AppUser? currentUser;
  final SignoutStatus? signoutStatus;

  const AppState({
    this.serviceStatus,
    this.locationPermission,
    this.currentLocation,
    this.appLocationStatus = AppLocationStatus.idle,
    this.googleMapController,
    this.currentUser,
    this.signoutStatus,
  });

  AppState copyWith({
    ServiceStatus? serviceStatus,
    LocationPermission? locationPermission,
    AppLocation? currentLocation,
    AppLocationStatus? appLocationStatus,
    GoogleMapController? googleMapController,
    AppUser? currentUser,
    SignoutStatus? signoutStatus,
  }) {
    return AppState(
      serviceStatus: serviceStatus ?? this.serviceStatus,
      locationPermission: locationPermission ?? this.locationPermission,
      currentLocation: currentLocation ?? this.currentLocation,
      appLocationStatus: appLocationStatus ?? this.appLocationStatus,
      googleMapController: googleMapController ?? this.googleMapController,
      currentUser: currentUser ?? this.currentUser,
      signoutStatus: signoutStatus ?? this.signoutStatus,
    );
  }

  @override
  List<Object?> get props => [
        serviceStatus,
        locationPermission,
        currentLocation,
        appLocationStatus,
        googleMapController,
        currentUser,
        signoutStatus,
      ];
}
