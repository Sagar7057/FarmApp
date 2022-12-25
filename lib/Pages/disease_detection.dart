import 'dart:convert';
import 'dart:io';
// import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(dynamic disease) async {
  final response = await http.post(
    Uri.parse('https://dc79-103-56-225-67.in.ngrok.io/disease'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'image':disease,
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
  final XFile? diseaseImage;
  const Album({required this.diseaseImage});

  factory Album.fromJson(Map<dynamic, dynamic> json) {
    return Album(
      diseaseImage: json['Prediction'], 
       
    );
  }
}



class DiseaseResult extends StatefulWidget {
  const DiseaseResult({Key? key}) : super(key: key);

  @override
  State<DiseaseResult> createState() => _DiseaseResultState();
}

class _DiseaseResultState extends State<DiseaseResult> {
        
    ImagePicker picker = ImagePicker();
    XFile? image;
    late List<int> imageBytes;
    late File imageFile;
   
    Future pickImageFromCamera() async {
        try {
          final image = await ImagePicker().pickImage(source: ImageSource.camera);
            if(image == null) return;
            // final imageTemp = File(image.path);
            setState(() => this.image = image);
                } on PlatformException catch(e) {
                  print('Failed to pick image: $e');
          }
      }

      Future pickImageFromPhone() async {
        try {
            final image = await picker.pickImage(source: ImageSource.gallery);
            if(image == null) return;
            // final imageTemp = File(image.path);
            setState(() => this.image = image);
                } on PlatformException catch(e) {
                  print('Failed to pick image: $e');
          }
      }

  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Disease Detection"),
      ),
      body: Container(child: (_futureAlbum == null) ? diseasePage() : buildFutureBuilder(),)
    );
  }

SingleChildScrollView diseasePage()
{
return SingleChildScrollView(child:Center(
      
        child: Column(
          children: [
             MaterialButton(
                color: Colors.blue,
                child: const Text(
                    "Pick Image from Gallery",
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold
                    )
                ),
                onPressed: ()=> pickImageFromPhone()
                  
            ),          
            MaterialButton(
                color: Colors.blue,
                child: const Text(
                    "Pick Image from Camera",
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold
                    )
                ),
                onPressed: ()=> pickImageFromCamera()
                  
            ),
            Column(
                children: [
                  // Only one of the children will be shown based on `beforeSunset` condition
                  if (image==null) ... [
                    Container(),
                  ] else ... [
                    Image.file(File(image!.path)), 
                    // imageFile = File(image!.path),  
                    // imageBytes = image?.readAsBytesSync(),                 
                    MaterialButton(
                      color: Colors.blue,
                      child: const Text(
                          "Pick Image from Camera",
                          style: TextStyle(
                              color: Color.fromARGB(179, 48, 37, 37), fontWeight: FontWeight.bold
                          )
                      ),
                      onPressed:()
                      {
                        setState(() {
                         _futureAlbum = createAlbum(File(image!.path));
                      });
                      }
                  ),
      
                  ],
                ],
              ),
            //  Container(
            //   child: image == null?Container():Image.file(File(image!.path)),
            // ),

        
            
            
          ],
        ),
      )
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
             Text('we recommend ${snapshot.data!.diseaseImage}'),
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




