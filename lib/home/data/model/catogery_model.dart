class CategoryModel {
  String? name;
  String? image;

  CategoryModel({ this.name, this.image});
  factory CategoryModel.fromJson(Map<String, dynamic> map) =>CategoryModel(
      name: map['name'],
      image: map['image']
  );

}

///....different ...////
// class CategoryModel {
//   String? name;
//   String? image;
//
//   CategoryModel({this.name, this.image});
//
//   CategoryModel.fromJson(Map<String, dynamic> map) {
//     name = map['name'];
//     image = map['image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'image': image,
//     };
//   }
// }
