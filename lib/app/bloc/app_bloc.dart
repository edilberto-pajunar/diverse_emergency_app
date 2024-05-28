import 'package:bloc/bloc.dart';
import 'package:emergency_test/models/app_location.dart';
import 'package:emergency_test/repository/geolocation_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final GeolocationRepository _geolocationRepository;

  AppBloc({
    required GeolocationRepository geolocationRepository,
  })  : _geolocationRepository = geolocationRepository,
        super(const AppState()) {
    on<AppInitRequested>(_onInitRequested);
    on<AppInitLocationStreamRequested>(_onInitLocationStreamRequested);
  }

  void _onInitRequested(
    AppInitRequested event,
    Emitter<AppState> emit,
  ) {
    add(AppInitLocationStreamRequested());
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
}
