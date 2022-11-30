import 'package:calculator_riverpod/button_widget.dart';
import 'package:calculator_riverpod/colors.dart';
import 'package:calculator_riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget buildButtons () => Container(
  padding: const EdgeInsets.all(16.0,),
  decoration: const BoxDecoration(
    borderRadius: BorderRadius.vertical(top: Radius.circular(32),),
    color: MyColors.background2,
  ),
  child: Column(
    children: <Widget>[
      buildButtonRow('AC', '<', '', '÷',),
      buildButtonRow('7', '8', '9', '×',),
      buildButtonRow('4', '5', '6', '-',),
      buildButtonRow('1', '2', '3', '+',),
      buildButtonRow('0', '.', '', '=',),
    ],
  ),
);

Widget buildButtonRow (
    String first,
    String second,
    String third,
    String fourth,
    ){
  final row = [first, second, third, fourth,];
  return Expanded(
    child: Row(
      children: row.map(
              (text) => ButtonWidget(
            text: text,
            onClicked: () => onClickedButton(text),
            onClickedLong: () => onLongClickedButton(text),
          )).toList(),
    ),
  );
}

void onClickedButton(String buttonText){
  Provider((ref) {
    final calculator = ref.read(calculatorProvider);
    switch(buttonText){
      case 'AC':
        calculator.reset();
        break;
      case '=':
        calculator.equals();
        break;
      case '<':
        calculator.delete();
        break;
      default:
        calculator.append(buttonText);
        break;
    }
  });
}

void onLongClickedButton(String text){

  Provider((ref) {
    // use ref to obtain other providers
    final calculator = ref.watch(calculatorProvider);

    if(text == '<'){
      calculator.reset();
    }
  });

}


