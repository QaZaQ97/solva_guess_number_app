import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:solva_guess_number_app/presentation/first_page.dart';
import 'package:solva_guess_number_app/widgets/onbording_text_widget.dart';
import 'package:solva_guess_number_app/widgets/custom_text_field_widget.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                /// greeding text
                const OnbordingTextWidget(),

                const SizedBox(height: 50),

                /// first row with text with field
                Row(
                  children: [
                    const Text(
                      'Введите число с 1 до ',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      width: 40,
                      child: CustomTextFieldWidget(firstNumberController),
                    ),
                  ],
                ),
                const SizedBox(height: 50),

                /// second row with text field
                Row(
                  children: [
                    const Text(
                      'Сколько попыток хотите ? ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: CustomTextFieldWidget(secondNumberController),
                    ),
                  ],
                ),
              ],
            ),

            /// text button to start the game
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => FirstPage(
                            firstNumberController.text,
                           int.parse( secondNumberController.text),
                          )),
                );
              },
              child: const Text('Начать игру'),
            ),

            /// bottom animation
            Lottie.asset('assets/onbording_screen_animation.json'),
          ],
        ),
      ),
    );
  }
}
