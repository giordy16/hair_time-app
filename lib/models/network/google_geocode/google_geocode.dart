import 'package:json_annotation/json_annotation.dart';

part 'google_geocode.g.dart';

@JsonSerializable()
class GoogleGeocodeResponse {
  List<GoogleGeocodeResult> results;

  GoogleGeocodeResponse(this.results);

  factory GoogleGeocodeResponse.fromJson(Map<String, dynamic> json) => _$GoogleGeocodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleGeocodeResponseToJson(this);
}

@JsonSerializable()
class GoogleGeocodeResult {
  @JsonKey(name: "formatted_address") String fullAddress;
  @JsonKey(name: "address_components") List<GoogleAddressComponent> components;
  GoogleGeocodeGeometry geometry;

  GoogleGeocodeResult(this.fullAddress, this.components, this.geometry);

  factory GoogleGeocodeResult.fromJson(Map<String, dynamic> json) => _$GoogleGeocodeResultFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleGeocodeResultToJson(this);
}

@JsonSerializable()
class GoogleGeocodeGeometry {
  GoogleGeocodeLocation location;

  GoogleGeocodeGeometry(this.location);

  factory GoogleGeocodeGeometry.fromJson(Map<String, dynamic> json) => _$GoogleGeocodeGeometryFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleGeocodeGeometryToJson(this);
}

@JsonSerializable()
class GoogleGeocodeLocation {
  double lat;
  double lng;

  GoogleGeocodeLocation(this.lat, this.lng);

  factory GoogleGeocodeLocation.fromJson(Map<String, dynamic> json) => _$GoogleGeocodeLocationFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleGeocodeLocationToJson(this);
}

@JsonSerializable()
class GoogleAddressComponent {
  String long_name;
  String short_name;
  List<String> types;

  GoogleAddressComponent(this.long_name, this.short_name, this.types);

  factory GoogleAddressComponent.fromJson(Map<String, dynamic> json) => _$GoogleAddressComponentFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleAddressComponentToJson(this);
}
