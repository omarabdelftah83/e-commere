class UserModell {
  String? email;
  String? phoneNumber;
  String? username;
  String? status;
  String? image;
  String? role;
  String? nationalId;
  String? gender;
  String? id;
  String? accessToken;

  UserModell({
    this.email,
    this.phoneNumber,
    this.username,
    this.status,
    this.image,
    this.role,
    this.nationalId,
    this.gender,
    this.id,
    this.accessToken,
  });

  UserModell fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    username = json['username'];
    status = json['status'];
    image = json['image'];
    role = json['role'];
    nationalId = json['nationalId'];
    gender = json['gender'];
    id = json['id'];
    accessToken = json['access_token'];

    return UserModell(
      email: email,
      phoneNumber: phoneNumber,
      username: username,
      status: status,
      image: image,
      role: role,
      nationalId: nationalId,
      gender: gender,
      id: id,
      accessToken: accessToken,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['username'] = username;
    data['status'] = status;
    data['image'] = image;
    data['role'] = role;
    data['nationalId'] = nationalId;
    data['gender'] = gender;
    data['id'] = id;
    data['access_token'] = accessToken;
    return data;
  }
}
