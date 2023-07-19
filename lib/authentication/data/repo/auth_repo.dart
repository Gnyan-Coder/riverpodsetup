
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodsetup/api/network/network_api_services.dart';
import 'package:riverpodsetup/api/reponse/api_response.dart';
import 'package:riverpodsetup/res/app_url.dart';

import 'package:riverpodsetup/users/presentation/view/user_view.dart';


class AuthRepo{

  final _api=NetworkApiServices();

  bool _loginLoading=false;


  bool get loginLoading=>_loginLoading;
  
  Future<bool> userLogin({required String email,required String password})async{
    _loginLoading=true;
    Map data={
      "email":email,
      "password":password
    };
   await _api.postApi(data,AppUrl.login).then((value){
    _loginLoading=false;
    print(value);
   
    }).onError((error, stackTrace){
      _loginLoading=false;
      if (kDebugMode) {
        print("error :$error");
      }
    });

    return _loginLoading;
  }
}
 final authProvider=Provider<AuthRepo>((ref) =>AuthRepo());