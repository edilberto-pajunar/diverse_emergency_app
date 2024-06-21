part of 'app_bloc.dart';

enum AppAuthStatus {idle, authenticated, loading, unauthenticated }

enum AppLocationStatus { idle, loading, success, failed }

enum SignoutStatus { signingOut, signOutSuccess, signOutFailure }

final class AppState extends Equatable {
  final ServiceStatus? serviceStatus;
  final LocationPermission? locationPermission;
  final AppLocation? currentLocation;
  final AppLocationStatus appLocationStatus;
  final AppUser? currentUserInfo;
  final SignoutStatus? signoutStatus;
  final AppAuthStatus appAuthStatus;
  final Member? member;

  const AppState({
    this.serviceStatus,
    this.locationPermission,
    this.currentLocation,
    this.appLocationStatus = AppLocationStatus.idle,
    this.currentUserInfo,
    this.signoutStatus,
    this.appAuthStatus = AppAuthStatus.idle,
    this.member,
  });

  AppState copyWith({
    ServiceStatus? serviceStatus,
    LocationPermission? locationPermission,
    AppLocation? currentLocation,
    AppLocationStatus? appLocationStatus,
    AppUser? currentUserInfo,
    SignoutStatus? signoutStatus,
    AppAuthStatus? appAuthStatus,
    Member? member,
  }) {
    return AppState(
      serviceStatus: serviceStatus ?? this.serviceStatus,
      locationPermission: locationPermission ?? this.locationPermission,
      currentLocation: currentLocation ?? this.currentLocation,
      appLocationStatus: appLocationStatus ?? this.appLocationStatus,
      currentUserInfo: currentUserInfo ?? this.currentUserInfo,
      signoutStatus: signoutStatus ?? this.signoutStatus,
      appAuthStatus: appAuthStatus ?? this.appAuthStatus,
      member: member ?? this.member,
    );
  }

  @override
  List<Object?> get props => [
        serviceStatus,
        locationPermission,
        currentLocation,
        appLocationStatus,
        currentUserInfo,
        signoutStatus,
        appAuthStatus,
        member,
      ];
}
