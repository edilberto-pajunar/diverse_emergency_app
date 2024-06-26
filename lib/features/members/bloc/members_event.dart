part of 'members_bloc.dart';

final class MembersEvent extends Equatable {
  const MembersEvent();

  @override
  List<Object> get props => [];
}

final class MembersSearchRequested extends MembersEvent {
  final String? name;

  const MembersSearchRequested({
    required this.name,
  });
}
