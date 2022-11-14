import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(String first,String second,String third,String fourth,String fifth,String six,String sev) async {
  final response = await http.post(
    Uri.parse('https://e4d3-43-243-80-75.in.ngrok.io/crop'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      
    },
    body: jsonEncode(<String, String>{
      'first':first,
      'second':second,
      'third':third,
      'fourth':fourth,
      'fifth':fifth,
      'six':six,
      'sev':sev
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  
  final String modules;


  const Album({required this.modules});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      modules: json['Modules']
      // sev:json['sev'],
       
    );
  }
}


class CropDetection extends StatefulWidget {
  const CropDetection({super.key});

  @override
  State<CropDetection> createState() {
    return _CropDetectionState();
  }
}

class _CropDetectionState extends State<CropDetection> {
  final List<TextEditingController> _controller = List.generate(74, (i) => TextEditingController());
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
        body: Container(
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller[0],
          decoration: const InputDecoration(hintText: 'Enter Value of N'),
        ),
        Container(height:20),
        TextField(
          controller: _controller[1],
          decoration: const InputDecoration(hintText: 'Enter Value of P'),
        ),
        Container(height:20),
        TextField(
          controller: _controller[2],
          decoration: const InputDecoration(hintText: 'Enter Value of K'),
        ),
        Container(height:20),
        TextField(
          controller: _controller[3],
          decoration: const InputDecoration(hintText: 'Enter Temperature'),
        ),
        Container(height:20),
        TextField(
          controller: _controller[4],
          decoration: const InputDecoration(hintText: 'Enter Humidity'),
        ),
        Container(height:20),
        TextField(
          controller: _controller[5],
          decoration: const InputDecoration(hintText: 'Enter PH value'),
        ),
        Container(height:20),
        TextField(
          controller: _controller[6],
          decoration: const InputDecoration(hintText: 'Enter rainfall'),
        ),
        Container(height:20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(
                _controller[0].text,
                _controller[1].text,
                _controller[2].text,
                _controller[3].text,
                _controller[4].text,
                _controller[5].text,
                _controller[6].text,
              );
            });
          },
          style: ElevatedButton.styleFrom(primary: Colors.green.shade900),
          child: const Text('Predict'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body:Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             Text('we recommend ${snapshot.data!.modules}'),
            ],
          )
         )
         );
            
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}