import 'package:flutter/material.dart';

class ButtonWidget{
  ButtonWidget();
  getButtonStyle(BuildContext context){
   final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      // foregroundColor: Colors.black87,
      // backgroundColor: Colors.grey[300],
      minimumSize: const Size(150,50),
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
    return raisedButtonStyle;
  }
  
}