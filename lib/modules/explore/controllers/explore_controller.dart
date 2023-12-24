import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming/core/values/search_category.dart';
import 'package:movie_streaming/services/explore_servies.dart';

class ExploreController extends GetxController {
  late TextEditingController searchTextFieldController;
  var dropdownValue = Rx<String>(SearchCategory.collection);

  var listCollectionSearch = Rx<List<Map<String, dynamic>>>([]);
  var listCompanySearch = Rx<List<Map<String, dynamic>>>([]);
  var listKeywordSearch = Rx<List<Map<String, dynamic>>>([]);
  var listMovieSearch = Rx<List<Map<String, dynamic>>>([]);
  var listMultiSearch = Rx<List<Map<String, dynamic>>>([]);
  var listPersonSearch = Rx<List<Map<String, dynamic>>>([]);
  var listTvSearch = Rx<List<Map<String, dynamic>>>([]);
  var listAllSearch = Rx<List<Map<String, dynamic>>>([]);
  var listResultSearch = Rx<List<Map<String, dynamic>>>([]);

  var isLoading = Rx<bool>(false);

  @override
  void onInit() {
    searchTextFieldController = TextEditingController();
    super.onInit();
  }

  Future<void> getCollectionSearch(String query, int page) async {
    isLoading.value = true;
    listResultSearch.value =
        await ExploreServices().getCollectionSearch(query, page);
    isLoading.value = false;
  }

  Future<void> getCompanySearch(String query, int page) async {
    isLoading.value = true;
    listResultSearch.value =
        await ExploreServices().getCompanySearch(query, page);
    isLoading.value = false;
  }

  Future<void> getKeywordSearch(String query, int page) async {
    isLoading.value = true;
    listResultSearch.value =
        await ExploreServices().getKeywordSearch(query, page);
    isLoading.value = false;
  }

  Future<void> getMovieSearch(String query, int page) async {
    isLoading.value = true;
    listResultSearch.value =
        await ExploreServices().getMovieSearch(query, page);
    isLoading.value = false;
  }

  Future<void> getMultiSearch(String query, int page) async {
    isLoading.value = true;
    listResultSearch.value =
        await ExploreServices().getMultiSearch(query, page);
    isLoading.value = false;
  }

  Future<void> getPersonSearch(String query, int page) async {
    isLoading.value = true;
    listResultSearch.value =
        await ExploreServices().getPersonSearch(query, page);
    isLoading.value = false;
  }

  Future<void> getTvSearch(String query, int page) async {
    isLoading.value = true;
    listResultSearch.value = await ExploreServices().getTVSearch(query, page);
    isLoading.value = false;
  }

  Future<void> getAllSearch(String query, int page) async {
    isLoading.value = true;

    isLoading.value = false;
  }
}
