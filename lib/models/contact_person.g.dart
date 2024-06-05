// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactPerson _$ContactPersonFromJson(Map<String, dynamic> json) =>
    ContactPerson(
      username: json['username'] as String,
      id: json['id'] as String,
      relationship: json['relationship'] as String,
      emailVerified: json['emailVerified'] as bool? ?? false,
      phoneVerified: json['phoneVerified'] as bool? ?? false,
      contactType:
          $enumDecodeNullable(_$ContactTypeEnumMap, json['contactType']) ??
              ContactType.primary,
    );

Map<String, dynamic> _$ContactPersonToJson(ContactPerson instance) =>
    <String, dynamic>{
      'username': instance.username,
      'id': instance.id,
      'relationship': instance.relationship,
      'emailVerified': instance.emailVerified,
      'phoneVerified': instance.phoneVerified,
      'contactType': _$ContactTypeEnumMap[instance.contactType]!,
    };

const _$ContactTypeEnumMap = {
  ContactType.primary: 'primary',
  ContactType.taglist: 'taglist',
};
