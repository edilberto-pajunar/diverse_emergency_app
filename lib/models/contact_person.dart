import 'package:json_annotation/json_annotation.dart';

part 'contact_person.g.dart';

bool intToBool(int value) => value == 1;
int boolToInt(bool? value) => value! ? 1 : 0;

@JsonSerializable()
class ContactPerson {
  @JsonKey(name: "primary_set")
  final int? primarySet;
  @JsonKey(name: "sms_receiver")
  final int? smsReceiver;
  @JsonKey(name: "fullname")
  final String? fullname;
  @JsonKey(name: "tag_status")
  final int? tagStatus;
  @JsonKey(name: "date_approved")
  final DateTime? dateApproved;
  @JsonKey(name: "relationship")
  final dynamic relationship;
  @JsonKey(name: "member_id")
  final String? memberId;
  @JsonKey(name: "tag_member_id")
  final String? tagMemberId;
  @JsonKey(name: "row_id")
  final String? rowId;
  @JsonKey(name: "shared_location_allow")
  final int? sharedLocationAllow;
  @JsonKey(name: "pro_pic")
  final String? proPic;
  @JsonKey(name: "relationship_status")
  final int? relationshipStatus;
  @JsonKey(name: "shared_device_allow")
  final int? sharedDeviceAllow;
  @JsonKey(name: "receive")
  final int? receive;
  @JsonKey(name: "email_verified", fromJson: intToBool, toJson: boolToInt)
  final bool? emailVerified;
  @JsonKey(name: "mobile_verified", fromJson: intToBool, toJson: boolToInt)
  final bool? mobileVerified;

  ContactPerson({
    this.primarySet,
    this.smsReceiver,
    this.fullname,
    this.tagStatus,
    this.dateApproved,
    this.relationship,
    this.memberId,
    this.tagMemberId,
    this.rowId,
    this.sharedLocationAllow,
    this.proPic,
    this.relationshipStatus,
    this.sharedDeviceAllow,
    this.receive,
    this.emailVerified,
    this.mobileVerified,
  });

  ContactPerson copyWith({
    int? primarySet,
    int? smsReceiver,
    String? fullname,
    int? tagStatus,
    DateTime? dateApproved,
    dynamic relationship,
    String? memberId,
    String? tagMemberId,
    String? rowId,
    int? sharedLocationAllow,
    String? proPic,
    int? relationshipStatus,
    int? sharedDeviceAllow,
    int? receive,
    bool? emailVerified,
    bool? mobileVerified,
  }) =>
      ContactPerson(
        primarySet: primarySet ?? this.primarySet,
        smsReceiver: smsReceiver ?? this.smsReceiver,
        fullname: fullname ?? this.fullname,
        tagStatus: tagStatus ?? this.tagStatus,
        dateApproved: dateApproved ?? this.dateApproved,
        relationship: relationship ?? this.relationship,
        memberId: memberId ?? this.memberId,
        tagMemberId: tagMemberId ?? this.tagMemberId,
        rowId: rowId ?? this.rowId,
        sharedLocationAllow: sharedLocationAllow ?? this.sharedLocationAllow,
        proPic: proPic ?? this.proPic,
        relationshipStatus: relationshipStatus ?? this.relationshipStatus,
        sharedDeviceAllow: sharedDeviceAllow ?? this.sharedDeviceAllow,
        receive: receive ?? this.receive,
        emailVerified: emailVerified ?? this.emailVerified,
        mobileVerified: mobileVerified ?? this.mobileVerified,
      );

  factory ContactPerson.fromJson(Map<String, dynamic> json) =>
      _$ContactPersonFromJson(json);

  Map<String, dynamic> toJson() => _$ContactPersonToJson(this);
}
