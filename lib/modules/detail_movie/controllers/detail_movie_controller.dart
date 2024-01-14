import 'package:get/get.dart';
import 'package:movie_streaming/services/movie_services.dart';

class DetailMovieController extends GetxController {
  final int movieId;
  DetailMovieController({required this.movieId});
  var listGenre = Rx<List<Map<String, dynamic>>>([]);
  var listRelatedMovies = Rx<List<Map<String, dynamic>>>([]);
  var listCreaditsMovies = Rx<List<Map<String, dynamic>>>([]);
  var detailMovie = Rx<Map<String, dynamic>>({});
  var isLoading = Rx<bool>(false);
  var genreString = Rx<String>('');
  @override
  void onInit() async {
    //getListGenre();
    await getDetailMovie(movieId);
    await getListRelated(movieId, 1);
    await getListCreadits(movieId);
    getGenreString();
    super.onInit();
  }

  Future<void> getListGenre() async {
    isLoading.value = true;
    listGenre.value = await MovieService().getListGenre();
    getGenreString();
    isLoading.value = false;
  }

  Future<void> getDetailMovie(int id) async {
    isLoading.value = true;
    detailMovie.value = await MovieService().getDetailMovie(id);
    isLoading.value = false;
  }

  Future<void> getListRelated(int movieId, int page) async {
    isLoading.value = true;
    listRelatedMovies.value =
        await MovieService().getRelatedMovie(movieId, page);
    isLoading.value = false;
  }

  Future<void> getListCreadits(int movieId) async {
    isLoading.value = true;
    listCreaditsMovies.value = await MovieService().getCreditsMovie(movieId);
    isLoading.value = false;
  }

  void getGenreString() {
    // genreString.value = '';
    // for (var i = 0; i < data['genre_ids'].length; i++) {
    //   for (var j = 0; j < listGenre.value.length; j++) {
    //     if (data['genre_ids'][i] == listGenre.value[j]['id']) {
    //       genreString.value += '${listGenre.value[j]['name']}, ';
    //     }
    //   }
    // }

    genreString.value = '';
    detailMovie.value['genres'].forEach((element) {
      genreString.value += '${element['name']}, ';
    });
  }
}
