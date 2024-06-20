import 'package:json_annotation/json_annotation.dart';

part 'member.g.dart';

bool intToBool(int value) => value == 1;
int boolToInt(bool? value) => value! ? 1 : 0;

@JsonSerializable(explicitToJson: true)
class Member {
  @JsonKey(name: "country_code")
  final String? countryCode;
  @JsonKey(name: "total_credit")
  final int? totalCredit;
  @JsonKey(name: "googleid")
  final dynamic googleid;
  @JsonKey(name: "subscribed_youtube")
  final int? subscribedYoutube;
  @JsonKey(name: "kyc_verified")
  final int? kycVerified;
  @JsonKey(name: "uname")
  final String? uname;
  @JsonKey(name: "total_primary")
  final String? totalPrimary;
  @JsonKey(name: "profile_pic")
  final String? profilePic;
  @JsonKey(name: "fullname")
  final String? fullname;
  @JsonKey(name: "location")
  final String? location;
  @JsonKey(name: "flag")
  final String? flag;
  @JsonKey(name: "member_since")
  final String? memberSince;
  @JsonKey(name: "total_response")
  final String? totalResponse;
  @JsonKey(name: "total_received")
  final String? totalReceived;
  @JsonKey(name: "result_percentage")
  final int? resultPercentage;
  @JsonKey(name: "mobile_number")
  final String? mobileNumber;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "member_id")
  final String? memberId;
  @JsonKey(name: "visitor_id")
  final String? visitorId;
  @JsonKey(name: "birthday")
  final String? birthday;
  @JsonKey(name: "lvl")
  final String? lvl;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "total_tag")
  final String? totalTag;
  @JsonKey(name: "total_tag_by")
  final String? totalTagBy;
  @JsonKey(name: "current_location_status")
  final String? currentLocationStatus;
  @JsonKey(name: "current_pinned_location")
  final dynamic currentPinnedLocation;
  @JsonKey(name: "total_sent_emergency")
  final String? totalSentEmergency;
  @JsonKey(name: "total_sent_response_pts")
  final String? totalSentResponsePts;
  @JsonKey(name: "sent_response_rate")
  final int? sentResponseRate;
  @JsonKey(name: "viber_connected")
  final int? viberConnected;
  @JsonKey(name: "mobile_active")
  final int? mobileActive;
  @JsonKey(name: "invite_link")
  final String? inviteLink;
  @JsonKey(name: "verified", fromJson: intToBool, toJson: boolToInt)
  final bool? verified;
  @JsonKey(name: "m_verified", fromJson: intToBool, toJson: boolToInt)
  final bool? mVerified;

  Member({
    this.countryCode,
    this.totalCredit,
    this.googleid,
    this.subscribedYoutube,
    this.kycVerified,
    this.uname,
    this.totalPrimary,
    this.profilePic,
    this.fullname,
    this.location,
    this.flag,
    this.memberSince,
    this.totalResponse,
    this.totalReceived,
    this.resultPercentage,
    this.mobileNumber,
    this.email,
    this.memberId,
    this.visitorId,
    this.birthday,
    this.lvl,
    this.gender,
    this.totalTag,
    this.totalTagBy,
    this.currentLocationStatus,
    this.currentPinnedLocation,
    this.totalSentEmergency,
    this.totalSentResponsePts,
    this.sentResponseRate,
    this.viberConnected,
    this.mobileActive,
    this.inviteLink,
    this.verified,
    this.mVerified,
  });

  Member copyWith({
    String? countryCode,
    int? totalCredit,
    dynamic googleid,
    int? subscribedYoutube,
    int? kycVerified,
    String? uname,
    String? totalPrimary,
    String? profilePic,
    String? fullname,
    String? location,
    String? flag,
    String? memberSince,
    String? totalResponse,
    String? totalReceived,
    int? resultPercentage,
    String? mobileNumber,
    String? email,
    String? memberId,
    String? visitorId,
    String? birthday,
    String? lvl,
    String? gender,
    String? totalTag,
    String? totalTagBy,
    String? currentLocationStatus,
    dynamic currentPinnedLocation,
    String? totalSentEmergency,
    String? totalSentResponsePts,
    int? sentResponseRate,
    int? viberConnected,
    int? mobileActive,
    String? inviteLink,
    bool? verified,
    bool? mVerified,
  }) =>
      Member(
        countryCode: countryCode ?? this.countryCode,
        totalCredit: totalCredit ?? this.totalCredit,
        googleid: googleid ?? this.googleid,
        subscribedYoutube: subscribedYoutube ?? this.subscribedYoutube,
        kycVerified: kycVerified ?? this.kycVerified,
        uname: uname ?? this.uname,
        totalPrimary: totalPrimary ?? this.totalPrimary,
        profilePic: profilePic ?? this.profilePic,
        fullname: fullname ?? this.fullname,
        location: location ?? this.location,
        flag: flag ?? this.flag,
        memberSince: memberSince ?? this.memberSince,
        totalResponse: totalResponse ?? this.totalResponse,
        totalReceived: totalReceived ?? this.totalReceived,
        resultPercentage: resultPercentage ?? this.resultPercentage,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        email: email ?? this.email,
        memberId: memberId ?? this.memberId,
        visitorId: visitorId ?? this.visitorId,
        birthday: birthday ?? this.birthday,
        lvl: lvl ?? this.lvl,
        gender: gender ?? this.gender,
        totalTag: totalTag ?? this.totalTag,
        totalTagBy: totalTagBy ?? this.totalTagBy,
        currentLocationStatus:
            currentLocationStatus ?? this.currentLocationStatus,
        currentPinnedLocation:
            currentPinnedLocation ?? this.currentPinnedLocation,
        totalSentEmergency: totalSentEmergency ?? this.totalSentEmergency,
        totalSentResponsePts: totalSentResponsePts ?? this.totalSentResponsePts,
        sentResponseRate: sentResponseRate ?? this.sentResponseRate,
        viberConnected: viberConnected ?? this.viberConnected,
        mobileActive: mobileActive ?? this.mobileActive,
        inviteLink: inviteLink ?? this.inviteLink,
        verified: verified ?? this.verified,
        mVerified: mVerified ?? this.mVerified,
      );

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
}
