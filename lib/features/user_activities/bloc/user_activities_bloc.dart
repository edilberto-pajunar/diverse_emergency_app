import 'package:bloc/bloc.dart';
import 'package:emergency_test/models/contact_person.dart';
import 'package:equatable/equatable.dart';

part 'user_activities_event.dart';
part 'user_activities_state.dart';

class UserActivitiesBloc
    extends Bloc<UserActivitiesEvent, UserActivitiesState> {
  UserActivitiesBloc() : super(const UserActivitiesState()) {
    on<UserContactTypeTapped>(_onContactTypeTapped);
  }

  void _onContactTypeTapped(
    UserContactTypeTapped event,
    Emitter<UserActivitiesState> emit,
  ) {
    emit(state.copyWith(contactType: event.contactType));
  }
}
