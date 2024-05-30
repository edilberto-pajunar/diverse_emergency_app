import 'package:bloc/bloc.dart';
import 'package:emergency_test/models/app_location.dart';
import 'package:emergency_test/models/app_user.dart';
import 'package:emergency_test/repository/auth_repository.dart';
import 'package:emergency_test/repository/geolocation_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final GeolocationRepository _geolocationRepository;
  final AuthRepository _authRepository;

  AppBloc({
    required GeolocationRepository geolocationRepository,
    required AuthRepository authRepository,
  })  : _geolocationRepository = geolocationRepository,
        _authRepository = authRepository,
        super(const AppState()) {
    on<AppInitRequested>(_onInitRequested);
    on<AppInitLocationStreamRequested>(_onInitLocationStreamRequested);
    on<AppInitAuthStreamRequested>(_onAppInitAuthStreamRequested);
    on<AppSignOutRequested>(_onSignOutRequested);
    on<AppSignOutFailed>(_onSignOutFailed);
  }

  void _onInitRequested(
    AppInitRequested event,
    Emitter<AppState> emit,
  ) {
    add(AppInitLocationStreamRequested());
    add(AppInitAuthStreamRequested());
  }

  void _onInitLocationStreamRequested(
      AppInitLocationStreamRequested event, Emitter<AppState> emit) async {
    emit(state.copyWith(appLocationStatus: AppLocationStatus.loading));
    try {
      final serviceStatus = await Geolocator.isLocationServiceEnabled();
      if (!serviceStatus) {
        emit(state.copyWith(serviceStatus: ServiceStatus.disabled));
        return;
      } else {
        emit(state.copyWith(serviceStatus: ServiceStatus.enabled));
      }

      final locationPermission = await Geolocator.checkPermission();
      emit(state.copyWith(locationPermission: locationPermission));

      await emit.forEach(_geolocationRepository.getLocationStream(),
          onData: (userLocation) => state.copyWith(
                currentLocation: userLocation,
                appLocationStatus: AppLocationStatus.success,
              ));
    } catch (e) {
      e as Exception;
      switch (e.runtimeType) {
        case const (LocationServiceDisabledException):
          emit(state.copyWith(serviceStatus: ServiceStatus.disabled));
        case const (PermissionDeniedException):
          emit(state.copyWith(locationPermission: LocationPermission.denied));
          break;
      }
    }
  }

  void _onAppInitAuthStreamRequested(
    AppInitAuthStreamRequested event,
    Emitter<AppState> emit,
  ) async {
    await emit.forEach(_authRepository.currentUserStream, onData: (user) {
      if (user == null) return state.copyWith(currentUser: null);

      return state.copyWith(currentUser: user);
    });
  }

  void _onSignOutRequested(
    AppSignOutRequested event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(signoutStatus: SignoutStatus.signingOut));
    try {
      await _authRepository.logOut();
      emit(state.copyWith(signoutStatus: SignoutStatus.signOutSuccess));
    } catch (e) {
      add(AppSignOutFailed(e as Exception));
      rethrow;
    }
  }

  void _onSignOutFailed(
    AppSignOutFailed event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(signoutStatus: SignoutStatus.signOutFailure));
  }
}
