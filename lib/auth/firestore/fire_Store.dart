import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef = FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef.doc(userModel.userId).set(userModel.toJson());
  }
}

class UserModel {
  String? userId;
  String? firstName;
  String? secondName;

  String? email;
  String? phone;


  UserModel({this.userId,this.firstName,this.secondName, this.email, this.phone,});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    userId = map['userId'];
    firstName=map['firstName'];
    secondName=map ['secondName'];
    email = map['email'];
    phone = map['phone'];
  }

  Map<String, dynamic> toJson() {
    //convert data to json //
    return {
      'userId': userId,
      'firstName':firstName,
      'secondName':secondName,
      'email': email,
      'phone': phone,
    };
  }
}