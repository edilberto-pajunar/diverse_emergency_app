import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_user.g.dart';

@JsonSerializable()
class AppUser extends Equatable {
  final String id;
  final String? displayName;
  final String? email;
  final String? phoneNumber;
  final String? photoUrl;

  const AppUser({
    required this.id,
    this.displayName,
    this.email,
    this.phoneNumber,
    this.photoUrl,
  });

  @override
  List<Object?> get props => [
        id,
        displayName,
        email,
        phoneNumber,
        photoUrl,
      ];

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  factory AppUser.create(User user) {
    return AppUser(
      id: user.uid,
      displayName: user.displayName,
      email: user.email,
      phoneNumber: user.phoneNumber,
      photoUrl: user.photoURL,
    );
  }

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
