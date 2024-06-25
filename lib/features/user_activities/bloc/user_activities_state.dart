part of 'user_activities_bloc.dart';

enum ContactType { primary, taglist }

enum EmergencyStatus { idle, loading, success, failed }

enum ContactStatus { idle, loading, success, failed }

final class UserActivitiesState extends Equatable {
  final ContactType contactType;
  final List<ContactPerson> contactPersons;
  final EmergencyStatus emergencyStatus;
  final String emergencyResponse;
  final ContactStatus contactStatus;

  const UserActivitiesState({
    this.contactType = ContactType.primary,
    this.contactPersons = const [],
    this.emergencyStatus = EmergencyStatus.idle,
    this.emergencyResponse = "",
    this.contactStatus = ContactStatus.idle,
  });

  UserActivitiesState copyWith({
    ContactType? contactType,
    List<ContactPerson>? contactPersons,
    EmergencyStatus? emergencyStatus,
    String? emergencyResponse,
    ContactStatus? contactStatus,
  }) {
    return UserActivitiesState(
      contactType: contactType ?? this.contactType,
      contactPersons: contactPersons ?? this.contactPersons,
      emergencyStatus: emergencyStatus ?? this.emergencyStatus,
      emergencyResponse: emergencyResponse ?? this.emergencyResponse,
      contactStatus: contactStatus ?? this.contactStatus,
    );
  }

  @override
  List<Object> get props => [
        contactType,
        contactPersons,
        emergencyStatus,
        emergencyResponse,
        contactStatus,
      ];
}
