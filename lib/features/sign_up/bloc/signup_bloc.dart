import 'package:bloc/bloc.dart';
import 'package:emergency_test/repository/auth_repository.dart';
import 'package:emergency_test/repository/geolocation_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository _authRepository;
  final GeolocationRepository _geolocationRepository;

  SignUpBloc({
    required AuthRepository authRepository,
    required GeolocationRepository geolocationRepository,
  })  : _authRepository = authRepository,
        _geolocationRepository = geolocationRepository,
        super(const SignUpState()) {
    on<SignUpInitRequested>(_onInitRequested);
    on<SignUpPersonalInfoSubmitted>(_onPersonalInfoSubmitted);
    on<SignUpBirthdaySubmitted>(_onBirthdaySubmitted);
    on<SignUpGenderSubmitted>(_onGenderSubmitted);
    on<SignUpHomeAddressRequested>(_onHomeAddressRequested);
    on<SignUpSecuritySubmitted>(_onSecuritySubmitted);
    on<SignUpRegisterRequested>(_onRegisterRequested);
  }

  void _onInitRequested(
    SignUpInitRequested event,
    Emitter<SignUpState> emit,
  ) async {}

  void _onPersonalInfoSubmitted(
    SignUpPersonalInfoSubmitted event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
      firstName: event.firstName,
      middleName: event.middleName,
      lastName: event.lastName,
    ));
  }

  void _onBirthdaySubmitted(
    SignUpBirthdaySubmitted event,
    Emitter<SignUpState> emit,
  ) {
    if (event.birthday == null) return;
    final birthday = event.birthday;
    final formattedBirthday = DateFormat("MM/dd/yyyy").format(birthday!);

    emit(state.copyWith(birthday: formattedBirthday));
  }

  void _onGenderSubmitted(
    SignUpGenderSubmitted event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(gender: event.gender));
  }

  void _onHomeAddressRequested(
    SignUpHomeAddressRequested event,
    Emitter<SignUpState> emit,
  ) async {
    final address = await _geolocationRepository.getLocation(withAddress: true);
    emit(state.copyWith(
      country: address.address?.split(",").last ?? "",
      address: address.address ?? "",
    ));
  }

  void _onSecuritySubmitted(
    SignUpSecuritySubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(
      countryCode: event.countryCode,
      mobile: event.contactNumber,
      username: event.username,
      email: event.emailAddress,
      password: event.password,
      confirmPassword: event.confirmPassword,
    ));
  }

  void _onRegisterRequested(
    SignUpRegisterRequested event,
    Emitter<SignUpState> emit,
  ) async {
    try {
      if (state.email!.isEmpty ||
          state.username!.isEmpty ||
          state.password!.isEmpty ||
          state.confirmPassword!.isEmpty ||
          state.firstName!.isEmpty ||
          state.lastName!.isEmpty ||
          state.mobile!.isEmpty ||
          state.country!.isEmpty ||
          state.birthday!.isEmpty ||
          state.address!.isEmpty ||
          state.countryCode!.isEmpty) return;

      emit(state.copyWith(registrationStatus: RegistrationStatus.loading));

      await _authRepository.register(
        email: state.email!,
        username: state.username!,
        password: state.password!,
        confirmPassword: state.confirmPassword!,
        firstName: state.firstName!,
        lastName: state.lastName!,
        middleName: state.middleName ?? "",
        mobile: state.mobile!,
        country: state.country!,
        birthday: state.birthday!,
        location: state.address!,
        countryCode: state.countryCode!,
        duressPassword: state.duressPassword ?? "",
        confirmDuressPassword: state.confirmDuressPassword ?? "",
        relationship: state.relationship ?? "",
      );
      emit(state.copyWith(registrationStatus: RegistrationStatus.success));
    } catch (e) {
      emit(state.copyWith(registrationStatus: RegistrationStatus.failed));
      rethrow;
    }
  }
}
