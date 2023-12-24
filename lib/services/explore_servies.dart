import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class ExploreServices extends GetxController {
  Future<List<Map<String, dynamic>>> getCollectionSearch(
    String query,
    int page,
  ) async {
    print(query);
    List<Map<String, dynamic>> result = [];
    try {
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var dio = Dio();
      var response = await dio.request(
        '${dotenv.env['TMDB_URL']}/search/collection?query=$query&include_adult=false&language=en-US&page=$page',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        result = List<Map<String, dynamic>>.from(response.data['results']);
        print(result);
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<List<Map<String, dynamic>>> getCompanySearch(
    String query,
    int page,
  ) async {
    List<Map<String, dynamic>> result = [];
    try {
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var dio = Dio();
      var response = await dio.request(
        '${dotenv.env['TMDB_URL']}/search/company?query=$query&include_adult=false&language=en-US&page=$page',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        result = List<Map<String, dynamic>>.from(response.data['results']);
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<List<Map<String, dynamic>>> getKeywordSearch(
    String query,
    int page,
  ) async {
    List<Map<String, dynamic>> result = [];
    try {
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var dio = Dio();
      var response = await dio.request(
        '${dotenv.env['TMDB_URL']}/search/keyword?query=$query&include_adult=false&language=en-US&page=$page',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        result = List<Map<String, dynamic>>.from(response.data['results']);
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<List<Map<String, dynamic>>> getMovieSearch(
    String query,
    int page,
  ) async {
    List<Map<String, dynamic>> result = [];
    try {
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var dio = Dio();
      var response = await dio.request(
        '${dotenv.env['TMDB_URL']}/search/movie?query=$query&include_adult=false&language=en-US&page=$page',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        result = List<Map<String, dynamic>>.from(response.data['results']);
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<List<Map<String, dynamic>>> getMultiSearch(
    String query,
    int page,
  ) async {
    List<Map<String, dynamic>> result = [];
    try {
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var dio = Dio();
      var response = await dio.request(
        '${dotenv.env['TMDB_URL']}/search/multi?query=$query&include_adult=false&language=en-US&page=$page',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        result = List<Map<String, dynamic>>.from(response.data['results']);
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<List<Map<String, dynamic>>> getPersonSearch(
    String query,
    int page,
  ) async {
    List<Map<String, dynamic>> result = [];
    try {
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var dio = Dio();
      var response = await dio.request(
        '${dotenv.env['TMDB_URL']}/search/person?query=$query&include_adult=false&language=en-US&page=$page',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        result = List<Map<String, dynamic>>.from(response.data['results']);
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<List<Map<String, dynamic>>> getTVSearch(
    String query,
    int page,
  ) async {
    List<Map<String, dynamic>> result = [];
    try {
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var dio = Dio();
      var response = await dio.request(
        '${dotenv.env['TMDB_URL']}/search/tv?query=$query&include_adult=false&language=en-US&page=$page',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        result = List<Map<String, dynamic>>.from(response.data['results']);
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e.toString());
    }
    return result;
  }
}
