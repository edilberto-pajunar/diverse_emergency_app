part of 'members_bloc.dart';

final class MembersState extends Equatable {
  final List<String> fullName;

  const MembersState({
    this.fullName = const [],
  });

  MembersState copyWith({
    List<String>? fullName,
  }) {
    return MembersState(
      fullName: fullName ?? this.fullName,
    );
  }

  @override
  List<Object?> get props => [fullName];
}
