import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;

  Slide({
    @required this.imageUrl,
    @required this.title,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/winebottle.png',
    title: "Browse the largest variety of wine,beer, spirits and more.",
  ),
  Slide(
    imageUrl:  "assets/trackingdelivery.png",
    title: "Track your delivery in real time.",
  ),
  Slide(
    imageUrl:  "assets/ondoor.png",
    title:  "Now get order at your door step",
  ),
];
