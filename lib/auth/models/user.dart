class User {
  final int? id;
  final String full_name;
  final String email;
  final String phone;
  final String role;
  final String password;

  User(
      {required this.id,
      required this.full_name,
      required this.email,
      required this.phone,
      required this.role,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        full_name: json['full_name'],
        email: json['email'],
        phone: json['phone'],
        role: json['role'],
        password: json['password']);
  }
}
