class User {
  String email;
  String fullName;
  String phone;
  String role;
  int id;
  String password;

  User(
      {required this.email,
      required this.fullName,
      required this.phone,
      required this.role,
      required this.id,
      required this.password});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullName = json['full_name'];
    phone = json['phone'];
    role = json['role'];
    id = json['id'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['full_name'] = this.fullName;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['id'] = this.id;
    data['password'] = this.password;
    return data;
  }
}
