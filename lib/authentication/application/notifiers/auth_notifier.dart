import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodsetup/authentication/data/repo/auth_repo.dart';
import 'package:riverpodsetup/users/presentation/view/user_view.dart';

class AuthNotifier extends StateNotifier<bool> {
  final AuthRepo _authRepo;
  AuthNotifier(this._authRepo) : super(false);

  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;
    await _authRepo.userLogin(email: email, password: password).then((value) {
      state = false;
       Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDisplayView()));
    }).onError((error, stackTrace) {
      state = false;
    });
  }
}
