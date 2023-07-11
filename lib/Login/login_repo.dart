
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodsetup/Data/Network/network_api_services.dart';
import 'package:riverpodsetup/ListUser/user_display.dart';

class LoginRepository{
  final _api=NetworkApiServices();

  Future<void> userLogin(String email,String password,BuildContext context)async{
    Map data={
      "email":email,
      "password":password
    };
   await _api.postApi(data,"https://reqres.in/api/login").then((value){
    print(value);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDisplayView()));

    }).onError((error, stackTrace){
      if (kDebugMode) {
        print("error :$error");
      }
    });
  }
}
 final loginProvider=Provider<LoginRepository>((ref) =>LoginRepository());