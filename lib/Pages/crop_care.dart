import 'package:farm/Pages/post_harvesting.dart';
import 'package:farm/Pages/pre_harvesting.dart';
import 'package:flutter/material.dart';
import '../style/button_style.dart';
import 'harvesting.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

    @override
    State<MyWidget> createState() => _MyWidgetState();
  }

class _MyWidgetState extends State<MyWidget> {
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
                  'Pre-Harvesting', 
                ), 
                onPressed: () {
                   Navigator.push(
                     context, MaterialPageRoute(
                       builder: (context) {
                        return Scaffold(
                          appBar:AppBar(
                            title:const Text('PreHarvesting'),
                          ),
                          body: const Center(
                            child:PreHarvesting()
                          )
                        );
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
                  'Harvesting', 
                ), 
                onPressed: () {
                  Navigator.push(
                     context, MaterialPageRoute(
                       builder: (context) {
                        return Scaffold(
                          appBar:AppBar(
                            title:const Text('Harvesting'),
                          ),
                          body: const Center(
                            child:Harvesting()
                          )
                        );
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
                  'Post-Harvesting', 
                ), 
                onPressed: () {
                  Navigator.push(
                     context, MaterialPageRoute(
                       builder: (context) {
                        return Scaffold(
                          appBar:AppBar(
                            title:const Text('Post_Harvesting'),
                          ),
                          body: const Center(
                            child:PostHarvesting()
                          )
                        );
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
