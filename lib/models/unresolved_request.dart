// To parse this JSON data, do
//
//     final unresolvedRequest = unresolvedRequestFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'unresolved_request.g.dart';

UnresolvedRequest unresolvedRequestFromJson(String str) => UnresolvedRequest.fromJson(json.decode(str));

String unresolvedRequestToJson(UnresolvedRequest data) => json.encode(data.toJson());

@JsonSerializable()
class UnresolvedRequest {
    @JsonKey(name: "location_id")
    final String? locationId;
    @JsonKey(name: "request_name")
    final String? requestName;
    @JsonKey(name: "dtc")
    final String? dtc;
    @JsonKey(name: "address")
    final String? address;

    UnresolvedRequest({
        this.locationId,
        this.requestName,
        this.dtc,
        this.address,
    });

    UnresolvedRequest copyWith({
        String? locationId,
        String? requestName,
        String? dtc,
        String? address,
    }) => 
        UnresolvedRequest(
            locationId: locationId ?? this.locationId,
            requestName: requestName ?? this.requestName,
            dtc: dtc ?? this.dtc,
            address: address ?? this.address,
        );

    factory UnresolvedRequest.fromJson(Map<String, dynamic> json) => _$UnresolvedRequestFromJson(json);

    Map<String, dynamic> toJson() => _$UnresolvedRequestToJson(this);
}
