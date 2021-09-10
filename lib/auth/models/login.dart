class Login {
  String token;
  String role;

  Login({required this.token, required this.role});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(token: json['token'], role: json['role']);
  }

  Map toJson() => {
        'token': token,
        'role': role,
      };
}
