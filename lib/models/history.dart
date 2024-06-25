import 'package:json_annotation/json_annotation.dart';
part 'history.g.dart';

bool intToBool(int value) => value == 1;
int boolToInt(bool? value) => value! ? 1 : 0;

@JsonSerializable()
class History {
  @JsonKey(name: "fullname")
  final String? fullname;
  @JsonKey(name: "pro_pic")
  final String? proPic;
  @JsonKey(name: "notif_row_id")
  final String? notifRowId;
  @JsonKey(name: "markasread")
  final int? markasread;
  @JsonKey(name: "message_notif")
  final String? messageNotif;
  @JsonKey(name: "notif_type")
  final String? notifType;
  @JsonKey(name: "data_type")
  final DataType? dataType;
  @JsonKey(name: "datetime")
  final String? datetime;
  @JsonKey(name: "review")
  final dynamic review;
  @JsonKey(name: "emergency_location")
  final String? emergencyLocation;
  @JsonKey(name: "resolved", fromJson: intToBool, toJson: boolToInt)
  final bool? resolved;

  History({
    this.fullname,
    this.proPic,
    this.notifRowId,
    this.markasread,
    this.messageNotif,
    this.notifType,
    this.dataType,
    this.datetime,
    this.review,
    this.emergencyLocation,
    this.resolved,
  });

  History copyWith({
    String? fullname,
    String? proPic,
    String? notifRowId,
    int? markasread,
    String? messageNotif,
    String? notifType,
    DataType? dataType,
    String? datetime,
    dynamic review,
    String? emergencyLocation,
    bool? resolved,
  }) =>
      History(
        fullname: fullname ?? this.fullname,
        proPic: proPic ?? this.proPic,
        notifRowId: notifRowId ?? this.notifRowId,
        markasread: markasread ?? this.markasread,
        messageNotif: messageNotif ?? this.messageNotif,
        notifType: notifType ?? this.notifType,
        dataType: dataType ?? this.dataType,
        datetime: datetime ?? this.datetime,
        review: review ?? this.review,
        emergencyLocation: emergencyLocation ?? this.emergencyLocation,
        resolved: resolved ?? this.resolved,
      );

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}

@JsonSerializable()
class DataType {
  @JsonKey(name: "longitude")
  final String? longitude;
  @JsonKey(name: "latitude")
  final String? latitude;
  @JsonKey(name: "date_request")
  final DateTime? dateRequest;

  DataType({
    this.longitude,
    this.latitude,
    this.dateRequest,
  });

  DataType copyWith({
    String? longitude,
    String? latitude,
    DateTime? dateRequest,
  }) =>
      DataType(
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        dateRequest: dateRequest ?? this.dateRequest,
      );

  factory DataType.fromJson(Map<String, dynamic> json) =>
      _$DataTypeFromJson(json);

  Map<String, dynamic> toJson() => _$DataTypeToJson(this);
}
