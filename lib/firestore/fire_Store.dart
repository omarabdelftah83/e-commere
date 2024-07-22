import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef = FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef.doc(userModel.userId).set(userModel.toJson());
  }
}

class UserModel {
  String? userId;
  String? email;
  String? name;
  String? pic;
  String? phone;

  UserModel({this.userId, this.email, this.name, this.pic, this.phone});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
    phone = map['phone'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
      'phone': phone,
    };
  }
}