import 'package:get/get.dart';
import 'package:movie_streaming/services/tv_show_services.dart';

class DetailTVShowController extends GetxController {
  final int tvShowId;
  DetailTVShowController({required this.tvShowId});
  var listGenre = Rx<List<Map<String, dynamic>>>([]);
  var listRelatedTVShows = Rx<List<Map<String, dynamic>>>([]);
  var listCreaditsTVShows = Rx<List<Map<String, dynamic>>>([]);
  var detailTVShow = Rx<Map<String, dynamic>>({});
  var isLoading = Rx<bool>(false);
  var genreString = Rx<String>('');

  @override
  void onInit() async {
    await getDetailMovie(tvShowId);
    await getListRelated(tvShowId, 1);
    await getListCreadits(tvShowId);
    getGenreString();
    super.onInit();
  }

  Future<void> getDetailMovie(int id) async {
    isLoading.value = true;
    detailTVShow.value = await TVShowServices().getDetailTV(id);
    isLoading.value = false;
  }

  Future<void> getListRelated(int movieId, int page) async {
    isLoading.value = true;
    listRelatedTVShows.value =
        await TVShowServices().getRelatedTVShow(movieId, page);
    isLoading.value = false;
  }

  Future<void> getListCreadits(int movieId) async {
    isLoading.value = true;
    listCreaditsTVShows.value =
        await TVShowServices().getCreditsTVShow(movieId);

    isLoading.value = false;
  }

  void getGenreString() {
    genreString.value = '';
    detailTVShow.value['genres'].forEach((element) {
      genreString.value += '${element['name']}, ';
    });
  }
}
