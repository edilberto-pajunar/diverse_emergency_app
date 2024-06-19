part of 'signup_bloc.dart';

final class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

final class SignUpInitRequested extends SignUpEvent {}

final class SignUpPersonalInfoSubmitted extends SignUpEvent {
  final String? firstName;
  final String? middleName;
  final String? lastName;

  const SignUpPersonalInfoSubmitted({
    this.firstName,
    this.middleName,
    this.lastName,
  });
}

final class SignUpBirthdaySubmitted extends SignUpEvent {
  final DateTime? birthday;

  const SignUpBirthdaySubmitted({
    required this.birthday,
  });
}

final class SignUpGenderSubmitted extends SignUpEvent {
  final String gender;

  const SignUpGenderSubmitted({
    required this.gender,
  });
}

final class SignUpHomeAddressRequested extends SignUpEvent {
  final String? country;
  final String? address;

  const SignUpHomeAddressRequested({
    this.country,
    this.address,
  });
}

final class SignUpSecuritySubmitted extends SignUpEvent {
  final String? countryCode;
  final String? contactNumber;
  final String? username;
  final String? emailAddress;
  final String? password;
  final String? confirmPassword;

  const SignUpSecuritySubmitted({
    this.countryCode,
    this.contactNumber,
    this.username,
    this.emailAddress,
    this.password,
    this.confirmPassword,
  });
}

final class SignUpRegisterRequested extends SignUpEvent {}
