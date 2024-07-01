import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emergency_test/models/app_location.dart';
import 'package:emergency_test/models/contact_person.dart';
import 'package:emergency_test/models/explore.dart';
import 'package:emergency_test/models/unresolved_request.dart';
import 'package:emergency_test/repository/local_repository.dart';
import 'package:emergency_test/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_sms/flutter_sms.dart';

part 'user_activities_event.dart';
part 'user_activities_state.dart';

class UserActivitiesBloc
    extends Bloc<UserActivitiesEvent, UserActivitiesState> {
  final UserRepository _userRepository;
  StreamSubscription<int>? _tickerSubscription;

  UserActivitiesBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const UserActivitiesState()) {
    on<UserActivitiesInitRequested>(_onInitRequested);
    on<UserActivitiesInitContactsRequested>(_onInitContactsRequested);
    on<UserActivitiesContactTypeTapped>(_onContactTypeTapped);
    on<UserActivitiesExploreTapped>(_onExploreTapped);
    on<UserActivitiesUnresolvedExploreRequested>(_onUnresolvedExploreRequested);
    on<UserActivitiesFailedTriggered>(_onFailedTriggered);
    on<UserActivitiesResolveRequested>(_onResolveRequested);
    on<UserActivitiesCountdownTriggered>(_onCountdownTriggered);
    on<UserActivitiesStartCountdownTriggered>(_onCountStartdownTriggered);
    on<UserActivitiesSendEmergencyRequested>(_onSendEmergencyRequested);
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
    // add(const UserActivitiesCountdownTriggered());
    final token = LocalRepository.getString("token");

    if (token == null) return;
    try {
      emit(state.copyWith(emergencyStatus: EmergencyStatus.loading));
      final response = await _userRepository.sendEmergency(
        token,
        event.location,
      );

      add(UserActivitiesSendEmergencyRequested(
        message: response.linkMessage!,
        explore: response,
      ));

      emit(state.copyWith(
        emergencyStatus: EmergencyStatus.success,
        emergencyResponse: response,
      ));
    } catch (e) {
      emit(state.copyWith(
          emergencyStatus: EmergencyStatus.failed, error: e.toString()));
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

  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => x).take(ticks);
  }

  void _onCountdownTriggered(
    UserActivitiesCountdownTriggered event,
    Emitter<UserActivitiesState> emit,
  ) async {
    // if (event.start) {
    //   emit(state.copyWith(timerStatus: TimerStatus.inProgress, timer: 10));
    // } else {
    //   emit(state.copyWith(timerStatus: TimerStatus.idle));
    //   return;
    // }

    _tickerSubscription?.cancel();

    _tickerSubscription = tick(ticks: 10).listen((duration) {});

    if (state.timerStatus == TimerStatus.inProgress) {
      await emit.forEach(
        tick(ticks: 11),
        onData: (tick) {
          if (state.timer! > 0 && state.timer! <= 10) {
            return state.copyWith(timer: state.timer! - 1);
          } else {
            return state.copyWith(timerStatus: TimerStatus.finished);
          }
        },
      );
    }
  }

  void _onCountStartdownTriggered(
    UserActivitiesStartCountdownTriggered event,
    Emitter<UserActivitiesState> emit,
  ) async {}

  void _onSendEmergencyRequested(
    UserActivitiesSendEmergencyRequested event,
    Emitter<UserActivitiesState> emit,
  ) async {
    await sendSMS(
        message: event.message,
        recipients: event.explore.listMemberMobileTagged!
            .where((member) => member.mobile!.isNotEmpty)
            .map((member) => member.mobile!)
            .toList());
  }

  @override
  Future<void> close() async {
    _tickerSubscription?.cancel();
    super.close();
  }
}
