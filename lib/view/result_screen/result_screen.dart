import 'package:flutter/material.dart';
import 'package:quiz_app_aug09/dummy_db.dart';
import 'package:quiz_app_aug09/view/category_screen/category_screen.dart';
import 'package:quiz_app_aug09/view/quiz_screen/quiz_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      {super.key,
      required this.rightAnswer,
      required this.rightAnswercount,
      required this.wrongAnswer,
      required this.categoryindex});
  final int rightAnswer;
  final int wrongAnswer;
  final int rightAnswercount;
  final int categoryindex;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int starcount = 0;
  void initstate() {
    starcount = calpercentage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    3,
                    (index) => Padding(
                          padding: EdgeInsets.only(
                              bottom: index == 1 ? 50 : 0, left: 15, right: 15),
                          child: Icon(
                            Icons.star,
                            color: index < calpercentage()
                                ? Colors.amber
                                : Colors.grey,
                            size: index == 1 ? 80 : 50,
                          ),
                        ))),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "congrats!",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "${widget.rightAnswercount}/${DummyDb.categoryQns[widget.categoryindex].length}",
              style: const TextStyle(fontSize: 38, color: Colors.yellow),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Correct Answers : ${widget.rightAnswercount}",
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
            Text(
              "wrong Answers : ${DummyDb.categoryQns[widget.categoryindex].length - widget.rightAnswercount}",
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategoryScreen()));
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    "Restart",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  calpercentage() {
    double percentage = (widget.rightAnswercount /
            DummyDb.categoryQns[widget.categoryindex].length) *
        100;

    if (percentage >= 80) {
      return 3;
    } else if (percentage >= 50) {
      return 2;
    } else if (percentage >= 30) {
      return 1;
    } else {
      return 0;
    }
  }
}
//custom grid view
// percentage indicator =>package   (circular%indicator)
