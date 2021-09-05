class User {
  final int? id;
  final String full_name;
  final String phone;
  final String role;
  final String password;

  User(
      {required this.id,
      required this.full_name,
      required this.phone,
      required this.role,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        full_name: json['full_name'],
        phone: json['phone'],
        role: json['role'],
        password: json['password']);
  }
}


// {
//   "email": "string",
//   "full_name": "string",
//   "phone": "string",
//   "role": "string",
//   "id": 4,
//   "password": "$pbkdf2-sha256$30000$hjBGaI2RMiZkLIVQSkmplQ$pPsXpaX8NQIeKBHuyS9Y0jKqXx4Vp8arOxfuK0VKeuY"
// }