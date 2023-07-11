import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodsetup/ListUser/user_model.dart';
import 'package:riverpodsetup/ListUser/user_repo.dart';

final userListFutureProvider=FutureProvider<UserListModel>((ref) async{
  return ref.read(userListProvider).userDisplay();
});