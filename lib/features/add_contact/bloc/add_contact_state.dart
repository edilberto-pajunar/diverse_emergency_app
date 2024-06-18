part of 'add_contact_bloc.dart';

sealed class AddContactState extends Equatable {
  const AddContactState();
  
  @override
  List<Object> get props => [];
}

final class AddContactInitial extends AddContactState {}
