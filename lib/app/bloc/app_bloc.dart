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

      // final userLocation =
      //     await _geolocationRepository.getLocation(withAddress: true);
      // emit(state.copyWith(currentLocation: userLocation));

      await emit.forEach(_geolocationRepository.getLocationStream(),
          onData: (data) => state.copyWith(
                currentLocation: data,
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

  void _onAppInitAuthRequested(
    AppInitAuthRequested event,
    Emitter<AppState> emit,
  ) async {
    final token = LocalRepository.getString("token");

    if (token == null) return;

    final member = await _authRepository.getMemberInfo(token);

    emit(state.copyWith(
      currentUserInfo: event.currentUserInfo,
      appAuthStatus: AppAuthStatus.authenticated,
      member: member,
    ));
    // final email = LocalRepository.getString("email");
    // final password = LocalRepository.getString("password");

    // if (email!.isEmpty || password!.isEmpty) return;

    // try {
    //   final appUser =
    //       await _authRepository.signInWithEmailAndPassword(email, password);

    //   emit(state.copyWith(
    //     currentUserInfo: appUser,
    //     appAuthStatus: AppAuthStatus.authenticated,
    //   ));
    // } catch (e) {
    //   rethrow;
    // }
  }

  void _onSignOutRequested(
    AppSignOutRequested event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(signoutStatus: SignoutStatus.signingOut));
    try {
      await _authRepository.logOut();
      emit(state.copyWith(
        signoutStatus: SignoutStatus.signOutSuccess,
        appAuthStatus: AppAuthStatus.unauthenticated,
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

  // void _onAuthenticatedTriggered(
  //   AppAuthenticatedTriggered event,
  //   Emitter<AppState> emit,
  // ) async {
  //   LocalRepository.setString("auth", AppAuthStatus.authenticated.toString());

  //   emit(state.copyWith(
  //     appAuthStatus: AppAuthStatus.authenticated,
  //   ));
  // }
}
