import 'package:flutter/material.dart';


import '../network_service/api_response/api_response.dart';
import '../network_service/app_logger.dart';
import '../network_service/models/PackageResponse.dart';
import '../network_service/models/movie_response.dart';
import '../respositories/home_repository.dart';

class HomeProvider with ChangeNotifier {
  ApiResponse<PackageResponse> packagesList = ApiResponse.loading();

  setMoviesList(ApiResponse<PackageResponse> response) {
    packagesList = response;
    AppLogger.logger.d("packagesList: ${packagesList.data?.toJson()}");
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());
    // Call Function from the Repository Class
    await HomeRepository.homeRepositoryInstance.getMovieList().then((value) {
      AppLogger.logger.d("fetchMoviesListApi: ${value!.data!.toJson()}");
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
