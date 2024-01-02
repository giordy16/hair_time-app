// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_geocode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleGeocodeResponse _$GoogleGeocodeResponseFromJson(
        Map<String, dynamic> json) =>
    GoogleGeocodeResponse(
      (json['results'] as List<dynamic>)
          .map((e) => GoogleGeocodeResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GoogleGeocodeResponseToJson(
        GoogleGeocodeResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

GoogleGeocodeResult _$GoogleGeocodeResultFromJson(Map<String, dynamic> json) =>
    GoogleGeocodeResult(
      json['formatted_address'] as String,
      (json['address_components'] as List<dynamic>)
          .map(
              (e) => GoogleAddressComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      GoogleGeocodeGeometry.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoogleGeocodeResultToJson(
        GoogleGeocodeResult instance) =>
    <String, dynamic>{
      'formatted_address': instance.fullAddress,
      'address_components': instance.components,
      'geometry': instance.geometry,
    };

GoogleGeocodeGeometry _$GoogleGeocodeGeometryFromJson(
        Map<String, dynamic> json) =>
    GoogleGeocodeGeometry(
      GoogleGeocodeLocation.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoogleGeocodeGeometryToJson(
        GoogleGeocodeGeometry instance) =>
    <String, dynamic>{
      'location': instance.location,
    };

GoogleGeocodeLocation _$GoogleGeocodeLocationFromJson(
        Map<String, dynamic> json) =>
    GoogleGeocodeLocation(
      (json['lat'] as num).toDouble(),
      (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$GoogleGeocodeLocationToJson(
        GoogleGeocodeLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

GoogleAddressComponent _$GoogleAddressComponentFromJson(
        Map<String, dynamic> json) =>
    GoogleAddressComponent(
      json['long_name'] as String,
      json['short_name'] as String,
      (json['types'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GoogleAddressComponentToJson(
        GoogleAddressComponent instance) =>
    <String, dynamic>{
      'long_name': instance.long_name,
      'short_name': instance.short_name,
      'types': instance.types,
    };
