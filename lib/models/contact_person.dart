import 'package:emergency_test/features/user_activities/bloc/user_activities_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_person.g.dart';

@JsonSerializable()
class ContactPerson extends Equatable {
  final String username;
  final String id;
  final String relationship;
  final bool emailVerified;
  final bool phoneVerified;
  final ContactType contactType;

  const ContactPerson({
    required this.username,
    required this.id,
    required this.relationship,
    this.emailVerified = false,
    this.phoneVerified = false,
    this.contactType = ContactType.primary,
  });

  factory ContactPerson.fromJson(Map<String, dynamic> json) =>
      _$ContactPersonFromJson(json);

  Map<String, dynamic> toJson() => _$ContactPersonToJson(this);

  @override
  List<Object?> get props => [
        username,
        id,
        relationship,
        emailVerified,
        phoneVerified,
        contactType,
      ];

  static List<String> relationships = [
    "Family",
    "Friend",
    "Colleague",
    "Other",
  ];

  static const contactPersons = [
    ContactPerson(
      username: "test 1",
      id: "1",
      relationship: "Family",
      emailVerified: true,
      phoneVerified: true,
    ),
    ContactPerson(
      username: "test 2",
      id: "2",
      relationship: "Colleague",
    ),
  ];
}
