void main() {
  // invalid card number
  print(validateCardNumber(5419825003461210));

  // valid card number
  print(validateCardNumber(4916641859369080));
}

bool validateCardNumber(int cardNumber) {
  var numberList = cardNumber.toString().split('');
  var lastNumber = int.parse(numberList.removeLast());
  var sumElements = calculateElementsFromList(numberList);
  var finalNumber = 10 - (sumElements % 10) >= 10 ? 0 : 10 - (sumElements % 10);

  return finalNumber == lastNumber;
}

int calculateElementsFromList(List<String> list) {
  List<int> numberList = list.map((number) => int.parse(number)).toList();
  int sum = 0;

  for (int i = 0; i < numberList.length; i++) {
    var number = numberList[i];

    if (i.isEven) {
      var multipleNumber = number * 2;
      sum += multipleNumber >= 10 ? sumNumbers(multipleNumber) : multipleNumber;
    } else {
      sum += number;
    }
  }

  return sum;
}

int sumNumbers(int number) {
  String numberAsString = number.toString();

  return int.parse(numberAsString[0]) + int.parse(numberAsString[1]);
}
