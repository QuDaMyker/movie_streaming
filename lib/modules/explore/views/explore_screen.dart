import 'dart:ffi';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming/core/values/search_category.dart';
import 'package:movie_streaming/modules/explore/controllers/explore_controller.dart';
import 'package:movie_streaming/modules/explore/views/widgets/item_movie_search.dart';

// ignore: must_be_immutable
class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});
  late double deviceHeight;
  late double deviceWidth;
  @override
  Widget build(BuildContext context) {
    final exploreController = Get.put(ExploreController());
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: SizedBox(
            height: deviceHeight,
            width: deviceWidth,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: deviceHeight,
                  width: deviceWidth,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          'https://images.unsplash.com/photo-1682688759157-57988e10ffa8?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 15,
                      sigmaY: 15,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, deviceHeight * 0.02, 0, 0),
                  width: deviceWidth * 0.88,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: deviceHeight * 0.08,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                switch (exploreController.dropdownValue.value) {
                                  case SearchCategory.collection:
                                    exploreController.getCollectionSearch(
                                      exploreController
                                          .searchTextFieldController.value.text,
                                      1,
                                    );
                                    break;
                                  case SearchCategory.company:
                                    exploreController.getCompanySearch(
                                      exploreController
                                          .searchTextFieldController.value.text,
                                      1,
                                    );
                                    break;
                                  case SearchCategory.keyword:
                                    exploreController.getKeywordSearch(
                                      exploreController
                                          .searchTextFieldController.value.text,
                                      1,
                                    );
                                    break;
                                  case SearchCategory.movie:
                                    exploreController.getMovieSearch(
                                      exploreController
                                          .searchTextFieldController.value.text,
                                      1,
                                    );
                                    break;
                                  case SearchCategory.multi:
                                    exploreController.getMultiSearch(
                                      exploreController
                                          .searchTextFieldController.value.text,
                                      1,
                                    );
                                    break;
                                  case SearchCategory.person:
                                    exploreController.getPersonSearch(
                                      exploreController
                                          .searchTextFieldController.value.text,
                                      1,
                                    );
                                    break;
                                  case SearchCategory.tv:
                                    exploreController.getTvSearch(
                                      exploreController
                                          .searchTextFieldController.value.text,
                                      1,
                                    );
                                    break;
                                  case SearchCategory.all:
                                    exploreController.getMultiSearch(
                                      exploreController
                                          .searchTextFieldController.value.text,
                                      1,
                                    );
                                    break;
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: deviceHeight * 0.01,
                                  bottom: deviceHeight * 0.01,
                                  left: deviceWidth * 0.02,
                                  right: deviceWidth * 0.02,
                                ),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white24,
                                  size: deviceWidth * 0.07,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: deviceWidth * 0.50,
                              height: deviceHeight * 0.05,
                              child: TextField(
                                onChanged: (value) {
                                  exploreController
                                      .searchTextFieldController.text = value;
                                },
                                controller:
                                    exploreController.searchTextFieldController,
                                onSubmitted: (value) {
                                  switch (
                                      exploreController.dropdownValue.value) {
                                    case SearchCategory.collection:
                                      exploreController.getCollectionSearch(
                                          value, 1);
                                      break;
                                    case SearchCategory.company:
                                      exploreController.getCompanySearch(
                                          value, 1);
                                      break;
                                    case SearchCategory.keyword:
                                      exploreController.getKeywordSearch(
                                          value, 1);
                                      break;
                                    case SearchCategory.movie:
                                      exploreController.getMovieSearch(
                                          value, 1);
                                      break;
                                    case SearchCategory.multi:
                                      exploreController.getMultiSearch(
                                          value, 1);
                                      break;
                                    case SearchCategory.person:
                                      exploreController.getPersonSearch(
                                          value, 1);
                                      break;
                                    case SearchCategory.tv:
                                      exploreController.getTvSearch(value, 1);
                                      break;
                                    case SearchCategory.all:
                                      exploreController.getMultiSearch(
                                          value, 1);
                                      break;
                                  }
                                },
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.white54),
                                  filled: false,
                                  fillColor: Colors.white24,
                                  hintText: 'Search...',
                                  focusColor: Colors.white,
                                ),
                              ),
                            ),
                            Obx(
                              () => DropdownButton(
                                dropdownColor: Colors.black38,
                                value: exploreController.dropdownValue.value,
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.white54,
                                ),
                                underline: Container(
                                  height: 1,
                                  color: Colors.white24,
                                ),
                                onChanged: (value) {
                                  exploreController.dropdownValue.value =
                                      value!;
                                },
                                items: const [
                                  DropdownMenuItem(
                                    value: SearchCategory.collection,
                                    child: Text(
                                      SearchCategory.collection,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: SearchCategory.company,
                                    child: Text(
                                      SearchCategory.company,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: SearchCategory.keyword,
                                    child: Text(
                                      SearchCategory.keyword,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: SearchCategory.movie,
                                    child: Text(
                                      SearchCategory.movie,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: SearchCategory.multi,
                                    child: Text(
                                      SearchCategory.multi,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: SearchCategory.person,
                                    child: Text(
                                      SearchCategory.person,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: SearchCategory.tv,
                                    child: Text(
                                      SearchCategory.tv,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: SearchCategory.all,
                                    child: Text(
                                      SearchCategory.all,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                                itemHeight: deviceHeight * 0.065,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: deviceHeight * 0.83,
                        padding: EdgeInsets.only(
                          top: deviceHeight * 0.01,
                          bottom: deviceHeight * 0.1,
                        ),
                        child: Obx(
                          () => exploreController.isLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.yellow,
                                    backgroundColor: Colors.black,
                                  ),
                                )
                              : exploreController
                                      .listResultSearch.value.isNotEmpty
                                  ? ListView.builder(
                                      itemCount: exploreController
                                          .listResultSearch.value.length,
                                      itemBuilder: (context, index) {
                                        return ItemMovieSearch(
                                          height: deviceHeight * 0.15,
                                          width: deviceWidth,
                                          data: exploreController
                                              .listResultSearch.value[index],
                                        );
                                      },
                                    )
                                  : exploreController.searchTextFieldController
                                          .text.isEmpty
                                      ? const Center(
                                          child: Text(
                                            'Let\'s find your media',
                                            style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        )
                                      : const Center(
                                          child: Text(
                                            'No Result Found!',
                                            style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
