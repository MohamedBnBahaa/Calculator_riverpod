import 'package:calculator_riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget buildResult() => Consumer(
    builder:(context, ref, child){
      final state = ref.read(calculatorProvider);
      return Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              state.equation,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 36.0, height: 1,),
            ),
            const SizedBox(height: 24.0,),
            Text(
              state.result,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 18.0,),
            ),
          ],
        ),
      );
    }
);