import 'package:flutter/material.dart';
import 'package:learn_http/app.dart';
///  open terminal poject ios folder and write this code: arch -x86_64 pod install or arch -x86_64 pod update
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const App());
}