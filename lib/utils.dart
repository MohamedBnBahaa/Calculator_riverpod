//BAD:
// class Utils{
//   static bool isOperator(
//       String buttonText,
//       {bool hasEquals = false}
//       ){
//     final operators = ['+', '-', '÷', '×', '.',]..addAll(hasEquals ? ['='] : []);
//     return operators.contains(buttonText);
//   }
// }

//https://github.com/dart-lang/language/blob/master/accepted/2.3/spread-collections/feature-specification.md
//GOOD:
class Utils{
  static bool isOperator(
      String buttonText,
      {bool hasEquals = false}
      ){
    final operators = ['+', '-', '÷', '×', '.',...hasEquals ? ['='] : []];
    return operators.contains(buttonText);
  }
  static bool isOperatorAtEnd(String equation){
    if(equation.isNotEmpty){
      return Utils.isOperator(equation.substring(equation.length-1));
    }else{
      return false;
    }
  }
}

