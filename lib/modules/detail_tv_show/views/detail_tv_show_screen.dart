import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:movie_streaming/blank.dart';
import 'package:movie_streaming/modules/detail_movie/views/widgets/item_creadits.dart';
import 'package:movie_streaming/modules/detail_tv_show/controllers/detail_tv_show_controller.dart';
import 'package:movie_streaming/modules/films/views/widgets/item_movie.dart';

// ignore: must_be_immutable
class DetailTVShowScreen extends StatelessWidget {
  DetailTVShowScreen({
    super.key,
    required this.tvShowId,
  });
  final int tvShowId;
  late double deviceHeight;
  late double deviceWidth;
  @override
  Widget build(BuildContext context) {
    final detailTVShowController =
        Get.put(DetailTVShowController(tvShowId: tvShowId));
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Obx(
          () => detailTVShowController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.yellow,
                    backgroundColor: Colors.black,
                  ),
                )
              : CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.black,
                      elevation: 0,
                      pinned: true,
                      stretch: true,
                      expandedHeight: 200.0,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        stretchModes: const [StretchMode.zoomBackground],
                        background: Image(
                          image: CachedNetworkImageProvider(
                              '${dotenv.env['TMDB_BASE_IMAGE_URL']}${detailTVShowController.detailTVShow.value['backdrop_path']}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth * 0.04,
                          vertical: deviceHeight * 0.01,
                        ),
                        color: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: deviceHeight * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  height: deviceHeight * 0.3,
                                  width: deviceWidth * 0.38,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(
                                      deviceWidth * 0.02,
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                          '${dotenv.env['TMDB_BASE_IMAGE_URL']}${detailTVShowController.detailTVShow.value['poster_path']}' ??
                                              '${dotenv.env['TMDB_BASE_IMAGE_URL']}${detailTVShowController.detailTVShow.value['backdrop_path']}'),
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   width: deviceWidth * 0.02,
                                // ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      detailTVShowController
                                          .detailTVShow.value['last_air_date'],
                                      style: const TextStyle(
                                        color: Colors.yellow,
                                      ),
                                    ),
                                    SizedBox(
                                      height: deviceHeight * 0.001,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: deviceWidth * 0.01,
                                        ),
                                        Text(
                                          detailTVShowController.detailTVShow
                                              .value['vote_average']
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.how_to_vote,
                                          color: Colors.yellow,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: deviceWidth * 0.01,
                                        ),
                                        Text(
                                          detailTVShowController
                                              .detailTVShow.value['vote_count']
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: deviceHeight * 0.008,
                                    ),
                                    Text(
                                      'Language: ${detailTVShowController.detailTVShow.value['spoken_languages'][0]['english_name']}',
                                      style: const TextStyle(
                                        color: Colors.yellow,
                                      ),
                                    ),
                                    SizedBox(
                                      height: deviceHeight * 0.008,
                                    ),
                                    SizedBox(
                                      width: deviceWidth * 0.4,
                                      child: Text(
                                        'Country: ${detailTVShowController.detailTVShow.value['production_countries'][0]['name']}',
                                        style: const TextStyle(
                                          color: Colors.yellow,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      height: deviceHeight * 0.02,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: deviceHeight * 0.05,
                                          width: deviceWidth * 0.2,
                                          decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius: BorderRadius.circular(
                                              deviceWidth * 0.01,
                                            ),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Icon(
                                                Icons.movie_filter,
                                                color: Colors.black,
                                              ),
                                              SizedBox(
                                                  width: deviceWidth * 0.009),
                                              const Text(
                                                'Trailer ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: deviceWidth * 0.12,
                                        ),
                                        Container(
                                          width: deviceWidth * 0.05,
                                          height: deviceWidth * 0.05,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(
                                              deviceWidth * 0.05,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                deviceWidth * 0.001),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: deviceWidth * 0.01,
                                                  height: deviceWidth * 0.01,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      deviceWidth * 0.01,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: deviceWidth * 0.01,
                                                  height: deviceWidth * 0.01,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      deviceWidth * 0.01,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: deviceWidth * 0.01,
                                                  height: deviceWidth * 0.01,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      deviceWidth * 0.01,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: deviceHeight * 0.008,
                                    ),
                                    Container(
                                      height: deviceHeight * 0.05,
                                      width: deviceWidth * 0.3,
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.circular(
                                          deviceWidth * 0.01,
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          // Get.to(StreamingMovieScreen(
                                          //     movieId: movieId));
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(
                                              Icons.movie,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                                width: deviceWidth * 0.009),
                                            const Text(
                                              'Watch Now',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: deviceWidth * 0.1,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: deviceHeight * 0.008,
                            ),
                            Text(
                              detailTVShowController
                                  .detailTVShow.value['original_name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(
                              height: deviceHeight * 0.008,
                            ),
                            Obx(
                              () => Text(
                                detailTVShowController.genreString.value,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: deviceHeight * 0.008,
                            ),
                            Text(
                              detailTVShowController
                                  .detailTVShow.value['overview'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: deviceHeight * 0.008,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: const Column(
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Mark Watched',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Column(
                                    children: [
                                      Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Watch Lists',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Column(
                                    children: [
                                      Icon(
                                        Icons.playlist_add_outlined,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Add to',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: deviceHeight * 0.008,
                            ),
                            Card(
                              elevation: 0,
                              color: Colors.white.withOpacity(0.8),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: deviceWidth * 0.03,
                                  vertical: deviceHeight * 0.01,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.app_registration,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          'Connect your account',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: deviceHeight * 0.008,
                                    ),
                                    const Text(
                                      'Connect your account to easily stream movies and shows from your favorite services.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: deviceHeight * 0.008,
                                    ),
                                    OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                          vertical: deviceHeight * 0.01,
                                          horizontal: deviceWidth * 0.07,
                                        ),
                                        backgroundColor: Colors.black,
                                      ),
                                      child: const Text(
                                        'Continue',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: deviceHeight * 0.008,
                            ),
                            const Text(
                              'Ratings',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: deviceHeight * 0.008,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: deviceHeight * 0.01,
                                horizontal: deviceWidth * 0.03,
                              ),
                              height: deviceHeight * 0.15,
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const CircleAvatar(
                                        radius: 42,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                          'https://images.unsplash.com/photo-1702747891854-506cc3275eb8?q=80&w=2393&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        ),
                                      ),
                                      SizedBox(
                                        width: deviceWidth * 0.008,
                                      ),
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '? ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '?  ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                'Rates',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: deviceWidth * 0.1,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const CircleAvatar(
                                        radius: 42,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                          'https://m.media-amazon.com/images/G/01/imdb/images/social/imdb_logo.png',
                                        ),
                                      ),
                                      SizedBox(
                                        width: deviceWidth * 0.008,
                                      ),
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '7.2',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '2.4k ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                'Rates',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: deviceWidth * 0.1,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const CircleAvatar(
                                        radius: 42,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                          'https://play-lh.googleusercontent.com/lMoItBgdPPVDJsNOVtP26EKHePkwBg-PkuY9NOrc-fumRtTFP4XhpUNk_22syN4Datc',
                                        ),
                                      ),
                                      SizedBox(
                                        width: deviceWidth * 0.008,
                                      ),
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '8.0',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '120k ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                'Rates',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: deviceWidth * 0.1,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const CircleAvatar(
                                        radius: 42,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                          'https://mir-s3-cdn-cf.behance.net/projects/404/6acb57129337655.Y3JvcCw5MDAsNzAzLDAsOTg.jpg',
                                        ),
                                      ),
                                      SizedBox(
                                        width: deviceWidth * 0.008,
                                      ),
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '7.9 ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '46.7k ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                'Rates',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Obx(() => detailTVShowController
                                    .listRelatedTVShows.value.isNotEmpty
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Related',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Obx(
                                        () => detailTVShowController
                                                .listRelatedTVShows
                                                .value
                                                .isNotEmpty
                                            ? Column(
                                                children: [
                                                  SizedBox(
                                                    height:
                                                        deviceHeight * 0.008,
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical:
                                                          deviceHeight * 0.01,
                                                      horizontal:
                                                          deviceWidth * 0.0,
                                                    ),
                                                    height: deviceHeight * 0.3,
                                                    child: ListView.builder(
                                                      physics:
                                                          const BouncingScrollPhysics(),
                                                      itemCount:
                                                          detailTVShowController
                                                              .listRelatedTVShows
                                                              .value
                                                              .length,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            Get.off(
                                                              Blank(
                                                                screen:
                                                                    DetailTVShowScreen(
                                                                  tvShowId: detailTVShowController
                                                                          .listRelatedTVShows
                                                                          .value[
                                                                      index]['id'],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: ItemMovie(
                                                            image: detailTVShowController
                                                                        .listRelatedTVShows
                                                                        .value[index]
                                                                    [
                                                                    'backdrop_path'] ??
                                                                detailTVShowController
                                                                        .listRelatedTVShows
                                                                        .value[index]
                                                                    [
                                                                    'poster_path'],
                                                            title: detailTVShowController
                                                                    .listRelatedTVShows
                                                                    .value[
                                                                index]['name'],
                                                            rating: detailTVShowController
                                                                    .listRelatedTVShows
                                                                    .value[index]
                                                                [
                                                                'vote_average'],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Center(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        deviceHeight * 0.05,
                                                    horizontal:
                                                        deviceWidth * 0.0,
                                                  ),
                                                  child: const Text(
                                                    'Data doesn\'t updated',
                                                    style: TextStyle(
                                                      color: Colors.yellow,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ],
                                  )
                                : const SizedBox()),
                            SizedBox(
                              height: deviceHeight * 0.008,
                            ),
                            const Text(
                              'Creadits',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Obx(
                              () => detailTVShowController
                                      .listCreaditsTVShows.value.isNotEmpty
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: deviceHeight * 0.01,
                                        horizontal: deviceWidth * 0.0,
                                      ),
                                      height: deviceHeight * 0.2,
                                      child: ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: detailTVShowController
                                            .listCreaditsTVShows.value.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return ItemCreadits(
                                            image: detailTVShowController
                                                .listCreaditsTVShows
                                                .value[index]['profile_path'],
                                            role: detailTVShowController
                                                    .listCreaditsTVShows
                                                    .value[index]
                                                ['known_for_department'],
                                            name: detailTVShowController
                                                .listCreaditsTVShows
                                                .value[index]['original_name'],
                                          );
                                        },
                                      ),
                                    )
                                  : Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: deviceHeight * 0.05,
                                          horizontal: deviceWidth * 0.0,
                                        ),
                                        child: const Text(
                                          'Data doesn\'t updated',
                                          style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
