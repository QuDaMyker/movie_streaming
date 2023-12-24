import 'package:get/get.dart';
import 'package:movie_streaming/services/movie_services.dart';

class FilmsController extends GetxController {
  var listTrendingMovies = Rx<List<Map<String, dynamic>>>([]);
  var listPopularMovies = Rx<List<Map<String, dynamic>>>([]);
  var listTopRatedMovies = Rx<List<Map<String, dynamic>>>([]);
  var listUpcomingMovies = Rx<List<Map<String, dynamic>>>([]);

  var isLoadingTrending = Rx<bool>(false);
  var isLoadingPopular = Rx<bool>(false);
  var isLoadingTopRated = Rx<bool>(false);
  var isLoadingUpcoming = Rx<bool>(false);

  var isLoadingBoxOffice = Rx<bool>(false);
  var isLoadingMostFavorited = Rx<bool>(false);
  var isLoadingMostWatchedThisMonth = Rx<bool>(false);
  var isLoadingMostPopular = Rx<bool>(false);
  var isLoadingUpComing = Rx<bool>(false);

  @override
  void onInit() {
    getTrendingMovies(1);
    getPopularMovies(1);
    getTopRatedMovies(1);
    getUpcomingMovies(1);
    super.onInit();
  }

  Future<void> getTrendingMovies(int page) async {
    try {
      isLoadingTrending.value = true;
      listTrendingMovies.value = await MovieService().getTrendingMovie(page);
    } catch (e) {
      print(e.toString());
    }
    isLoadingTrending.value = false;
  }

  Future<void> getPopularMovies(int page) async {
    try {
      isLoadingPopular.value = true;
      listPopularMovies.value = await MovieService().getPopularMovie(page);
    } catch (e) {
      print(e.toString());
    }
    isLoadingPopular.value = false;
  }

  Future<void> getTopRatedMovies(int page) async {
    try {
      isLoadingTopRated.value = true;
      listTopRatedMovies.value = await MovieService().getTopRatedMovie(page);
    } catch (e) {
      print(e.toString());
    }
    isLoadingTopRated.value = false;
  }

  Future<void> getUpcomingMovies(int page) async {
    try {
      isLoadingUpcoming.value = true;
      listUpcomingMovies.value = await MovieService().getUpcomingMovie(page);
    } catch (e) {
      print(e.toString());
    }
    isLoadingUpcoming.value = false;
  }
}
