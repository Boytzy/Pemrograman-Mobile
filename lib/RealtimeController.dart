import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';

import 'ClientController.dart';

class RealtimeController extends ClientController {
  Realtime? realtime;

  @override
  void onInit() {
    super.onInit();

    // Appwrite
    realtime = Realtime(client);
  }

  void subsUserName() async {
    if (realtime != null) {
      final subscription = realtime!.subscribe(['files']);

      subscription.stream.listen((response) {
        if (response.events.contains('buckets.*.files.*.create')) {
          print("RealtimeController:: subsUserName ${response.payload}");
          print("RealtimeController:: subsUserName ${response.events}");
        }
      });
    } else {
      print('RealtimeController:: subsUserName - Realtime not initialized');
    }
  }
}
