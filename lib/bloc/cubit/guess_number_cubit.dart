import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'guess_number_state.dart';

class GuessNumberCubit extends Cubit<GuessNumberState> {
  int attemptsLeft;
  GuessNumberCubit(this.attemptsLeft) : super(GuessNumberInitial(attemptsLeft));

  void checkNumber(int enteredNumber, String arrangeMaxNumber) {
    if (enteredNumber == arrangeMaxNumber) {
      emit(GuessNumberSuccess(attemptsLeft));
    } else {
      attemptsLeft--;
      if (attemptsLeft > 0) {
        emit(GuessNumberFault(attemptsLeft));
      } else {
        emit(const GuessNumberGameOver());
      }
    }
  }
}
