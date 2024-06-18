import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<SignUpInitRequested>(_onInitRequested);
    on<SignUpPersonalInfoSubmitted>(_onPersonalInfoSubmitted);
    on<SignUpBirthdaySubmitted>(_onBirthdaySubmitted);
    on<SignUpGenderSubmitted>(_onGenderSubmitted);
    on<SignUpHomeAddressRequested>(_onHomeAddressRequested);
    on<SignUpSecuritySubmitted>(_onSecuritySubmitted);
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
    emit(state.copyWith(
      country: event.country,
      address: event.address,
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
}
