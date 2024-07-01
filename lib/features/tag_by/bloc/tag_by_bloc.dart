import 'package:bloc/bloc.dart';
import 'package:emergency_test/repository/activity_repository.dart';
import 'package:emergency_test/repository/local_repository.dart';
import 'package:equatable/equatable.dart';

part 'tag_by_event.dart';
part 'tag_by_state.dart';

class TagByBloc extends Bloc<TagByEvent, TagByState> {
  final ActivityRepository _activityRepository;

  TagByBloc({
    required ActivityRepository activityRepository,
  })  : _activityRepository = activityRepository,
        super(const TagByState()) {
    on<TagByInitRequested>(_initRequested);
  }

  void _initRequested(
    TagByInitRequested event,
    Emitter<TagByState> emit,
  ) async {
    final token = LocalRepository.getString("token");

    if (token == null) return;
    try {
      final tags = await _activityRepository.getTaggedBy(token);
      emit(state.copyWith(
        tags: tags,
      ));
    } catch (e) {
      rethrow;
    }
  }
}
