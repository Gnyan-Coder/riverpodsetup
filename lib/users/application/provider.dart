import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodsetup/users/domain/model/user_model.dart';
import 'package:riverpodsetup/users/data/repo/user_repo.dart';

final userListFutureProvider=FutureProvider<UserListModel>((ref) async{
  return ref.read(userListProvider).userDisplay();
});