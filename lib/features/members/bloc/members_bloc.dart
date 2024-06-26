import 'package:bloc/bloc.dart';
import 'package:emergency_test/repository/activity_repository.dart';
import 'package:emergency_test/repository/local_repository.dart';
import 'package:equatable/equatable.dart';

part 'members_event.dart';
part 'members_state.dart';

class MembersBloc extends Bloc<MembersEvent, MembersState> {
  final ActivityRepository _activityRepository;

  MembersBloc({
    required ActivityRepository activityRepository,
  })  : _activityRepository = activityRepository,
        super(const MembersState()) {
    on<MembersSearchRequested>(_onSearchRequested);
  }

  void _onSearchRequested(
    MembersSearchRequested event,
    Emitter<MembersState> emit,
  ) async {
    final token = LocalRepository.getString("token");

    if (token == null) return;

    try {
      final fullName =
          await _activityRepository.searchMembers(token, event.name!);
      emit(state.copyWith(fullName: fullName));
    } catch (e) {
      rethrow;
    }
  }
}
