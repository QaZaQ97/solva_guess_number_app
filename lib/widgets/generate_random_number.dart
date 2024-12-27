import 'dart:math';

int generateRandomNumber(int maxNumber) {
  Random random = Random();
  int randomNUmber = random.nextInt(maxNumber);
  return randomNUmber;
}
