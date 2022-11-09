import 'package:farm/Pages/fertilizer_detection.dart';
import 'package:flutter/material.dart';

import '../style/button_style.dart';
import 'crop_detection.dart';
// Pre Harvesting Page Class

class PreHarvesting extends StatefulWidget {
  const PreHarvesting({super.key});

    @override
    State<PreHarvesting> createState() => _PreHarvestingState();
  }

class _PreHarvestingState extends State<PreHarvesting> {
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
                margin: const EdgeInsets.all(20),  
                height: 100,
                width: 250,
                child: ElevatedButton(  
                  style: ButtonWidget().getButtonStyle(context),
                  child: const Text(
                    'Crop Detection',
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black), 
                  ), 
                  onPressed: () {
                     Navigator.push(
                       context, MaterialPageRoute(
                         builder: (context) {
                          return const Center(child: CropDetection());
                        }
                      )
                    );
                    
                  },  
                ),  
              ),  
              Container(  
                margin: const EdgeInsets.all(20), 
                height: 100,
                width: 250, 
                child: TextButton(  
                  style: ButtonWidget().getButtonStyle(context),
                  child: const Text(
                    'Fertilizer Recommendation', 
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                  ), 
                  onPressed: () {
                    Navigator.push(
                       context, MaterialPageRoute(
                         builder: (context) {
                          return const Center(child: FertilizerDetection());
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