import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String apiUrl = "https://rickandmortyapi.com/api";

  Future<Object> getDataAllCharacters<T>() async {
    Object response;
    try {
      response = await _dio.get('$apiUrl/character');
      return response;
    } on DioException catch (e) {
      response = e;
      return response;
    }
  }
}