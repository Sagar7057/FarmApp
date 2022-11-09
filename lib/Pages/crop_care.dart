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

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: E-Commerce',
      style: optionStyle,
    ),
    Text(
      'Index 2: Crop Care',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(
          centerTitle:true,
               title: const Text("Crop Care"),
                  actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.comment),
                    tooltip: 'Comment Icon',
                    onPressed: () {},
                  ), //IconButton
                  IconButton(
                    icon: const Icon(Icons.settings),
                    tooltip: 'Setting Icon',
                    onPressed: () {},
                  ), //IconButton
                ], //<Widget>[]
                // backgroundColor: Colors.green.shade900,
                elevation: 50.0,
                backgroundColor: Colors.green.shade900,
        ), 
        body:const Center(
          child: MyBody(),
        ),
        drawer: const  Drawer(),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed, // Fixed 
            backgroundColor: Colors.green.shade900, //
            items: const <BottomNavigationBarItem>[ 
                BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',  
              )   ,
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'E-commerce', 
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.agriculture),
                label: 'crop care', 
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.newspaper),
                label: 'news',
              ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      );
    
  }
}


class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
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
                    'Pre-Harvesting', 
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                  ), 
                  onPressed: () {
                     Navigator.push(
                       context, MaterialPageRoute(
                         builder: (context) {
                          return Scaffold(
                            appBar:AppBar(
                                centerTitle:true,
                                title: const Text("Pre-Harvesting"),
                                    actions: <Widget>[
                                    IconButton(
                                      icon: const Icon(Icons.comment),
                                      tooltip: 'Comment Icon',
                                      onPressed: () {},
                                    ), //IconButton
                                    IconButton(
                                      icon: const Icon(Icons.settings),
                                      tooltip: 'Setting Icon',
                                      onPressed: () {},
                                    ), //IconButton
                                  ], //<Widget>[]
                              backgroundColor: Colors.green.shade900,
                              elevation: 50.0,
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
                height: 100,
                width: 250,
                child: ElevatedButton(  
                  style: ButtonWidget().getButtonStyle(context),
                  child: const Text(
                    'Harvesting', 
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
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
                height: 100,
                width: 250, 
                child: TextButton(  
                  style: ButtonWidget().getButtonStyle(context),
                  child: const Text(
                    'Post-Harvesting', 
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
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
      ),
    );

  }
}