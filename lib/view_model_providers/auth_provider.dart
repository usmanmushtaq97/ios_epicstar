import 'package:flutter/material.dart';

import '../network_service/NetworkUrls/app_network_urls.dart';
import '../network_service/app_logger.dart';
import '../network_service/models/login_response.dart';
import '../respositories/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  void setLoading({required bool isLoading}) {
    _loading = isLoading;
    notifyListeners();
  }

  Future<void> loginApi(
      {required dynamic data, required BuildContext context}) async {
    setLoading(isLoading: true);
    // Call Function from the Repository Class
    await AuthRepository.authRepositoryInstance
        .authLoginApi(data: data, url: AppNetworkUrls.loginEndPint)
        .then((value) {
      final loginResponse = LoginResponse.fromJson(value);
      AppLogger.logger.d("UILoginHit: $loginResponse");
    }).onError((error, stackTrace) {
      setLoading(isLoading: false);
    });
  }
}
