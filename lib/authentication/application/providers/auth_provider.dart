import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodsetup/authentication/application/notifiers/auth_notifier.dart';
import 'package:riverpodsetup/authentication/data/repo/auth_repo.dart';

final authNotifierProvider=StateNotifierProvider<AuthNotifier,bool>((ref){
  return AuthNotifier(ref.watch(authProvider));
  
});