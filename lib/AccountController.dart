import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';

import 'ClientController.dart';

class AccountController extends ClientController {
  Account? account;

  @override
  void onInit() {
    super.onInit();

    // Initialize the account object
    account = Account(client);
  }

  Future<void> createAccount(Map<String, dynamic> map) async {
    try {
      if (account != null) {
        final result = await account!.create(
          userId: map['userId'],
          email: map['email'],
          password: map['password'],
          name: map['name'],
        );
        print("AccountController:: createAccount $result");
      } else {
        print('AccountController:: createAccount - Account not initialized');
      }
    } catch (error) {
      showErrorMessage(error, "Error Account");
    }
  }

  Future<void> createEmailSession(Map<String, dynamic> map) async {
    try {
      if (account != null) {
        final result = await account!.createEmailSession(
          email: map['email'],
          password: map['password'],
        );
        print("AccountController:: createEmailSession $result");
      } else {
        print(
            'AccountController:: createEmailSession - Account not initialized');
      }
    } catch (error) {
      showErrorMessage(error, "Error Account");
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
