import 'package:bloc/bloc.dart';
import 'package:emergency_test/models/app_location.dart';
import 'package:emergency_test/models/contact_person.dart';
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
    on<UserContactTypeTapped>(_onContactTypeTapped);
    on<UserExploreTapped>(_onExploreTapped);
  }

  void _onContactTypeTapped(
    UserContactTypeTapped event,
    Emitter<UserActivitiesState> emit,
  ) {
    emit(state.copyWith(contactType: event.contactType));
  }

  void _onExploreTapped(
    UserExploreTapped event,
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
}
