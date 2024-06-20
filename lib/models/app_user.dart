import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_user.g.dart';

bool intToBool(int value) => value == 1;
int boolToInt(bool value) => value ? 1 : 0;

@JsonSerializable(explicitToJson: true)
class AppUser extends Equatable {
  @JsonKey(fromJson: intToBool, toJson: boolToInt)
  final bool result;
  final String? message;
  @JsonKey(name: "member_id")
  final String? memberId;
  @JsonKey(name: "fullname")
  final String? fullName;
  @JsonKey(name: "member_level")
  final String? memberLevel;
  @JsonKey(name: "profile_pic")
  final String? profilePic;
  @JsonKey(fromJson: intToBool, toJson: boolToInt)
  final bool verified;
  final String? fName;
  final String? lName;

  const AppUser({
    required this.result,
    this.message = "",
    this.memberId = "",
    this.fullName = "",
    this.memberLevel = "",
    this.profilePic = "",
    required this.verified,
    this.fName,
    this.lName,
  });

  @override
  List<Object?> get props => [
        result,
        message,
        fullName,
        memberLevel,
        profilePic,
        verified,
        fName,
        lName,
      ];

  AppUser copyWith({
    bool? result,
    String? message,
    String? fullName,
    String? memberLevel,
    String? profilePic,
    bool? verified,
    String? fName,
    String? lName,
  }) {
    return AppUser(
      result: result ?? this.result,
      message: message ?? this.message,
      fullName: fullName ?? this.fullName,
      memberLevel: memberLevel ?? this.memberLevel,
      profilePic: profilePic ?? this.profilePic,
      verified: verified ?? this.verified,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
    );
  }

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
