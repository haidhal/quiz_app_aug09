import 'package:flutter/material.dart';
import 'package:quiz_app_aug09/dummy_db.dart';


class OptionCard extends StatelessWidget {
  const OptionCard( {
    super.key,
    required this. questionindex,
    required this. optionindex, 
    this.onOptionstap,
     required this.borderColor,
     this.categoryindex
  });
final int optionindex;
final int? categoryindex;
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
            // dout
           Text(DummyDb.CategoryQns[categoryindex!][questionindex]["options"][optionindex].toString(),
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

