import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solva_guess_number_app/bloc/cubit/guess_number_cubit.dart';
import 'package:solva_guess_number_app/widgets/custom_text_field_widget.dart';

class FirstPage extends StatefulWidget {
  final String firstNumber;
  final int secondNumber;
  const FirstPage(this.firstNumber, this.secondNumber, {super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GuessNumberCubit(widget.secondNumber),
      child: BlocBuilder<GuessNumberCubit, GuessNumberState>(
        builder: (context, state) {
          Color backgroundColor = Colors.black;
          if (state is GuessNumberSucess) {
            backgroundColor = state.backgroundColor;
          } else if (state is GuessNumberFault) {
            backgroundColor = state.backgroundColor;
          } else if (state is GuessNumberGameOver) {
            backgroundColor = state.backgroundColor;
          }

          return Scaffold(
            backgroundColor: backgroundColor,
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Угадайте номер',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFieldWidget(numberController),
                  const SizedBox(height: 20),
                  Text(
                    'У вас ${state.chanceLeft} попыток',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                      onPressed: () {
                        context.read<GuessNumberCubit>().checkNumber(
                              widget.firstNumber,
                              numberController.text,
                            );
                        widget.firstNumber == numberController.text ? Navigator.pop(context) : '';
                        state.chanceLeft == 0 ? Navigator.pop(context) : '';
                        numberController.clear();
                      },
                      child: const Text('OK')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
