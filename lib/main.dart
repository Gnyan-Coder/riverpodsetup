import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodsetup/Login/login_view.dart';

void main() {
  runApp(const ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  bool isPressed=true;

  @override
  Widget build(BuildContext context) {
    // final distance=isPressed? const Offset(10,10):const Offset(28, 28);
    // double blur=isPressed?5.0:50.0;
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Listener(
              //   onPointerUp: (_)=>setState(() {
              //     isPressed=false;
              //   }),
              //   onPointerDown: (_)=>setState(() {
              //     isPressed=true;
              //   }),
              //   child: AnimatedContainer(
              //     duration: const Duration(milliseconds: 100),
              //     height: 50,
              //     width: 200,
              //     decoration: BoxDecoration(
              //       color: Color(0xFFE7ECEF),
              //       // color: Colors.teal,
              //       borderRadius: BorderRadius.circular(30),
              //       border: Border.all(width: 0.1),
              //       boxShadow: [
              //         BoxShadow(
              //           offset: -distance,
              //           color:Colors.white,
              //           blurRadius:blur,
              //           inset: isPressed
              //         ),
              //          BoxShadow(
              //           offset:distance,
              //           // color:const Color(0XFFA7A9AF),
              //           color: Colors.teal,
              //           blurRadius: blur,
              //           inset: isPressed
              //         )
              //       ]
              //     ),
              //   ),
              // )

              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()));

              }, child: Text("login Future Provider"))
            ],
          ),
        ),
      ),

    );
  }
}

