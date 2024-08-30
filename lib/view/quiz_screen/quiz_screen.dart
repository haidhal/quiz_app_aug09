import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quiz_app_aug09/dummy_db.dart';
import 'package:quiz_app_aug09/view/option_card/option_card.dart';
import 'package:quiz_app_aug09/view/result_screen/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, this.categoryindex});
  final int? categoryindex;
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionindex = 0;
  int? selectedAnswerindex;
  int rightAnswercount = 0;
  int wrongAnswerscount = 0;
  late Timer timer;
  int count = 10;
  starttimer() {
    timer = Timer.periodic(     // loop
      const Duration(seconds: 1), // delay
      (timer) {                     // function
        setState(() {
          if (count > 0) {
            count--;
          } else {
            selectedAnswerindex = null;
            nextQuestion();
          }
        });
      },
    );
  }

  nextQuestion() {
   
    setState(() {
       questionindex++;
      if (questionindex == DummyDb.categoryQns[widget.categoryindex!].length
     ) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ResultScreen(
                      categoryindex: widget.categoryindex!,
                      rightAnswercount: rightAnswercount,
                      rightAnswer: rightAnswercount,
                      wrongAnswer: wrongAnswerscount,
                    )));
      } else {
        count = 10;
        timer.cancel();
        starttimer();
      }
    });
  }

  @override
  void initState() {
    starttimer();

    super.initState();
  }

  @override
  // to set limit
  void dispose() {    // to remove the created object permenantly
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
    // timer          
              CircularPercentIndicator(
                center: Text(
                  '$count',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                radius: 50,
                backgroundColor: Colors.brown,
              ),
              const SizedBox(
                height: 30,
              ),
     //question         
              _buildQuestionmethod(widget.categoryindex!),
              //,
              const SizedBox(
                height: 10,
              ),
     // linearprogress indicator         
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${questionindex + 1} / ${DummyDb.categoryQns[widget.categoryindex!].length}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LinearProgressIndicator(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(8),
                      minHeight: 13,
                      value: (questionindex + 1) /
                          DummyDb.categoryQns[widget.categoryindex!].length
                      // (questionindex) / DummyDb.categoryQns.length,
                      ),
                ],
              ),
              //
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
     //options Card         
              Column(
                children: List.generate(
                    4,
                    (index) =>

                        
                        OptionCard(
                          categoryindex: widget.categoryindex,
                          onOptionstap: () {
                            //
                            if (selectedAnswerindex == null) {
                              setState(() {
                                selectedAnswerindex = index;
                              });
                              if (selectedAnswerindex ==
                                  DummyDb.categoryQns[widget.categoryindex!]
                                      [questionindex]["answer"]) {
                                rightAnswercount++;
                              }
                            }
                          },
                          questionindex: questionindex,
                          optionindex: index,
                          borderColor: _getcolor(index),
                        )),
              )
            ],
          ),
        ),
        bottomNavigationBar: selectedAnswerindex != null
            ? // ternery condition or visibility can be used
            InkWell(
                onTap: () {
                  if (questionindex <
                      DummyDb.categoryQns[widget.categoryindex!].length - 1) {
                    setState(() {
                      questionindex++;
                    });
                    selectedAnswerindex = null; //
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(
                                  categoryindex: widget.categoryindex!,
                                  rightAnswercount: rightAnswercount,
                                  rightAnswer: rightAnswercount,
                                  wrongAnswer: wrongAnswerscount,
                                )));
                  }
                  count = 10;
                  timer.cancel();
                  starttimer();
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  alignment: Alignment.center,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : null // ternery operation
        );
  }

  Widget _buildQuestionmethod(int categoryindex) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  DummyDb.categoryQns[widget.categoryindex!][questionindex]
                      ["question"],
                  textAlign: TextAlign.justify,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          selectedAnswerindex ==
                  DummyDb.categoryQns[widget.categoryindex!][questionindex]
                      ["answer"]
              ? Lottie.asset("asset/images/Animation - 1724650877591.json")
              : const SizedBox()
        ],
      ),
    );
  }

  Color _getcolor(int index) {
    if (selectedAnswerindex != null) {
      if (index ==
          DummyDb.categoryQns[widget.categoryindex!][questionindex]["answer"]) {
        return Colors.green;
      }

      if (selectedAnswerindex == index) {
        if (selectedAnswerindex ==
            DummyDb.categoryQns[widget.categoryindex!][questionindex]
                ["answer"]) {
          return Colors.green;
        } else {
          return Colors.red;
        }
      }
    }

    return Colors.grey;
  }
}
