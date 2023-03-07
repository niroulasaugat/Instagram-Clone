import 'package:flutter/material.dart';
import 'package:insatclone/utils/colors.dart';
Widget newbutton(BuildContext context, String title) {
    return Container(
              padding: EdgeInsets.all(12),
              // width: 2000,
              decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                
              ),
              child: Center(child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)),
            );
  }