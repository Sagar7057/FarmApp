import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class DiseaseDetection extends StatefulWidget {
  const DiseaseDetection({Key? key}) : super(key: key);

  @override
  State<DiseaseDetection> createState() => _DiseaseDetectionState();
}

class _DiseaseDetectionState extends State<DiseaseDetection> {
  @override
  Widget build(BuildContext context) {
    return const DiseaseResult();
  }
}

class DiseaseResult extends StatefulWidget {
  const DiseaseResult({Key? key}) : super(key: key);

  @override
  State<DiseaseResult> createState() => _DiseaseResultState();
}

class _DiseaseResultState extends State<DiseaseResult> {
    File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker Example"),
      ),
      body: Center(
      
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
                onPressed: () {
                }
            ),
            
            MaterialButton(
                color: Colors.blue,
                child: const Text(
                    "Pick Image from Camera",
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold
                    )
                ),
                onPressed: () async {
                  
                    try {
                      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if(image == null) return;
                      final imageTemp = File(image.path);
                      setState(() => this.image = imageTemp);
                      print(image);
                    } on PlatformException catch(e) {
                      print('Failed to pick image: $e');
                    }
                  
                }
            ),
          ],
        ),
      )
    );
  }
}
