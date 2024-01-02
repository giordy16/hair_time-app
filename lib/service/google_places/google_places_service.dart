import 'package:dio/dio.dart';
import 'package:hair_time/app/app_language.dart';
import 'package:hair_time/service/loggin_interceptor.dart';

class GooglePlacesService {
  static const String GOOGLE_MAPS_BASE_URL = "https://maps.googleapis.com";

  static const String GOOGLE_AUTOCOMPLETE_URL = "/maps/api/place/autocomplete/json";
  static const String GOOGLE_GEOCODE_URL = "/maps/api/geocode/json";

  static const String GOOGLE_MAPS_KEY = "AIzaSyCQnRJ-QSvBMmafYWN3unPfzpQ6mnxMCCs";

  final options = BaseOptions(baseUrl: GOOGLE_MAPS_BASE_URL);
  late Dio _dio;

  GooglePlacesService() {
    _dio = Dio(options);
    _dio.interceptors.add(LogginInterceptor());
  }

  Future<Response> autoCompleteAddress(String address) async {
    var _respone = await _dio.get(
      GOOGLE_AUTOCOMPLETE_URL,
      queryParameters: {'input': address, 'key': GOOGLE_MAPS_KEY, 'types': 'address', 'language': languageCode},
    );
    return _respone;
  }

  Future<Response> getPlaceDetailFromPlaceId(String placeId) async {
    var _respone = await _dio.get(
      GOOGLE_GEOCODE_URL,
      queryParameters: {'place_id': placeId, 'key': GOOGLE_MAPS_KEY, 'language': languageCode},
    );
    return _respone;
  }
}
