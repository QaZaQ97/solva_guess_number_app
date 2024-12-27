import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solva_guess_number_app/bloc/cubit/guess_number_cubit.dart';
import 'package:solva_guess_number_app/utils/app_text_styles.dart';
import 'package:solva_guess_number_app/widgets/app_alert_dialogs.dart';
import 'package:solva_guess_number_app/widgets/custom_text_field_widget.dart';
import 'package:solva_guess_number_app/widgets/generate_random_number.dart';

class FirstPage extends StatefulWidget {
  final int arrangeMaxNumber;
  final int maxAttempts;

  const FirstPage(this.arrangeMaxNumber, this.maxAttempts, {super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GuessNumberCubit(widget.maxAttempts),
      child: Scaffold(
        body: BlocListener<GuessNumberCubit, GuessNumberState>(
          listener: (context, state) {
            if (state is GuessNumberSuccess) {
              showAlertDialog(context, 'Поздаврялем!', 'Вы угадали число');
            } else if (state is GuessNumberFault) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Неправильный ответ. Попробуйте снова!'),
                  duration: Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.orange,
                ),
              );
            } else if (state is GuessNumberGameOver) {
              showAlertDialog(
                  context,
                  'Игра окончена! Попытки закончились.',
                  'Слусайное число было ${generateRandomNumber(
                    widget.arrangeMaxNumber,
                  )}');
            }
          },
          child: BlocBuilder<GuessNumberCubit, GuessNumberState>(
            builder: (context, state) {
              Color backgroundColor = Colors.black;

              if (state is GuessNumberSuccess) {
                backgroundColor = Colors.green;
              } else if (state is GuessNumberFault) {
                backgroundColor = Colors.red;
              } else if (state is GuessNumberGameOver) {
                backgroundColor = Colors.grey;
              }

              return Scaffold(
                backgroundColor: backgroundColor,
                body: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Угадайте номер',
                        textAlign: TextAlign.center,
                        style: AppTextStyles().fontSize20ColorWhite,
                      ),
                      const SizedBox(height: 20),

                      /// Text Field for entering number
                      CustomTextFieldWidget(numberController),

                      const SizedBox(height: 20),
                      Text(
                        state is GuessNumberGameOver ? 'Игра окончена!' : 'У вас ${state.attemptsLeft} попыток',
                        textAlign: TextAlign.center,
                        style: AppTextStyles().fontSize18ColorWhite,
                      ),
                      const SizedBox(height: 20),

                      /// Button to submit the guess
                      FilledButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
                        ),
                        onPressed: () {
                          context.read<GuessNumberCubit>().checkNumber(
                                widget.arrangeMaxNumber,
                                numberController.text,
                              );
                          numberController.clear();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
