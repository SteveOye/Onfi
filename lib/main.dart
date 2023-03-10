import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onfinance/ui/screens/polygon_screen.dart';
import 'package:onfinance/ui/style/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Polygon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'SF',
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: AppColor().indicatorBgColor,
        ),
      ),
      home: const PolygonScreen(),
    );
  }
}
