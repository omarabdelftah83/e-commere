import 'package:chats/home/data/model/catogery_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('categories');
  List<CategoryModel> _categories = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      QuerySnapshot querySnapshot = await collectionReference.get();
      setState(() {
        _categories = querySnapshot.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          return CategoryModel.fromJson(data);
        }).toList();
        _isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          return ListTile(
            leading: category.image != null
                ? Image.network(category.image!)
                : null,
            title: Text(category.name ?? "No Name"),
          );
        },
      ),
    );
  }
}
