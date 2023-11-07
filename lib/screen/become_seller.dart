
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
class Seller extends StatefulWidget {
  @override
  _ImageUploaderPageState createState() => _ImageUploaderPageState();
}

class _ImageUploaderPageState extends State<Seller> {

  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      var nameImage=basename(pickedFile.path);
      // احفظ الصورة في Firebase Storage
      final Reference storageReference = FirebaseStorage.instance.ref('images/${nameImage} ');
      final UploadTask uploadTask = storageReference.putFile(File(pickedFile.path));
      final imageUrl = await storageReference.getDownloadURL();

      // uploadTask.whenComplete(() async {
      //   // يمكنك الآن استخدام imageUrl للإشارة إلى موقع الصورة في Firebase Storage.
      //
      //   // إضافة الصورة إلى قاعدة البيانات Firestore
      //   await FirebaseFirestore.instance.collection('images').add({
      //     'url': imageUrl,
      //     'timestamp': FieldValue.serverTimestamp(), // قد تحتاج إلى تاريخ ووقت الرفع
      //   });
      //
      //   ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(
      //     content: Text('تم رفع الصورة بنجاح'),
      //   ));
      // }).catchError((error) {
      //   // يمكنك إدراج التعامل مع الأخطاء هنا
      //   print(error);
      // });
    }}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('رفع الصور'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _pickImageFromGallery,
                child: const Text('اختيار صورة من المعرض'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}












