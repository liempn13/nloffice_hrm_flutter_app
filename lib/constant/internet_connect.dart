import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityProvider extends ChangeNotifier {
  bool isConnected = true;
  late StreamSubscription subscription;

  void initialise(context) async {
    Connectivity connectivity = Connectivity();

    ConnectivityResult result = await connectivity.checkConnectivity();
    checkStatus(result, context);
    subscription = connectivity.onConnectivityChanged.listen((result) {
      checkStatus(result, context);
    });
  }

  void checkStatus(ConnectivityResult result, context) async {
    // Kiểm tra trạng thái thiết bị kết nối mạng chưa
    try {
      final result = await InternetAddress.lookup(
          'google.com'); // Trả về kết quả kiểm tra bằng cách tìm kiếm với google.com
      if (result.isEmpty && result[0].rawAddress.isEmpty) {
        isConnected = false;
        notifyListeners();
      } else {
        isConnected = true;
        notifyListeners();
      }
    } on SocketException catch (_) {
      isConnected = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }
}
