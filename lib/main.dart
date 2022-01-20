import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scroll/pages/page_grid_view.dart';
import 'package:scroll/pages/page_list_view.dart';
import 'package:scroll/pages/page_portrait_paysage.dart';
import 'package:scroll/pages/page_single_child_scroll.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PagePortraitPaysage(),
    );
  }
}
