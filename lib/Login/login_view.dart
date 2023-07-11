import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodsetup/Login/login_repo.dart';

class LoginView extends ConsumerWidget {
   LoginView({super.key});
  final emailController=TextEditingController();

  final passController=TextEditingController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
              ElevatedButton(
                onPressed: (){
                  ref.read(loginProvider).userLogin(emailController.text, passController.text,context);
              }, child: Text("login")
              )
            ],
          ),
        ),
      ),
    );
  }
}