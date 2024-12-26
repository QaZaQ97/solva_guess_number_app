part of 'guess_number_cubit.dart';

@immutable
abstract class GuessNumberState {
  final int chanceLeft;
  const GuessNumberState(this.chanceLeft);
}

final class GuessNumberInitial extends GuessNumberState {
  const GuessNumberInitial(int chanceLeft) : super(chanceLeft);
}

class GuessNumberDefault extends GuessNumberState {
  const GuessNumberDefault(int chanceLeft) : super(chanceLeft);
  final Color backgroundColor = Colors.black;
}

class GuessNumberSucess extends GuessNumberState {
  const GuessNumberSucess(int chanceLeft) : super(chanceLeft);
  final Color backgroundColor = Colors.green;
}

class GuessNumberFault extends GuessNumberState {
  const GuessNumberFault(int chanceLeft) : super(chanceLeft);
  final Color backgroundColor = Colors.red;
}

class GuessNumberGameOver extends GuessNumberState {
  const GuessNumberGameOver() : super(0);
  final Color backgroundColor = Colors.red;
}
