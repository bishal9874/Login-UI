import 'package:flutter/material.dart';
import 'package:pageasliquor/models/slide_data.dart';


import 'package:velocity_x/velocity_x.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return VStack(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      [
       slideList[index]
       .title
       .text
       .fontFamily("Quicksand")
       .size(35.0)
       .make()
       .p(15.0),
       // SizedBox(height:10.0 ),
        Container(
          width: width*1.00,
          height: height*0.45,
          decoration: BoxDecoration(
            //shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(slideList[index].imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        
      ],
    );
  }
}
