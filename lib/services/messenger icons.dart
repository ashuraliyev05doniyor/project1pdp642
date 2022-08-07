import 'package:flutter/material.dart';
icons(String image,double size){
  return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  image),
              fit: BoxFit.cover)));
}