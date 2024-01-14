import 'package:get/get.dart';
import 'package:movie_streaming/services/tv_show_services.dart';

class TVShowController extends GetxController {
  var listAiringTVShows = Rx<List<Map<String, dynamic>>>([]);
  var listOnTheAirTVShows = Rx<List<Map<String, dynamic>>>([]);
  var listPopularTVShows = Rx<List<Map<String, dynamic>>>([]);
  var listTopRatedTVShows = Rx<List<Map<String, dynamic>>>([]);

  var isLoadingAiring = Rx<bool>(false);
  var isLoadingOnTheAir = Rx<bool>(false);
  var isLoadingPopular = Rx<bool>(false);
  var isLoadingTopRated = Rx<bool>(false);

  @override
  void onInit() {
    getAiringTVShows(1);
    getOnTheAirTVShows(1);
    getPopularTVShows(1);
    getTopRatedTVShows(1);
    super.onInit();
  }

  Future<void> getAiringTVShows(int page) async {
    try {
      isLoadingAiring.value = true;
      listAiringTVShows.value = await TVShowServices().getAiringToday(page);
    } catch (e) {
      print(e.toString());
    }
    isLoadingAiring.value = false;
  }

  Future<void> getOnTheAirTVShows(int page) async {
    try {
      isLoadingOnTheAir.value = true;
      listOnTheAirTVShows.value = await TVShowServices().getOnTheAirTV(page);
    } catch (e) {
      print(e.toString());
    }
    isLoadingOnTheAir.value = false;
  }

  Future<void> getPopularTVShows(int page) async {
    try {
      isLoadingPopular.value = true;
      listPopularTVShows.value = await TVShowServices().getPopularTV(page);
    } catch (e) {
      print(e.toString());
    }
    isLoadingPopular.value = false;
  }

  Future<void> getTopRatedTVShows(int page) async {
    try {
      isLoadingTopRated.value = true;
      listTopRatedTVShows.value = await TVShowServices().getTopRatedTV(page);
    } catch (e) {
      print(e.toString());
    }
    isLoadingTopRated.value = false;
  }
}
