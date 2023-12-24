import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:movie_streaming/modules/detail_movie/views/detail_movie_screen.dart';
import 'package:movie_streaming/modules/films/controllers/films_controller.dart';
import 'package:movie_streaming/modules/films/views/widgets/item_movie.dart';

class FilmsScreen extends StatelessWidget {
  FilmsScreen({super.key});
  late double deviceHeight;
  late double deviceWidth;
  @override
  Widget build(BuildContext context) {
    final filmsController = Get.put(FilmsController());
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
                'Films',
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
                    'Trending',
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
                  () => filmsController.isLoadingTrending.value
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
                            itemCount:
                                filmsController.listTrendingMovies.value.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    DetailMovieScreen(
                                      movieId: filmsController
                                          .listTrendingMovies
                                          .value[index]['id'],
                                    ),
                                  );
                                },
                                child: ItemMovie(
                                  image: filmsController.listTrendingMovies
                                      .value[index]['backdrop_path'],
                                  title: filmsController
                                      .listTrendingMovies.value[index]['title'],
                                  rating: filmsController.listTrendingMovies
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
                  () => filmsController.isLoadingPopular.value
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
                            itemCount:
                                filmsController.listPopularMovies.value.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    DetailMovieScreen(
                                      movieId: filmsController
                                          .listPopularMovies.value[index]['id'],
                                    ),
                                  );
                                },
                                child: ItemMovie(
                                  image: filmsController.listPopularMovies
                                      .value[index]['backdrop_path'],
                                  title: filmsController
                                      .listPopularMovies.value[index]['title'],
                                  rating: filmsController.listPopularMovies
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
                  () => filmsController.isLoadingTopRated.value
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
                            itemCount:
                                filmsController.listTopRatedMovies.value.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    DetailMovieScreen(
                                      movieId: filmsController
                                          .listTopRatedMovies
                                          .value[index]['id'],
                                    ),
                                  );
                                },
                                child: ItemMovie(
                                  image: filmsController.listTopRatedMovies
                                      .value[index]['backdrop_path'],
                                  title: filmsController
                                      .listTopRatedMovies.value[index]['title'],
                                  rating: filmsController.listTopRatedMovies
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
                    'Upcoming',
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
                  () => filmsController.isLoadingUpcoming.value
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
                            itemCount:
                                filmsController.listUpcomingMovies.value.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    DetailMovieScreen(
                                      movieId: filmsController
                                          .listUpcomingMovies
                                          .value[index]['id'],
                                    ),
                                  );
                                },
                                child: ItemMovie(
                                  image: filmsController.listUpcomingMovies
                                          .value[index]['backdrop_path'] ??
                                      filmsController.listUpcomingMovies
                                          .value[index]['poster_path'],
                                  title: filmsController
                                      .listUpcomingMovies.value[index]['title'],
                                  rating: filmsController.listUpcomingMovies
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
    ));
  }
}
