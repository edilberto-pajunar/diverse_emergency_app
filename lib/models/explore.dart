import 'package:json_annotation/json_annotation.dart';

part 'explore.g.dart';

@JsonSerializable()
class Explore {
  @JsonKey(name: "0")
  final String? the0;
  @JsonKey(name: "1")
  final dynamic the1;
  @JsonKey(name: "result")
  final int? result;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "firebase_return_id")
  final dynamic firebaseReturnId;
  @JsonKey(name: "test_request")
  final dynamic testRequest;
  @JsonKey(name: "longitude")
  final String? longitude;
  @JsonKey(name: "latitude")
  final String? latitude;
  @JsonKey(name: "link")
  final String? link;
  @JsonKey(name: "link_message")
  final String? linkMessage;
  @JsonKey(name: "list_member_mobile_tagged")
  final List<ListMemberMobileTagged>? listMemberMobileTagged;
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "nearby_category")
  final ExploreNearbyCategory? nearbyCategory;
  @JsonKey(name: "ern_code")
  final String? ernCode;
  @JsonKey(name: "media_restrict")
  final int? mediaRestrict;
  @JsonKey(name: "address")
  final String? address;

  Explore({
    this.the0,
    this.the1,
    this.result,
    this.message,
    this.firebaseReturnId,
    this.testRequest,
    this.longitude,
    this.latitude,
    this.link,
    this.linkMessage,
    this.listMemberMobileTagged,
    this.id,
    this.nearbyCategory,
    this.ernCode,
    this.mediaRestrict,
    this.address,
  });

  Explore copyWith({
    String? the0,
    dynamic the1,
    int? result,
    String? message,
    dynamic firebaseReturnId,
    dynamic testRequest,
    String? longitude,
    String? latitude,
    String? link,
    String? linkMessage,
    List<ListMemberMobileTagged>? listMemberMobileTagged,
    String? id,
    ExploreNearbyCategory? nearbyCategory,
    String? ernCode,
    int? mediaRestrict,
    String? address,
  }) =>
      Explore(
        the0: the0 ?? this.the0,
        the1: the1 ?? this.the1,
        result: result ?? this.result,
        message: message ?? this.message,
        firebaseReturnId: firebaseReturnId ?? this.firebaseReturnId,
        testRequest: testRequest ?? this.testRequest,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        link: link ?? this.link,
        linkMessage: linkMessage ?? this.linkMessage,
        listMemberMobileTagged:
            listMemberMobileTagged ?? this.listMemberMobileTagged,
        id: id ?? this.id,
        nearbyCategory: nearbyCategory ?? this.nearbyCategory,
        ernCode: ernCode ?? this.ernCode,
        mediaRestrict: mediaRestrict ?? this.mediaRestrict,
        address: address ?? this.address,
      );

  factory Explore.fromJson(Map<String, dynamic> json) =>
      _$ExploreFromJson(json);

  Map<String, dynamic> toJson() => _$ExploreToJson(this);
}

@JsonSerializable()
class ListMemberMobileTagged {
  @JsonKey(name: "fullname")
  final String? fullname;
  @JsonKey(name: "mobile")
  final String? mobile;
  @JsonKey(name: "check")
  final String? check;
  @JsonKey(name: "link_message")
  final String? linkMessage;

  ListMemberMobileTagged({
    this.fullname,
    this.mobile,
    this.check,
    this.linkMessage,
  });

  ListMemberMobileTagged copyWith({
    String? fullname,
    String? mobile,
    String? check,
    String? linkMessage,
  }) =>
      ListMemberMobileTagged(
        fullname: fullname ?? this.fullname,
        mobile: mobile ?? this.mobile,
        check: check ?? this.check,
        linkMessage: linkMessage ?? this.linkMessage,
      );

  factory ListMemberMobileTagged.fromJson(Map<String, dynamic> json) =>
      _$ListMemberMobileTaggedFromJson(json);

  Map<String, dynamic> toJson() => _$ListMemberMobileTaggedToJson(this);
}

@JsonSerializable()
class ExploreNearbyCategory {
  @JsonKey(name: "nearby_category")
  final List<NearbyCategoryElement>? nearbyCategory;

  ExploreNearbyCategory({
    this.nearbyCategory,
  });

  ExploreNearbyCategory copyWith({
    List<NearbyCategoryElement>? nearbyCategory,
  }) =>
      ExploreNearbyCategory(
        nearbyCategory: nearbyCategory ?? this.nearbyCategory,
      );

  factory ExploreNearbyCategory.fromJson(Map<String, dynamic> json) =>
      _$ExploreNearbyCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ExploreNearbyCategoryToJson(this);
}

@JsonSerializable()
class NearbyCategoryElement {
  @JsonKey(name: "kyc_verified")
  final int? kycVerified;
  @JsonKey(name: "nearby_title")
  final String? nearbyTitle;
  @JsonKey(name: "query")
  final String? query;
  @JsonKey(name: "pin_src")
  final String? pinSrc;
  @JsonKey(name: "nearby_id")
  final String? nearbyId;
  @JsonKey(name: "active")
  final String? active;
  @JsonKey(name: "restrict")
  final String? restrict;
  @JsonKey(name: "national_data")
  final dynamic nationalData;

  NearbyCategoryElement({
    this.kycVerified,
    this.nearbyTitle,
    this.query,
    this.pinSrc,
    this.nearbyId,
    this.active,
    this.restrict,
    this.nationalData,
  });

  NearbyCategoryElement copyWith({
    int? kycVerified,
    String? nearbyTitle,
    String? query,
    String? pinSrc,
    String? nearbyId,
    String? active,
    String? restrict,
    dynamic nationalData,
  }) =>
      NearbyCategoryElement(
        kycVerified: kycVerified ?? this.kycVerified,
        nearbyTitle: nearbyTitle ?? this.nearbyTitle,
        query: query ?? this.query,
        pinSrc: pinSrc ?? this.pinSrc,
        nearbyId: nearbyId ?? this.nearbyId,
        active: active ?? this.active,
        restrict: restrict ?? this.restrict,
        nationalData: nationalData ?? this.nationalData,
      );

  factory NearbyCategoryElement.fromJson(Map<String, dynamic> json) =>
      _$NearbyCategoryElementFromJson(json);

  Map<String, dynamic> toJson() => _$NearbyCategoryElementToJson(this);
}
