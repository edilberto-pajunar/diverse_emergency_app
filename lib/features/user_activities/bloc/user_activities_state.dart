part of 'user_activities_bloc.dart';

enum ContactType { primary, taglist }

final class UserActivitiesState extends Equatable {
  final ContactType contactType;
  final List<ContactPerson> contactPersons;

  const UserActivitiesState({
    this.contactType = ContactType.primary,
    this.contactPersons = ContactPerson.contactPersons,
  });

  UserActivitiesState copyWith({
    ContactType? contactType,
    List<ContactPerson>? contactPersons,
  }) {
    return UserActivitiesState(
      contactType: contactType ?? this.contactType,
      contactPersons: contactPersons ?? this.contactPersons,
    );
  }

  @override
  List<Object> get props => [contactType, contactPersons];
}
