import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_contact_event.dart';
part 'add_contact_state.dart';

class AddContactBloc extends Bloc<AddContactEvent, AddContactState> {
  AddContactBloc() : super(AddContactInitial()) {
    on<AddContactEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
