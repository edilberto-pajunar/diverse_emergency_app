import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'activate_event.dart';
part 'activate_state.dart';

class ActivateBloc extends Bloc<ActivateEvent, ActivateState> {
  ActivateBloc() : super(ActivateInitial()) {
    on<ActivateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
