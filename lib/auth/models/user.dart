class User {
  final int? id;
  final String? full_name;
  final String? email;
  final String? phone;
  final String? role;
  final String? password;
  final String? detail;

  User(
      {this.id,
      this.full_name,
      this.email,
      this.phone,
      this.role,
      this.password,
      this.detail});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        full_name: json['full_name'],
        email: json['email'],
        phone: json['phone'],
        role: json['role'],
        password: json['password'],
        detail: json['detail']);
  }
}
