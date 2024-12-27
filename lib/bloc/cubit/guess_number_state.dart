part of 'guess_number_cubit.dart';

@immutable
abstract class GuessNumberState {
  final int attemptsLeft;
  const GuessNumberState(this.attemptsLeft);
}

final class GuessNumberInitial extends GuessNumberState {
  const GuessNumberInitial(int attemptsLeft) : super(attemptsLeft);
}

class GuessNumberDefault extends GuessNumberState {
  const GuessNumberDefault(int attemptsLeft) : super(attemptsLeft);
  final Color backgroundColor = Colors.black;
}

class GuessNumberSuccess extends GuessNumberState {
  const GuessNumberSuccess(int attemptsLeft) : super(attemptsLeft);
  final Color backgroundColor = Colors.green;
}

class GuessNumberFault extends GuessNumberState {
  const GuessNumberFault(int attemptsLeft) : super(attemptsLeft);
  final Color backgroundColor = Colors.red;
}

class GuessNumberGameOver extends GuessNumberState {
  const GuessNumberGameOver() : super(0);
  final Color backgroundColor = Colors.red;
}
