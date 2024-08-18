import 'package:flutter/material.dart';

class AnswersButton extends StatelessWidget {
  const AnswersButton({super.key, required this.answer, required this.onTab});

  final String answer;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTab,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: const Color.fromARGB(255, 40, 2, 72),
        foregroundColor: Colors.white,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20),
        // ),
      ),
      child: Text(
        answer,
        textAlign: TextAlign.center,
      ),
    );
  }
}
