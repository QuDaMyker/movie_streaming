import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TVShowServices {
  Future<List<Map<String, dynamic>>> getAiringToday(int page) async {
    List<Map<String, dynamic>> result = [];
    try {
      var dio = Dio();
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var resonse = await dio.request(
        '${dotenv.env['TMDB_URL']}/tv/airing_today?language=en-US&page=$page',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (resonse.statusCode == 200) {
        result = List<Map<String, dynamic>>.from(resonse.data['results']);
      }
    } catch (e) {
      print(e.toString());
    }

    return result;
  }

  Future<List<Map<String, dynamic>>> getOnTheAirTV(int page) async {
    List<Map<String, dynamic>> result = [];
    try {
      var dio = Dio();
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var resonse = await dio.request(
        '${dotenv.env['TMDB_URL']}/tv/on_the_air?language=en-US&page=$page',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (resonse.statusCode == 200) {
        result = List<Map<String, dynamic>>.from(resonse.data['results']);
      }
    } catch (e) {
      print(e.toString());
    }

    return result;
  }

  Future<List<Map<String, dynamic>>> getPopularTV(int page) async {
    List<Map<String, dynamic>> result = [];
    try {
      var dio = Dio();
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var resonse = await dio.request(
        '${dotenv.env['TMDB_URL']}/tv/popular?language=en-US&page=$page',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (resonse.statusCode == 200) {
        result = List<Map<String, dynamic>>.from(resonse.data['results']);
      }
    } catch (e) {
      print(e.toString());
    }

    return result;
  }

  Future<List<Map<String, dynamic>>> getTopRatedTV(int page) async {
    List<Map<String, dynamic>> result = [];
    try {
      var dio = Dio();
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var resonse = await dio.request(
        '${dotenv.env['TMDB_URL']}/tv/top_rated?language=en-US&page=$page',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (resonse.statusCode == 200) {
        result = List<Map<String, dynamic>>.from(resonse.data['results']);
      }
    } catch (e) {
      print(e.toString());
    }

    return result;
  }

  Future<Map<String, dynamic>> getDetailTV(int id) async {
    Map<String, dynamic> result = {};
    try {
      var dio = Dio();
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var resonse = await dio.request(
        '${dotenv.env['TMDB_URL']}/tv/$id?language=en-US',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (resonse.statusCode == 200) {
        result = Map<String, dynamic>.from(resonse.data);
      }
    } catch (e) {
      print(e.toString());
    }

    return result;
  }

  Future<List<Map<String, dynamic>>> getRelatedTVShow(int id, int page) async {
    List<Map<String, dynamic>> result = [];
    try {
      var dio = Dio();
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var resonse = await dio.request(
        '${dotenv.env['TMDB_URL']}/tv/$id/recommendations?language=en-US&page=$page',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (resonse.statusCode == 200) {
        result = List<Map<String, dynamic>>.from(resonse.data['results']);
      }
    } catch (e) {
      print(e.toString());
    }

    return result;
  }

  Future<List<Map<String, dynamic>>> getCreditsTVShow(int id) async {
    List<Map<String, dynamic>> result = [];
    try {
      var dio = Dio();
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var resonse = await dio.request(
        '${dotenv.env['TMDB_URL']}/tv/$id/credits?language=en-US',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (resonse.statusCode == 200) {
        result = List<Map<String, dynamic>>.from(resonse.data['cast']);
        print(result.length);
      }
    } catch (e) {
      print(e.toString());
    }

    return result;
  }
}
