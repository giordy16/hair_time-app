import 'package:json_annotation/json_annotation.dart';

part 'google_place_prediction.g.dart';

@JsonSerializable()
class GooglePlacePredictionResponse {
  List<GooglePlacePredictionModel> predictions;

  GooglePlacePredictionResponse(this.predictions);

  factory GooglePlacePredictionResponse.fromJson(Map<String, dynamic> json) => _$GooglePlacePredictionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GooglePlacePredictionResponseToJson(this);
}

@JsonSerializable()
class GooglePlacePredictionModel {
  String description;
  String place_id;

  GooglePlacePredictionModel(this.description, this.place_id);

  factory GooglePlacePredictionModel.fromJson(Map<String, dynamic> json) => _$GooglePlacePredictionModelFromJson(json);

  Map<String, dynamic> toJson() => _$GooglePlacePredictionModelToJson(this);
}

@JsonSerializable()
class GooglePlaceAddressStructure {
  String main_text;
  String secondary_text;

  GooglePlaceAddressStructure(this.main_text, this.secondary_text);

  factory GooglePlaceAddressStructure.fromJson(Map<String, dynamic> json) => _$GooglePlaceAddressStructureFromJson(json);

  Map<String, dynamic> toJson() => _$GooglePlaceAddressStructureToJson(this);
}