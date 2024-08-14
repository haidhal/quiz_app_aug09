// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quiz_app_aug09/dummy_db.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionindex = 0;
  int? selectedAnswerindex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Text("1/10")
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: 
                _buildQuestionindex(),
              ),
              SizedBox(height: 20,),  
              Column(children: List.generate(
                4,
                 (index)=>OptionCard(questionindex: questionindex,
                 borderColor: _getcolor(index),
                 optionindex : index,
                 onOptionstap: () {
                  if(selectedAnswerindex == null){
                     selectedAnswerindex = index;
                   print(index);
                   setState(() {
                     
                   });
                  }
                 
                 },
                 )
                 ),)
            ],  
          ),
        ),
      ),
      bottomNavigationBar:
      selectedAnswerindex != null ?   // ternery condition or visibility can be used
       InkWell(
        onTap: () {
          selectedAnswerindex = null;
          if(questionindex < DummyDb.questions.length -1){
          setState(() {
            questionindex++;
          });
          }else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("section one completed"),
            backgroundColor: Colors.red,));
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

  Container _buildQuestionindex() {
    return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: SingleChildScrollView(
                  child: Text(DummyDb.questions[questionindex]["question"],
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.white),),
                ),
              );
  }

Color _getcolor (int index){

  if(
 selectedAnswerindex != null
  ){
 if(index == DummyDb.questions[questionindex]["answer"]  ){
    return Colors.green;   
  }
  // if (selectedAnswerindex == DummyDb.questions[questionindex]["answer"] && selectedAnswerindex == index){
  //     return Colors.green;
  // } 
  else if(selectedAnswerindex != DummyDb.questions[questionindex]["answer"] && selectedAnswerindex == index){
    if(selectedAnswerindex == DummyDb.questions[questionindex]["answer"] && selectedAnswerindex == index){
        return Colors.green;
    }
    return Colors.red ;
  }
  }
  
   
  return Colors.grey;
}


}


class OptionCard extends StatelessWidget {
  const OptionCard( {
    super.key,
    required this. questionindex,
    required this. optionindex, 
    this.onOptionstap,
     required this.borderColor
  });
final int optionindex;
  final int questionindex;
  final void Function()? onOptionstap;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onOptionstap,
        child: Container(
        // margin: EdgeInsets.only(bottom: 15),    ==>outer
         padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           border: Border.all(width: 2,

          color: borderColor
           )
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           
           children: [
           Text(DummyDb.questions[questionindex]["options"][optionindex],
           style: TextStyle(
             color: Colors.white,
             fontWeight: FontWeight.bold
           ),),
           CircleAvatar(
             radius: 10,
             backgroundColor: Colors.white,
             child: CircleAvatar(
               radius: 9,
               backgroundColor: Colors.black,
             ),
           )
         ],),
        ),
      ),
    );
  }
}

