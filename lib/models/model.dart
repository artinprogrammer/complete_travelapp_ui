import 'package:flutter/material.dart';

class Suggestions {
  String imgUrl;
  String name;
  int cabins;

  Suggestions({required this.imgUrl, required this.name, required this.cabins});
}

class Populars {
  String imgUrl;
  String title;
  String location;
  int price;

  Populars(
      {required this.imgUrl,
      required this.title,
      required this.location,
      required this.price});
}

class InProgress {
  String imgUrl;
  String title;
  String location;
  int price;

  InProgress(
      {required this.imgUrl,
      required this.title,
      required this.location,
      required this.price});
}
Map homePagePoster = {
  "imageUrl" : "https://d3aux7tjp119y2.cloudfront.net/original_images/AnfasterC3B6d-3-20Photo20Cred20Viggo20Lundberg-CMSTemplate.jpg",
  "btnText" : "Ask to our support",
  "mainText" : """
Question 
about 
Cabins?"""
};