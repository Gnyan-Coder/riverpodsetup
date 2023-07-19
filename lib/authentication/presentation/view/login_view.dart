import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodsetup/authentication/application/providers/auth_provider.dart';


class LoginView extends StatelessWidget {
   LoginView({super.key});
  final emailController=TextEditingController();

  final passController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(),
              ),
              TextField(
                controller: passController,
              ),
              Consumer(
                builder: (context,ref,_){
                  bool isLoginLoading=ref.watch(authNotifierProvider);
                  return isLoginLoading?
                  const CircularProgressIndicator():
                  ElevatedButton(onPressed: (){
                    ref.read(authNotifierProvider.notifier).login(
                      email: emailController.text,
                       password: passController.text,
                        context: context);
                  }, child: Text("login"));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}