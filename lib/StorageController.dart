import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';

import 'ClientController.dart';

class StorageController extends ClientController {
  Storage? storage;

  @override
  void onInit() {
    super.onInit();

    // Inisialisasi objek storage
    storage = Storage(client);
  }

  Future<void> storeImage() async {
    try {
      if (storage != null) {
        final result = await storage!.createFile(
          bucketId: '[65676776575f59fd0583]',
          fileId: ID.unique(),
          file: InputFile.fromPath(
            path:
                'assets/image.jpg', // Perbaiki path sesuai struktur proyek Anda
            filename: 'image.jpg',
          ),
        );

        print("StorageController:: storeImage $result");
      } else {
        print('StorageController:: storeImage - Storage tidak diinisialisasi');
      }
    } catch (error) {
      showErrorMessage(error, "Error Storage");
    }
  }

  void showErrorMessage(dynamic error, String title) {
    Get.defaultDialog(
      title: title,
      titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
      titleStyle: Get.context?.theme.textTheme.titleLarge,
      content: Text(
        "$error",
        style: Get.context?.theme.textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
    );
  }
}
