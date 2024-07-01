import 'package:bloc/bloc.dart';
import 'package:emergency_test/models/app_location.dart';
import 'package:emergency_test/models/app_user.dart';
import 'package:emergency_test/models/member.dart';
import 'package:emergency_test/repository/auth_repository.dart';
import 'package:emergency_test/repository/geolocation_repository.dart';
import 'package:emergency_test/repository/local_repository.dart';
import 'package:emergency_test/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final GeolocationRepository _geolocationRepository;
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  AppBloc({
    required GeolocationRepository geolocationRepository,
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _geolocationRepository = geolocationRepository,
        _authRepository = authRepository,
        _userRepository = userRepository,
        super(const AppState()) {
    on<AppInitRequested>(_onInitRequested);
    on<AppInitLocationStreamRequested>(_onInitLocationStreamRequested);
    on<AppInitAuthRequested>(_onAppInitAuthRequested);
    on<AppSignOutRequested>(_onSignOutRequested);
    on<AppSignOutFailed>(_onSignOutFailed);
    on<AppHomeTabTapped>(_onHomeTabTapped);
  }

  void _onInitRequested(
    AppInitRequested event,
    Emitter<AppState> emit,
  ) {
    add(const AppInitAuthRequested());
    add(AppInitLocationStreamRequested());
  }

  void _onInitLocationStreamRequested(
    AppInitLocationStreamRequested event,
    Emitter<AppState> emit,
  ) async {
    // emit(state.copyWith(appLocationStatus: AppLocationStatus.loading));
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

      final userLocation =
          await _geolocationRepository.getLocation(withAddress: true);
      emit(state.copyWith(currentLocation: userLocation));

      await emit.forEach(_geolocationRepository.getLocationStream(),
          onData: (data) {
        return state.copyWith(
          currentLocation: data,
          appLocationStatus: AppLocationStatus.success,
        );
      });
    } catch (e) {
      if (e is LocationServiceDisabledException) {
        emit(state.copyWith(
          serviceStatus: ServiceStatus.disabled,
          appLocationStatus: AppLocationStatus.failed,
        ));
      }

      if (e is PermissionDeniedException) {
        emit(state.copyWith(
          locationPermission: LocationPermission.denied,
          appLocationStatus: AppLocationStatus.failed,
        ));
      } else {
        emit(state.copyWith(
          appLocationStatus: AppLocationStatus.failed,
        ));
      }
    }
  }

  void _onAppInitAuthRequested(
    AppInitAuthRequested event,
    Emitter<AppState> emit,
  ) async {
    final token = LocalRepository.getString("token");

    if (token == null) {
      emit(state.copyWith(appAuthStatus: AppAuthStatus.unauthenticated));
      return;
    }

    emit(state.copyWith(appAuthStatus: AppAuthStatus.loading));

    final member = await _authRepository.getMemberInfo(token);

    emit(state.copyWith(
      // currentUserInfo: event.currentUserInfo,
      appAuthStatus: AppAuthStatus.authenticated,
      member: member,
    ));
  }

  void _onSignOutRequested(
    AppSignOutRequested event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(
      signoutStatus: SignoutStatus.signingOut,
      appAuthStatus: AppAuthStatus.loading,
    ));
    try {
      await _authRepository.logOut();
      emit(state.copyWith(
        signoutStatus: SignoutStatus.signOutSuccess,
        appAuthStatus: AppAuthStatus.unauthenticated,
        member: null,
      ));
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

  void _onHomeTabTapped(
    AppHomeTabTapped event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(
      tabIndex: event.tab,
    ));
  }
}
