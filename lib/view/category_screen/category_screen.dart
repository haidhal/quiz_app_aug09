// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:quiz_app_aug09/dummy_db.dart';
import 'package:quiz_app_aug09/view/quiz_screen/quiz_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 10,
              ),
              Text(
                "Hi, John",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Let's make the day productive",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
          actions: const [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/564x/b1/88/c6/b188c6801ad1d71d3c962c6e4aa2d0cf.jpg"),
            ),
            SizedBox(
              width: 12,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(255, 51, 48, 48)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.access_alarm_rounded,
                      size: 50,
                    ), // lottie
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Ranking",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "345",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    VerticalDivider(
                      color: Colors.grey,
                      width: 2,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.circle,
                      size: 50,
                    ), // lottie
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "points",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "1209",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                "Let's play",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: DummyDb.CategoryQns.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        crossAxisCount: 2,
                        mainAxisExtent: 250),
                    itemBuilder: (context, index) => SizedBox(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuizScreen(
                                            categoryindex: index,
                                          )));
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15),
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 51, 48, 48),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        //"category",
                                        DummyDb.categories[index]["category"],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        DummyDb.categories[index]["questionNo"],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 0,
                                    left: 30,
child: CircleAvatar(
                                      radius: 45,
                                    )),
                              ],
                            ),
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}


