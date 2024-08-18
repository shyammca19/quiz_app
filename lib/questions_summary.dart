import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (item) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: item['user_answer'] == item['correct_answer']
                          ? const Color.fromARGB(255, 18, 168, 18)
                          : const Color.fromARGB(255, 235, 63, 51),
                    ),
                    child: Text(
                      ((item['question_index'] as int) + 1).toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          item['question'] as String,
                          style: const TextStyle(
                            color: Colors.amber,
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          item['user_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 226, 127, 243),
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          item['correct_answer'] as String,
                          style: const TextStyle(
                            color: Colors.cyan,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
