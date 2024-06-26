part of 'user_activities_bloc.dart';

enum ContactType { primary, taglist }

enum EmergencyStatus { idle, loading, success, failed }

enum ContactStatus { idle, loading, success, failed }

enum ResolveStatus { idle, loading, success, failed }

final class UserActivitiesState extends Equatable {
  final ContactType contactType;
  final List<ContactPerson> contactPersons;
  final EmergencyStatus emergencyStatus;
  final String emergencyResponse;
  final ContactStatus contactStatus;
  final List<UnresolvedRequest> unresolvedRequest;
  final String? error;
  final ResolveStatus resolveStatus;
  final String? resolveResponse;

  const UserActivitiesState({
    this.contactType = ContactType.primary,
    this.contactPersons = const [],
    this.emergencyStatus = EmergencyStatus.idle,
    this.emergencyResponse = "",
    this.contactStatus = ContactStatus.idle,
    this.unresolvedRequest = const [],
    this.error,
    this.resolveStatus = ResolveStatus.idle,
    this.resolveResponse = "",
  });

  UserActivitiesState copyWith({
    ContactType? contactType,
    List<ContactPerson>? contactPersons,
    EmergencyStatus? emergencyStatus,
    String? emergencyResponse,
    ContactStatus? contactStatus,
    List<UnresolvedRequest>? unresolvedRequest,
    String? error,
    ResolveStatus? resolveStatus,
    String? resolveResponse,
  }) {
    return UserActivitiesState(
      contactType: contactType ?? this.contactType,
      contactPersons: contactPersons ?? this.contactPersons,
      emergencyStatus: emergencyStatus ?? this.emergencyStatus,
      emergencyResponse: emergencyResponse ?? this.emergencyResponse,
      contactStatus: contactStatus ?? this.contactStatus,
      unresolvedRequest: unresolvedRequest ?? this.unresolvedRequest,
      error: error ?? this.error,
      resolveStatus: resolveStatus ?? this.resolveStatus,
      resolveResponse: resolveResponse ?? this.resolveResponse,
    );
  }

  @override
  List<Object?> get props => [
        contactType,
        contactPersons,
        emergencyStatus,
        emergencyResponse,
        contactStatus,
        unresolvedRequest,
        resolveStatus,
        resolveResponse,
      ];
}
