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
      id: map['id'] as String? ?? '',
      email: map['email'] as String? ?? '',
      password: map['password'] as String? ?? '',
      name: map['name'] as String? ?? '',

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