import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';


class Seller extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Seller> {
  File? _image;
  final picker = ImagePicker();
late String imageUrl;
  Future<void> _pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_image != null) {
      try {
        // تخزين الصورة في Firebase Storage
        Reference storageReference = FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
        UploadTask uploadTask = storageReference.putFile(_image!);
        await uploadTask.whenComplete(() => null);
        // استرجاع رابط الصورة من Firebase Storage
        String imageUrl = await storageReference.getDownloadURL();
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailsBody(imageUrl: imageUrl),
        //   ),
        // );
        // يمكنك استخدام imageUrl لعرض الصورة أو تخزينها في Firebase Realtime Database إذا لزم الأمر
        print('تم رفع الصورة. رابط الصورة: $imageUrl');
      } catch (error) {
        print('حدث خطأ أثناء رفع الصورة: $error');
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('رفع الصور'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image != null
                ? Image.file(
              _image!,
              height: 200,
            )
                : Container(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('التقاط صورة من الكاميرا'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('رفع الصورة إلى Firebase'),

            ),

          ],
        ),
      ),
    );
  }
}




































// class Seller extends StatefulWidget {
//   @override
//   _ImageUploaderPageState createState() => _ImageUploaderPageState();
// }
//
// class _ImageUploaderPageState extends State<Seller> {
//
//   final ImagePicker _picker = ImagePicker();
//   Future<void> _pickImageFromGallery() async {
//     final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       var nameImage=basename(pickedFile.path);
//       // احفظ الصورة في Firebase Storage
//       final Reference storageReference = FirebaseStorage.instance.ref('images/${nameImage} ');
//       final UploadTask uploadTask = storageReference.putFile(File(pickedFile.path));
//
//       uploadTask.whenComplete(() async {
//         // يمكنك الآن استخدام imageUrl للإشارة إلى موقع الصورة في Firebase Storage.
//         final imageUrl = await storageReference.getDownloadURL();
//
//         // إضافة الصورة إلى قاعدة البيانات Firestore
//         await FirebaseFirestore.instance.collection('images').add({
//           'url': imageUrl,
//           'timestamp': FieldValue.serverTimestamp(), // قد تحتاج إلى تاريخ ووقت الرفع
//         });
//
//         ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(
//           content: Text('تم رفع الصورة بنجاح'),
//         ));
//       }).catchError((error) {
//         // يمكنك إدراج التعامل مع الأخطاء هنا
//         print(error);
//       });
//     }}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('رفع الصور'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: _pickImageFromGallery,
//                 child: const Text('اختيار صورة من المعرض'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
