
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodsetup/Data/Network/network_api_services.dart';
import 'package:riverpodsetup/ListUser/user_model.dart';

class UserRepository{
  final _api=NetworkApiServices();

  Future<UserListModel> userDisplay()async{
    Completer<UserListModel> completer=Completer();
   await _api.getApi("https://reqres.in/api/users?page=2").then((value){
    return completer.complete(UserListModel.fromJson(value));
    print(value);
    }).onError((error, stackTrace){
      if (kDebugMode) {
        print("error :$error");
      }
    });
    return completer.future;
  }
}
 final userListProvider=Provider<UserRepository>((ref) =>UserRepository());