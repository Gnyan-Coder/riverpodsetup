import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodsetup/users/application/provider.dart';


class UserDisplayView extends ConsumerWidget {
  const UserDisplayView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final async=ref.watch(userListFutureProvider);
    return Scaffold(
      body: async.when(
        data: (userData){
          return RefreshIndicator(
            onRefresh: () => ref.refresh(userListFutureProvider.future),
            child: ListView.builder(
              itemCount: userData.data!.length,
              itemBuilder: (context,index){
                final data=userData.data![index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Image.network("${data.avatar}"),
                  ),
                  title: Text(data.email.toString()),
                );
              }
              ),
          );
        },
       error: (e,stackStrace)=>Center(child: Text(e.toString()),),
        loading:()=>Center(child: CircularProgressIndicator(),)
        ),
    );
  }
}