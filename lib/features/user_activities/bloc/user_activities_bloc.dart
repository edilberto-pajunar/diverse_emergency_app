import 'package:bloc/bloc.dart';
import 'package:emergency_test/models/app_location.dart';
import 'package:emergency_test/models/contact_person.dart';
import 'package:emergency_test/models/unresolved_request.dart';
import 'package:emergency_test/repository/local_repository.dart';
import 'package:emergency_test/repository/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_activities_event.dart';
part 'user_activities_state.dart';

class UserActivitiesBloc
    extends Bloc<UserActivitiesEvent, UserActivitiesState> {
  final UserRepository _userRepository;

  UserActivitiesBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const UserActivitiesState()) {
    on<UserActivitiesInitRequested>(_onInitRequested);
    on<UserActivitiesInitContactsRequested>(_onInitContactsRequested);
    on<UserActivitiesContactTypeTapped>(_onContactTypeTapped);
    on<UserActivitiesExploreTapped>(_onExploreTapped);
    on<UserActivitiesUnresolvedExploreRequested>(_onUnresolvedExploreRequested);
    on<UserActivitiesFailedTriggered>(_onFailedTriggered);
    on<UserActivitiesResolveRequested>(_onResolveRequested);
  }

  void _onInitRequested(
    UserActivitiesInitRequested event,
    Emitter<UserActivitiesState> emit,
  ) {
    add(UserActivitiesInitContactsRequested());
    add(UserActivitiesUnresolvedExploreRequested());
  }

  void _onInitContactsRequested(
    UserActivitiesInitContactsRequested event,
    Emitter<UserActivitiesState> emit,
  ) async {
    final token = LocalRepository.getString("token");

    if (token == null) return;
    try {
      emit(state.copyWith(contactStatus: ContactStatus.loading));
      final contactPersons =
          await _userRepository.getContactPersons(token, true);
      emit(state.copyWith(
        contactPersons: contactPersons,
        contactStatus: ContactStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(contactStatus: ContactStatus.failed));
    }
  }

  void _onContactTypeTapped(
    UserActivitiesContactTypeTapped event,
    Emitter<UserActivitiesState> emit,
  ) async {
    final token = LocalRepository.getString("token");

    if (token == null) return;
    emit(state.copyWith(contactType: event.contactType));

    try {
      emit(state.copyWith(contactStatus: ContactStatus.loading));
      final contactPersons = await _userRepository.getContactPersons(
        token,
        event.contactType == ContactType.primary ? true : false,
      );
      emit(state.copyWith(
          contactPersons: contactPersons,
          contactStatus: ContactStatus.success));
    } catch (e) {
      emit(state.copyWith(contactStatus: ContactStatus.failed));
    }
  }

  void _onExploreTapped(
    UserActivitiesExploreTapped event,
    Emitter<UserActivitiesState> emit,
  ) async {
    final token = LocalRepository.getString("token");

    if (token == null) return;
    try {
      emit(state.copyWith(emergencyStatus: EmergencyStatus.loading));
      final response = await _userRepository.sendEmergency(
        token,
        event.location,
      );
      emit(state.copyWith(
        emergencyStatus: EmergencyStatus.success,
        emergencyResponse: response,
      ));
    } catch (e) {
      emit(state.copyWith(emergencyStatus: EmergencyStatus.failed));
    }
  }

  void _onUnresolvedExploreRequested(
    UserActivitiesUnresolvedExploreRequested event,
    Emitter<UserActivitiesState> emit,
  ) async {
    final token = LocalRepository.getString("token");
    if (token == null) return;

    try {
      final unresolvedRequest =
          await _userRepository.getUnresolvedRequest(token);
      emit(state.copyWith(
        unresolvedRequest: unresolvedRequest,
      ));
    } catch (e) {
      add(UserActivitiesFailedTriggered(error: e.toString()));
    }
  }

  void _onResolveRequested(
    UserActivitiesResolveRequested event,
    Emitter<UserActivitiesState> emit,
  ) async {
    final token = LocalRepository.getString("token");
    if (token == null || event.locationId!.isEmpty) return;

    try {
      emit(state.copyWith(
        resolveStatus: ResolveStatus.loading,
      ));

      final response = await _userRepository.resolveRequest(
        token,
        event.locationId!,
      );
      add(UserActivitiesUnresolvedExploreRequested());

      emit(state.copyWith(
        resolveStatus: ResolveStatus.success,
        resolveResponse: response,
      ));
    } catch (e) {
      add(UserActivitiesFailedTriggered(error: e.toString()));
    }
  }

  void _onFailedTriggered(
    UserActivitiesFailedTriggered event,
    Emitter<UserActivitiesState> emit,
  ) async {
    emit(state.copyWith(error: event.error));
  }
}
