import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_location.g.dart';

@JsonSerializable()
class AppLocation extends Equatable {
  final String? address;
  final (double lat, double lng) location;

  const AppLocation({
    this.address,
    required this.location,
  });

  AppLocation copyWith({
    String? address,
    (double lat, double lng)? location,
  }) {
    return AppLocation(
      address: address ?? this.address,
      location: location ?? this.location,
    );
  }

  factory AppLocation.fromJson(Map<String, dynamic> json) =>
      _$AppLocationFromJson(json);

  Map<String, dynamic> toJson() => _$AppLocationToJson(this);

  @override
  List<Object?> get props => [address, location];
}
