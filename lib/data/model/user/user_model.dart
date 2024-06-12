class UserModel {
  final String id;
  final String email;
  final String password;
  final String name;



  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      password: map['password'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "password": password,
      'name':name,
    };
  }


}