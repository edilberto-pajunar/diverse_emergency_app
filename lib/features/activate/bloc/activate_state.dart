part of 'activate_bloc.dart';

sealed class ActivateState extends Equatable {
  const ActivateState();
  
  @override
  List<Object> get props => [];
}

final class ActivateInitial extends ActivateState {}
