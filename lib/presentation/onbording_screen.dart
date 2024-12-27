import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:solva_guess_number_app/presentation/first_page.dart';
import 'package:solva_guess_number_app/utils/app_text_styles.dart';
import 'package:solva_guess_number_app/widgets/custom_text_field_widget.dart';
import 'package:solva_guess_number_app/widgets/generate_random_number.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  TextEditingController arrangeMaxNumberController = TextEditingController();
  TextEditingController maxAttemptsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 20),
            Text(
              'Добро пожаловать в игру',
              style: AppTextStyles().fontSize28ColorWhite,
            ),
            Text(
              '"Guess number"',
              style: AppTextStyles().fontSize32ColorPurple,
            ),
            const SizedBox(height: 20),
            Text(
              'Что бы начать игру заполните пустые поля',
              style: AppTextStyles().fontSize20ColorWhite,
            ),

            /// first row with text with field
            Row(
              children: [
                Text(
                  'Введите число с 1 до ',
                  style: AppTextStyles().fontSize18ColorWhite,
                ),
                SizedBox(
                  width: 40,
                  child: CustomTextFieldWidget(arrangeMaxNumberController),
                ),
              ],
            ),

            /// second row with text field
            Row(
              children: [
                Text(
                  'Сколько попыток хотите ? ',
                  style: AppTextStyles().fontSize18ColorWhite,
                ),
                SizedBox(
                  width: 40,
                  child: CustomTextFieldWidget(maxAttemptsController),
                ),
              ],
            ),

            /// text button to start the game
            TextButton(
              onPressed: () {
                if (arrangeMaxNumberController.text == '' || maxAttemptsController.text == '') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Заполните пустые поля'),
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FirstPage(
                              generateRandomNumber(int.parse(arrangeMaxNumberController.text)),
                              int.parse(maxAttemptsController.text),
                            )),
                  );
                }
              },
              child: Text('Начать игру', style: AppTextStyles().fontSize28ColorWhite),
            ),

            /// bottom animation
            Lottie.asset('assets/onbording_screen_animation.json'),
          ],
        ),
      ),
    );
  }
}
