import 'package:ayursh/domain/util/preference_util.dart';
import 'package:dio/dio.dart';

class ApiService {
 static final Dio _dio = Dio();

  Future<Map<String, dynamic>?> getPlaceAutocomplete(String inputText) async {
    final apiKey = 'AIzaSyAW_8Q3h5jgtP6ZNO4wXbLskKnG4FrwSaE';
    final baseUrl = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';

    try {
      final response = await _dio.get(baseUrl, queryParameters: {'input': inputText, 'key': apiKey});

      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

 // static Future<Map<String, dynamic>?> finderApi({required FinderBody data}) async {
 //    final apiKey = 'AIzaSyAW_8Q3h5jgtP6ZNO4wXbLskKnG4FrwSaE';
 //    final baseUrl = 'https://prod.ayursh.com/therapy/api/v1/clinic/finder';
 //
 //    try {
 //      final response = await _dio.post(baseUrl, data: data, options: Options(headers: {"Authorization": await PreferenceUtil().getAccessToken()}));
 //
 //      if (response.statusCode == 200) {
 //        return response.data;
 //      } else {
 //        print('Error: ${response.statusCode}');
 //        return null;
 //      }
 //    } catch (e) {
 //      print('Error: $e');
 //      return null;
 //    }
 //  }
}

