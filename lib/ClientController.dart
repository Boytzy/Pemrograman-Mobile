import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';


class ClientController extends GetxController {
  final Client client = Client();

  @override
  void onInit() {
    super.onInit();

    // Konfigurasi Appwrite
    const endPoint = "https://cloud.appwrite.io/v1";
    const projectID = "65674a9d69cbce484a2f";

    client
      ..setEndpoint(endPoint)
      ..setProject(projectID)
      ..setSelfSigned(status: true);
  }
}
