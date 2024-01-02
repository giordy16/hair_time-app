import 'package:hair_time/models/errors/Errors.dart';
import 'package:hair_time/models/network/google_geocode/google_geocode.dart';
import 'package:hair_time/models/network/google_places/google_place_prediction.dart';
import 'package:hair_time/service/google_places/google_places_service.dart';

class GooglePlaceRepository {
  final service = GooglePlacesService();

  Future<Map<String, String>> getAutoCompletedAddresses(String input) async {
    try {
      final response = await service.autoCompleteAddress(input);
      final predictions = GooglePlacePredictionResponse.fromJson(response.data);

      Map<String, String> _map = {};

      for (var _pred in predictions.predictions) {
        _map.addAll({_pred.place_id: _pred.description});
      }

      return _map;
    } catch (e) {
      throw GeneralError();
    }
  }

  Future<GoogleGeocodeResult> getPlaceDetailFromPlaceId(String placeId) async {
    try {
      final rawResponse = await service.getPlaceDetailFromPlaceId(placeId);
      return GoogleGeocodeResponse.fromJson(rawResponse.data).results.first;
    } catch (e) {
      throw GeneralError();
    }
  }
}
