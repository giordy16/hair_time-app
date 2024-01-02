// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_place_prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GooglePlacePredictionResponse _$GooglePlacePredictionResponseFromJson(
        Map<String, dynamic> json) =>
    GooglePlacePredictionResponse(
      (json['predictions'] as List<dynamic>)
          .map((e) =>
              GooglePlacePredictionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GooglePlacePredictionResponseToJson(
        GooglePlacePredictionResponse instance) =>
    <String, dynamic>{
      'predictions': instance.predictions,
    };

GooglePlacePredictionModel _$GooglePlacePredictionModelFromJson(
        Map<String, dynamic> json) =>
    GooglePlacePredictionModel(
      json['description'] as String,
      json['place_id'] as String,
    );

Map<String, dynamic> _$GooglePlacePredictionModelToJson(
        GooglePlacePredictionModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'place_id': instance.place_id,
    };

GooglePlaceAddressStructure _$GooglePlaceAddressStructureFromJson(
        Map<String, dynamic> json) =>
    GooglePlaceAddressStructure(
      json['main_text'] as String,
      json['secondary_text'] as String,
    );

Map<String, dynamic> _$GooglePlaceAddressStructureToJson(
        GooglePlaceAddressStructure instance) =>
    <String, dynamic>{
      'main_text': instance.main_text,
      'secondary_text': instance.secondary_text,
    };
