import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieService {
  Future<List<Map<String, dynamic>>> getListGenre() async {
    List<Map<String, dynamic>> result = [];
    try {
      var dio = Dio();
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var resonse = await dio.request(
        '${dotenv.env['TMDB_URL']}/genre/movie/list?language=en',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (resonse.statusCode == 200) {
        result = List<Map<String, dynamic>>.from(resonse.data['genres']);
      }
    } catch (e) {
      print(e.toString());
    }

    return result;
  }

  Future<Map<String, dynamic>> getDetailMovie(int id) async {
    Map<String, dynamic> result = {};
    try {
      var dio = Dio();
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var resonse = await dio.request(
        '${dotenv.env['TMDB_URL']}/movie/$id?language=en-US',
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

  Future<List<Map<String, dynamic>>> getTrendingMovie(int page) async {
    List<Map<String, dynamic>> result = [];
    try {
      var dio = Dio();
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var resonse = await dio.request(
        '${dotenv.env['TMDB_URL']}/movie/now_playing?language=en-US&page=$page',
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

  Future<List<Map<String, dynamic>>> getPopularMovie(int page) async {
    List<Map<String, dynamic>> result = [];
    try {
      var dio = Dio();
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var resonse = await dio.request(
        '${dotenv.env['TMDB_URL']}/movie/popular?language=en-US&page=$page',
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

  Future<List<Map<String, dynamic>>> getTopRatedMovie(int page) async {
    List<Map<String, dynamic>> result = [];
    try {
      var dio = Dio();
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var resonse = await dio.request(
        '${dotenv.env['TMDB_URL']}/movie/top_rated?language=en-US&page=$page',
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

  Future<List<Map<String, dynamic>>> getUpcomingMovie(int page) async {
    List<Map<String, dynamic>> result = [];
    try {
      var dio = Dio();
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      var resonse = await dio.request(
        '${dotenv.env['TMDB_URL']}/movie/upcoming?language=en-US&page=$page',
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

  Future<List<Map<String, dynamic>>> getRelatedMovie(int id, int page) async {
    List<Map<String, dynamic>> result = [];
    try {
      var dio = Dio();
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      print(id);
      var resonse = await dio.request(
        '${dotenv.env['TMDB_URL']}/movie/$id/recommendations?language=en-US&page=$page',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (resonse.statusCode == 200) {
        result = List<Map<String, dynamic>>.from(resonse.data['results']);
        print(result.length);
      }
    } catch (e) {
      print(e.toString());
    }

    return result;
  }

  Future<List<Map<String, dynamic>>> getCreditsMovie(int id) async {
    List<Map<String, dynamic>> result = [];
    try {
      var dio = Dio();
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
      };
      print(id);
      var resonse = await dio.request(
        '${dotenv.env['TMDB_URL']}/movie/$id/credits?language=en-US',
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
