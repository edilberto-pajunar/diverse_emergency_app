part of 'user_activities_bloc.dart';

enum ContactType { primary, taglist }

enum EmergencyStatus { idle, loading, success, failed }

enum ContactStatus { idle, loading, success, failed }

enum ResolveStatus { idle, loading, success, failed }

enum TimerStatus { idle, inProgress, finished }

final class UserActivitiesState extends Equatable {
  final ContactType contactType;
  final List<ContactPerson> contactPersons;
  final EmergencyStatus emergencyStatus;
  final Explore? emergencyResponse;
  final ContactStatus contactStatus;
  final List<UnresolvedRequest> unresolvedRequest;
  final String? error;
  final ResolveStatus resolveStatus;
  final String? resolveResponse;
  final int? timer;
  final TimerStatus timerStatus;
  final String? ernCode;

  const UserActivitiesState({
    this.contactType = ContactType.primary,
    this.contactPersons = const [],
    this.emergencyStatus = EmergencyStatus.idle,
    this.emergencyResponse,
    this.contactStatus = ContactStatus.idle,
    this.unresolvedRequest = const [],
    this.error,
    this.resolveStatus = ResolveStatus.idle,
    this.resolveResponse = "",
    this.timer = 10,
    this.timerStatus = TimerStatus.idle,
    this.ernCode,
  });

  UserActivitiesState copyWith({
    ContactType? contactType,
    List<ContactPerson>? contactPersons,
    EmergencyStatus? emergencyStatus,
    Explore? emergencyResponse,
    ContactStatus? contactStatus,
    List<UnresolvedRequest>? unresolvedRequest,
    String? error,
    ResolveStatus? resolveStatus,
    String? resolveResponse,
    int? timer,
    TimerStatus? timerStatus,
    String? ernCode,
  }) {
    return UserActivitiesState(
      contactType: contactType ?? this.contactType,
      contactPersons: contactPersons ?? [],
      emergencyStatus: emergencyStatus ?? this.emergencyStatus,
      emergencyResponse: emergencyResponse ?? this.emergencyResponse,
      contactStatus: contactStatus ?? this.contactStatus,
      unresolvedRequest: unresolvedRequest ?? this.unresolvedRequest,
      error: error ?? this.error,
      resolveStatus: resolveStatus ?? this.resolveStatus,
      resolveResponse: resolveResponse ?? this.resolveResponse,
      timer: timer ?? this.timer,
      timerStatus: timerStatus ?? this.timerStatus,
      ernCode: ernCode ?? this.ernCode,
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
        timer,
        timerStatus,
        ernCode,
      ];
}
