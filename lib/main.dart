import 'package:desafio_mobile_dev/app/data/models/hive_db.dart';
import 'package:desafio_mobile_dev/app/routes/app_routes.dart';
import 'package:desafio_mobile_dev/app/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Hive.initFlutter();
final HiveDB db = await HiveDB.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: AppRoutes.upload,
      routes: AppRoutes.routes,
      theme: AppTheme.themeData,
    );
  }
}
