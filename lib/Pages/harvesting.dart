import 'dart:io';
import '../style/button_style.dart';
import 'package:flutter/material.dart';
import 'disease_detection.dart';
import 'pest_detection.dart';


class Harvesting extends StatefulWidget {
  const Harvesting({super.key});

    @override
    State<Harvesting> createState() => _HarvestingState();
  }

class _HarvestingState extends State<Harvesting> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
      color: Colors.green.shade200,
      borderRadius: BorderRadius.circular(17),
      border: Border.all(width: 2),
      ),
      
      width: 300, height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[   
              Container(  
                height: 100,
                width: 250,
                margin: const EdgeInsets.all(20),  
                child: TextButton(  
                  style: ButtonWidget().getButtonStyle(context),
                  child: const Text(
                    'Disease Detection', 
                     style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                  ), 
                  onPressed: () {
                     Navigator.push(
                       context, MaterialPageRoute(
                         builder: (context) {
                            return const Center(child: DiseaseResult());
                        }
                      )
                    );
                    
                  },  
                ),  
              ),  
              Container(  
                height: 100,
                width: 250,
                margin: const EdgeInsets.all(20),  
                child: TextButton(  
                  style: ButtonWidget().getButtonStyle(context),
                  child: const Text(
                    'Pest Detection', 
                     style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                  ), 
                  onPressed: () {
                    Navigator.push(
                       context, MaterialPageRoute(
                         builder: (context) {
                          return const Center(child: PesticideDetection());
                        }
                      )
                    );
                  },  
                ),  
              ),
              
            ] 
      ),
    );
    
  }
}