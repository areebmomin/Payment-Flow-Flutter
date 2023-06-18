import 'package:flutter/material.dart';
import 'package:shaadi_payment_flow/pp1/pp1_page_ui.dart';
import 'package:shaadi_payment_flow/utils/colors.dart';
import 'data/pp1_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shaadi Payment Flow',
      theme: ThemeData(
        primarySwatch: shaadiThemeMaterialColor,
        fontFamily: 'Inter',
      ),
      home: PP1Page(PP1Data()),
    );
  }
}
