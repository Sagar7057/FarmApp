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
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[   
            Container(  
              margin: const EdgeInsets.all(20),  
              child: TextButton(  
                style: ButtonWidget().getButtonStyle(context),
                child: const Text(
                  'Crop Detection', 
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
              child: TextButton(  
                style: ButtonWidget().getButtonStyle(context),
                child: const Text(
                  'Fertilizer Detection', 
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
    );
    
  }
}