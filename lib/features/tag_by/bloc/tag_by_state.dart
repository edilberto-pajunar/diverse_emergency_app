part of 'tag_by_bloc.dart';

final class TagByState extends Equatable {
  final List<String> tags;
  const TagByState({
    this.tags = const [],
  });

  TagByState copyWith({
    List<String>? tags,
  }) {
    return TagByState(tags: tags ?? this.tags);
  }

  @override
  List<Object> get props => [tags];
}
