// import 'package:flutter/material.dart';
// import 'package:image_picker_web/image_picker_web.dart';
// class DiseaseWeb extends StatefulWidget {
//   const DiseaseWeb({Key? key}) : super(key: key);

//   @override
//   State<DiseaseWeb> createState() => _DiseaseWebState();
// }

// class _DiseaseWebState extends State<DiseaseWeb> {
//   @override
//   Widget build(BuildContext context) {
//     bool imageAvailable = false;
//     dynamic imageFile;
//         Future pickImageAsWidget() async{
//        try {
//             final image = await ImagePickerWeb.getImageAsBytes();
//             // Future<Image> copy = decodeImageFromList(image);
//             if(image == null) return;
//               setState(() {
//                   imageFile = image;
//                   imageAvailable = true;
//                 });
            
//             // setState(() => image2 = image);
//             // print(image2);
//                 } on PlatformException catch(e) {
//                   print('Failed to pick image: $e');
//           }

//     }
    
//   }
// }