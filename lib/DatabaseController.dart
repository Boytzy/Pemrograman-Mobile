import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';

import 'ClientController.dart';

class DatabaseController extends ClientController {
  Databases? databases;

  @override
  void onInit() {
    super.onInit();

    // Inisialisasi objek databases
    databases = Databases(client);
  }

  Future<void> storeUserName(Map<String, dynamic> map) async {
    try {
      if (databases != null) {
        final result = await databases!.createDocument(
          databaseId: "656762cdd5c779e31a2a",
          documentId: ID.unique(),
          collectionId: "656762ec998c1515b92e",
          data: map,
          permissions: [
            Permission.read(Role.user("656766c1e1176081f72b")),
            Permission.update(Role.user("656766c1e1176081f72b")),
            Permission.delete(Role.user("656766c1e1176081f72b")),
          ],
        );
        print("DatabaseController:: storeUserName $result");
      } else {
        print(
            'DatabaseController:: storeUserName - Databases tidak diinisialisasi');
      }
    } catch (error) {
      showErrorMessage(error, "Error Database");
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
