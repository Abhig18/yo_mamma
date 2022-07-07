import 'dart:math';

Set<int> generateRandomNumbers(int n, int max) {
  Set<int> indexList = {};

  Random random = Random();
  int randomNumber = random.nextInt(max - 1);

  indexList.add(randomNumber);
  while (indexList.length != n) {
    int randomNumber = random.nextInt(max - 1);
    indexList.add(randomNumber);
  }

  return indexList;
}
