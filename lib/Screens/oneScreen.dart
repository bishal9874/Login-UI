import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pageasliquor/models/slide_data.dart';
import 'package:pageasliquor/widgets/slide_dots.dart';
import 'package:pageasliquor/widgets/slide_items.dart';

import 'package:velocity_x/velocity_x.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final List<List<String>> products = [
  //   [
  //     "assets/photo-1551622966-357737ef2797.jpg",
  //     "Browse the largest variety of wine,beer, spirits and more.",
  //   ],
  //   [
  //     "assets/pngtree-order-delivery-tracking-using-mobile-device-png-image_4945632.jpg",
  //     "Track your delivery in real time.",
  //   ],
  //   [
  //     "assets/art-illustration-184699880.jpg",
  //     "Now get order at your door step",
  //   ]
  // ];
  // int currentIndex = 0;

  // void _next() {
  //   setState(() {
  //     if (currentIndex < products.length - 1) {
  //       currentIndex++;
  //     } else {
  //       currentIndex = currentIndex;
  //     }
  //   });
  // }

  // void _prev() {
  //   setState(() {
  //     if (currentIndex > 0) {
  //       currentIndex--;
  //     } else {
  //       currentIndex = 0;
  //     }
  //   });
  // }
   int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(context.mdWindowSize);
    return Scaffold(
        body: VxResponsive(
      xsmall: Container(
        color: Color(0xFFfaf2af),
        height: double.infinity,
        child: VStack(
          [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  height: 50.0,
                  width: 50.0,
                  image: AssetImage("assets/av.png"),
                  fit: BoxFit.cover,
                ).p(5.0).box.make(),
                // SizedBox(
                // width: width*0.69,
                // ),
                "Skip".text.size(20.0).semiBold.make().box.make(),
              ],
            ).box.p16.make(),
            // Column(
            //   children: [
            //     GestureDetector(
            //       onHorizontalDragEnd: (DragEndDetails details) {
            //         if (details.velocity.pixelsPerSecond.dx > 0) {
            //           _prev();
            //         } else if (details.velocity.pixelsPerSecond.dx < 0) {
            //           _next();
            //         }
            //       },
            //       child: Container(
            //         height: height * 0.90,
            //         width: double.infinity,
            //         child: VStack([
            //           products[currentIndex][1].text.size(30.0).make(),
            //           Container(
            //             height: height * 0.50,
            //             width: double.infinity,
            //             decoration: BoxDecoration(
            //                 image: DecorationImage(
            //                     image: AssetImage(products[currentIndex][0]),
            //                     fit: BoxFit.cover)),
            //                     // child: Column(
            //                     //   mainAxisAlignment: MainAxisAlignment.end,
            //                     //   children: [
            //                     //     Container(
            //                     //       width: 90,
            //                     //       child: Row(
            //                     //         children: _buildIndicator(),
            //                     //         ),
            //                     //     )
            //                     //   ],
            //                     // ),
            //           ),
            //         ]),
            //       ),
            //     ), 
            //   ],
            // ).p(5.0),
            // Transform.translate(
            //     offset: Offset(0,-40),
            //     child: 
            // Container(
            //       height: height*0.15,
            //       decoration:BoxDecoration(
            //         color: Colors.red,
            //         borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(30.0),
            //           topRight: Radius.circular(30.0)
            //         )
                  
            //       ) ,
            //     ),
            //   ),
            Expanded(
                child: Stack(
                  //alignment: AlignmentDirectional.bottomCenter,
                  alignment: AlignmentDirectional.bottomStart,
                  children: <Widget>[
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: slideList.length,
                      itemBuilder: (ctx, i) => SlideItem(i),
                    ),
                     Container(
                         height: height*0.25,
                         decoration:BoxDecoration(
                        color: Colors.white,
                         borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)
                             )
                        ) ,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                                Container(
                        
                          child: Row(
                           /// mainAxisSize: MainAxisSize.min,
                           // mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for(int i = 0; i<slideList.length; i++)
                                if( i == _currentPage )
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          ),
                        ).p(10.0),
                          "Get your liquor delivered"
                          .text
                          .size(25.0)
                          .fontFamily("Quicksand")
                          .bold
                          .make(),
                          "Login or sign up to place your order"
                          .text
                          .size(20.0)
                          .color(Colors.grey[500])
                          .make(),
                          SizedBox(
                            height: 10.0,
                          ),
                           
                           TextFormField(
                        decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      prefixIcon: Icon(
                        Icons.phone_android,
                        color: Colors.black,
                        size: width * 0.07,
                      ),
                      hintText: "+1 (454) 567 5678",
                      hintStyle: TextStyle(fontFamily: "Quicksand"),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 1, color: Colors.orange),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(width: 1, color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                                BorderSide(width: 1, color: Colors.white)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                     
                    ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                          ], 
                    ),
                           ],
                           
                         ).p(10.0),
                         
                       )
                  ],
                ),
              ),
            //  Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: <Widget>[
            //       FlatButton(
            //         child: Text(
            //           'Getting Started',
            //           style: TextStyle(
            //             fontSize: 18,
            //           ),
            //         ),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(5),
            //         ),
            //         padding: const EdgeInsets.all(15),
            //         color: Theme.of(context).primaryColor,
            //         textColor: Colors.white,
            //         onPressed: () {
            //           // Navigator.of(context).pushNamed(SignupScreen.routeName);
            //         },
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: <Widget>[
            //           Text(
            //             'Have an account?',
            //             style: TextStyle(
            //               fontSize: 18,
            //             ),
            //           ),
            //           FlatButton(
            //             child: Text(
            //               'Login',
            //               style: TextStyle(fontSize: 18),
            //             ),
            //             onPressed: () {
            //               // Navigator.of(context).pushNamed(LoginScreen.routeName);
            //             },
            //           ),
            //         ],
            //       ),
            //     ],
            //   )
          ],
        ),
      ).p(10.0),
    ));
  }

  // Widget _indicator(bool isActive) {
  //   return Expanded(
  //     child: Container(
  //       height: 4,
  //       margin: EdgeInsets.only(right: 5),
  //       decoration: BoxDecoration(
  //         color: isActive ? Colors.yellow[800] : Colors.grey[600],
  //       ),
  //     ),
  //   );
  // }

  // List<Widget> _buildIndicator() {
  //   List<Widget> indicators = [];
  //   for (int i = 0; i < products.length; i++) {
  //     if (currentIndex == i) {
  //       indicators.add(_indicator(true));
  //     } else {
  //       indicators.add(_indicator(false));
  //     }
  //   }

  //   return indicators;
  }

