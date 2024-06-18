part of 'signup_bloc.dart';

final class SignUpState extends Equatable {
  final String? email;
  final String? username;
  final String? password;
  final String? confirmPassword;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final String? mobile;
  final String? country;
  final String? birthday;
  final String? gender;
  final String? countryCode;
  final String? duressPassword;
  final String? confirmDuressPassword;
  final String? relationship;
  final String? address;

  const SignUpState({
    this.email,
    this.username,
    this.password,
    this.confirmPassword,
    this.firstName,
    this.lastName,
    this.middleName,
    this.mobile,
    this.country,
    this.birthday,
    this.gender,
    this.countryCode,
    this.duressPassword,
    this.confirmDuressPassword,
    this.relationship,
    this.address,
  });

  SignUpState copyWith({
    String? email,
    String? username,
    String? password,
    String? confirmPassword,
    String? firstName,
    String? lastName,
    String? middleName,
    String? mobile,
    String? country,
    String? birthday,
    String? gender,
    String? countryCode,
    String? duressPassword,
    String? confirmDuressPassword,
    String? relationship,
    String? address,
  }) {
    return SignUpState(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      mobile: mobile ?? this.mobile,
      country: country ?? this.country,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
      countryCode: countryCode ?? this.countryCode,
      duressPassword: duressPassword ?? this.duressPassword,
      confirmDuressPassword:
          confirmDuressPassword ?? this.confirmDuressPassword,
      relationship: relationship ?? this.relationship,
      address: address ?? this.address,
    );
  }

  @override
  List<Object?> get props => [
        email,
        username,
        password,
        confirmPassword,
        firstName,
        lastName,
        middleName,
        mobile,
        country,
        birthday,
        gender,
        countryCode,
        duressPassword,
        confirmDuressPassword,
        relationship,
        address,
      ];
}
