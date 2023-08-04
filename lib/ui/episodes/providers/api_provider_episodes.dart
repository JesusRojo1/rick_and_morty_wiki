import 'package:dio/dio.dart';

class ApiProviderEpisodes {
  final Dio _dio = Dio();
  final String apiUrl = "https://rickandmortyapi.com/api";

  Future<Object> getDataAllEpisodes<T>() async {
    Object response;
    try {
      response = await _dio.get('$apiUrl/episode');
      return response;
    } on DioException catch (e) {
      response = e;
      return response;
    }
  }
}