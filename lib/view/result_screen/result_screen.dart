// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quiz_app_aug09/dummy_db.dart';
import 'package:quiz_app_aug09/view/category_screen/category_screen.dart';
import 'package:quiz_app_aug09/view/quiz_screen/quiz_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key,
  required this.rightAnswer,
  required this.rightAnswercount,
  required this.wrongAnswer});
final int rightAnswer;
final int wrongAnswer;
final int rightAnswercount;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
  
}

class _ResultScreenState extends State<ResultScreen> {
  int starcount = 0;
  @override
void initstate (){
starcount = calpercentage();
super.initState();
}
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
               (index)=>Padding(
                 padding:  EdgeInsets.only(
                  bottom: index == 1 ? 20:0 ,
                  left: 15,
                  right: 15
                 ),
                 child: Icon(
                  Icons.star,
                  color: index <= starcount ? Colors.amber : Colors.grey,
                  size: index == 1 ? 80 :50,
                 ),
               )
               )
            ),
            SizedBox(height: 30,),

          
           
            Text("congrats!",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white
            ),),
             Text("${widget.rightAnswer}.0%score",
            style: TextStyle(
              fontSize: 22,
              color: Colors.green
            ),),
            SizedBox(height: 15,),
             Text("Correct Answers : ${widget.rightAnswer}",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white
            ),),
             Text("wrong Answers : ${widget.wrongAnswer}",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white
            ),),
             Text("skipped Answers :0",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white
            ),),
            SizedBox(height: 15,),
            TextButton(onPressed: (){
              Navigator.pushReplacement(context,
               MaterialPageRoute(builder: (context)=>QuizScreen()));
            },
             child: InkWell(
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context)=>CategoryScreen()));
              },
               child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8)
                ),
                 child: Text("Restart",
                 style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
                 ),),
               ),
             ))
        
          ],
        ),
      ),
    );
  }
   calpercentage(){
    double percentage = 
    (widget.rightAnswercount / DummyDb.questions.length) *100;
    print(percentage);

    if(percentage >= 80){
      return 3;
    }else if (percentage >= 50){
      return 2;
    }else if(percentage >= 30){
      return 1;
    }else{
      return 0;
    }
  }
}
//custom grid view
// percentage indicator =>package   (circular%indicator)  