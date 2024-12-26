import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'guess_number_state.dart';

class GuessNumberCubit extends Cubit<GuessNumberState> {
  int chanceLeft;
  GuessNumberCubit(this.chanceLeft) : super(GuessNumberInitial(chanceLeft));

  void checkNumber(String enteredNumber, String correctNumber) {
    if (enteredNumber == correctNumber) {
      emit(GuessNumberSucess(chanceLeft));
    } else {
      chanceLeft--;
      if (chanceLeft > 0) {
        emit(GuessNumberFault(chanceLeft));
      } else {
        emit(const GuessNumberGameOver());
 }
    }
  }

  void resetState() {
    emit(GuessNumberDefault(chanceLeft));
  }
}
