import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_riverpod/build_button.dart';
import 'package:calculator_riverpod/build_result.dart';
import 'package:flutter/material.dart';

class MainPage extends ConsumerWidget {
  final String title;
  const MainPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: Container(
        margin: const EdgeInsets.only(left: 8.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 28),
        ),
      ),
    ),
    body: SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(child: buildResult()),
          Expanded(flex: 2, child: buildButtons()),
        ],
      ),
    ),
  );

}
