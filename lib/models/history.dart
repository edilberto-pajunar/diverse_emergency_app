import 'package:emergency_test/models/app_location.dart';
import 'package:emergency_test/models/app_user_info.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'history.g.dart';

@JsonSerializable()
class History extends Equatable {
  final AppUserInfo userInfo;
  final AppLocation currentLocation;

  const History({
    required this.userInfo,
    required this.currentLocation,
  });

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryToJson(this);

  @override
  List<Object?> get props => [
        userInfo,
        currentLocation,
      ];
}
