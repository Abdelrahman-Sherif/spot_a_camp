import 'package:dio/dio.dart';

abstract class CampsiteDatasource {
  Future<List<dynamic>> getCampsites();
}

class CampsiteDatasourceImpl extends CampsiteDatasource {
  static const String _baseUrl =
      'https://62ed0389a785760e67622eb2.mockapi.io/spots/v1';

  final Dio _dio = Dio();

  @override
  Future<List<dynamic>> getCampsites() async {
    final response = await _dio.getUri(Uri.parse('$_baseUrl/campsites'));
    return response.data;
  }
}
