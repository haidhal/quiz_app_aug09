// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app_aug09/dummy_db.dart';
import 'package:quiz_app_aug09/view/option_card/option_card.dart';
import 'package:quiz_app_aug09/view/result_screen/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key,this.categoryindex});
final int? categoryindex;
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionindex = 0;
  int? selectedAnswerindex;
  int rightAnswercount = 0;
  int wrongAnswerscount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Text("${questionindex+1} / ${DummyDb.questions.length}",
          style: TextStyle(
            color: Colors.white
          ),)
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: 
                _buildQuestionindex(widget.categoryindex!),
              ),
              SizedBox(height: 20,),  
              Column(children: List.generate(
                4,
                 (index)=>
                
                // 3
              OptionCard(
                onOptionstap: (){
                  if(selectedAnswerindex == null){
                    setState(() {
                      selectedAnswerindex = index;
                    });
                    if(selectedAnswerindex == DummyDb.CategoryQns[widget.categoryindex!][questionindex]["answer"]){
                      rightAnswercount++;
                    }
                  }
                },
                questionindex: questionindex, 
                optionindex: index, 
                  borderColor: _getcolor(index),
                )
                 ),)
            ],  
          ),
        ),
      ),

      // d
      bottomNavigationBar:
      selectedAnswerindex != null ?   // ternery condition or visibility can be used
       InkWell(
        onTap: () {
         // selectedAnswerindex = null;
          if(questionindex < DummyDb.questions.length -1){
          setState(() {
            questionindex++;
          });
          selectedAnswerindex = null; //
          }else{
            
            Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context)=>ResultScreen(
              rightAnswercount: rightAnswercount,
              rightAnswer: rightAnswercount,
              wrongAnswer: wrongAnswerscount,
            )));
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 12),
          alignment: Alignment.center,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Text("Next",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
        ),
      )
      : null    // ternery operation
    );
  }

  Expanded _buildQuestionindex(int categoryindex) {
    return Expanded(
      child: Stack(
        children: [
          Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(  // column ?
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SingleChildScrollView(
                            child: Text(DummyDb.CategoryQns[widget.categoryindex!][questionindex]["question"],
                              //DummyDb.questions[questionindex]["question"],
                            textAlign: TextAlign.justify,
                            style: TextStyle(color: Colors.white),),
                          ),
                        ],
                      ),
                    ),
                     selectedAnswerindex == DummyDb.CategoryQns[widget.categoryindex!][questionindex]["answer"]
              ? Lottie.asset("")
              :SizedBox()
        ],
      ),
    );
             


  }

Color _getcolor (int index){

  if(
 selectedAnswerindex != null
  ){
 if(index == DummyDb.CategoryQns[widget.categoryindex!][questionindex]["answer"]  ){ //
    return Colors.green;   
  }
  // if (selectedAnswerindex == DummyDb.questions[questionindex]["answer"] && selectedAnswerindex == index){
  //     return Colors.green;
  // } 
  else if(selectedAnswerindex !=
   DummyDb.CategoryQns[widget.categoryindex!][questionindex]["answer"] && selectedAnswerindex == index){
    if(selectedAnswerindex == DummyDb.CategoryQns[widget.categoryindex!][questionindex]["answer"] && selectedAnswerindex == index){
        return Colors.green;
    }
    return Colors.red ;
  }
  }
  
   
  return Colors.grey;
}


}


