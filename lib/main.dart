import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/core/config/constants/storage_keys.dart';
import 'package:notes_app/core/config/theme/app_theme.dart';
import 'package:notes_app/core/utils/shared_prefs.dart';
import 'package:notes_app/features/home/home_screen.dart';
import 'package:notes_app/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();


  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.standart,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
