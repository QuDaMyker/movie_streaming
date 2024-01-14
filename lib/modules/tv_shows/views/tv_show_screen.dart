import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming/modules/detail_movie/views/detail_movie_screen.dart';
import 'package:movie_streaming/modules/detail_tv_show/views/detail_tv_show_screen.dart';
import 'package:movie_streaming/modules/films/views/widgets/item_movie.dart';
import 'package:movie_streaming/modules/tv_shows/controllers/tv_show_controller.dart';

// ignore: must_be_immutable
class TVShowScreen extends StatelessWidget {
  TVShowScreen({super.key});
  late double deviceHeight;
  late double deviceWidth;
  @override
  Widget build(BuildContext context) {
    final tvShowController = Get.put(TVShowController());
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: deviceWidth * 0.03,
              vertical: deviceHeight * 0.01,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  'TV Shows',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Airing Today',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See all',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: deviceWidth,
                  child: Obx(
                    () => tvShowController.isLoadingAiring.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.yellow,
                              backgroundColor: Colors.black,
                            ),
                          )
                        : SizedBox(
                            height: deviceHeight * 0.3,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: tvShowController
                                  .listAiringTVShows.value.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      DetailTVShowScreen(
                                        tvShowId: tvShowController
                                            .listAiringTVShows
                                            .value[index]['id'],
                                      ),
                                    );
                                  },
                                  child: ItemMovie(
                                    image: tvShowController.listAiringTVShows
                                        .value[index]['backdrop_path'],
                                    title: tvShowController.listAiringTVShows
                                        .value[index]['original_name'],
                                    rating: tvShowController.listAiringTVShows
                                        .value[index]['vote_average'],
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'On The Air',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See all',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: deviceWidth,
                  child: Obx(
                    () => tvShowController.isLoadingOnTheAir.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.yellow,
                              backgroundColor: Colors.black,
                            ),
                          )
                        : SizedBox(
                            height: deviceHeight * 0.3,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: tvShowController
                                  .listOnTheAirTVShows.value.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      DetailTVShowScreen(
                                        tvShowId: tvShowController
                                            .listOnTheAirTVShows
                                            .value[index]['id'],
                                      ),
                                    );
                                  },
                                  child: ItemMovie(
                                    image: tvShowController.listOnTheAirTVShows
                                        .value[index]['backdrop_path'],
                                    title: tvShowController.listOnTheAirTVShows
                                        .value[index]['original_name'],
                                    rating: tvShowController.listOnTheAirTVShows
                                        .value[index]['vote_average'],
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Popular',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See all',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: deviceWidth,
                  child: Obx(
                    () => tvShowController.isLoadingPopular.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.yellow,
                              backgroundColor: Colors.black,
                            ),
                          )
                        : SizedBox(
                            height: deviceHeight * 0.3,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: tvShowController
                                  .listPopularTVShows.value.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      DetailTVShowScreen(
                                        tvShowId: tvShowController
                                            .listPopularTVShows
                                            .value[index]['id'],
                                      ),
                                    );
                                  },
                                  child: ItemMovie(
                                    image: tvShowController.listPopularTVShows
                                        .value[index]['backdrop_path'],
                                    title: tvShowController.listPopularTVShows
                                        .value[index]['original_name'],
                                    rating: tvShowController.listPopularTVShows
                                        .value[index]['vote_average'],
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Top Rated',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See all',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: deviceWidth,
                  child: Obx(
                    () => tvShowController.isLoadingTopRated.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.yellow,
                              backgroundColor: Colors.black,
                            ),
                          )
                        : SizedBox(
                            height: deviceHeight * 0.3,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: tvShowController
                                  .listTopRatedTVShows.value.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      DetailTVShowScreen(
                                        tvShowId: tvShowController
                                            .listTopRatedTVShows
                                            .value[index]['id'],
                                      ),
                                    );
                                  },
                                  child: ItemMovie(
                                    image: tvShowController.listTopRatedTVShows
                                            .value[index]['backdrop_path'] ??
                                        tvShowController.listTopRatedTVShows
                                            .value[index]['poster_path'],
                                    title: tvShowController.listTopRatedTVShows
                                        .value[index]['original_name'],
                                    rating: tvShowController.listTopRatedTVShows
                                        .value[index]['vote_average'],
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
