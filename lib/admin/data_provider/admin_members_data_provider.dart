import 'dart:convert';

import 'package:edir/admin/data_provider/admin_event_data_provider.dart';
import 'package:edir/core/credentials.dart';
import 'package:edir/core/models/edir.dart';
import 'package:edir/core/models/member.dart';
import 'package:edir/core/models/user.dart';
import 'package:http/http.dart' as http;

class AdminMembersDataProvider with Credentials {
  final _baseUrl = "http://127.0.0.1:8000/api/v1/members";

  Future<Edir> getEdir() async {
    final urlEdir =
        Uri.parse("http://127.0.0.1:8000/v1/edirs/?skip=0&limit=10");

    final t = await token();

    final responseEdir = await http.get(
      urlEdir,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $t',
      },
    );
    if (responseEdir.statusCode == 200) {
      final edir = Edir.fromJson(
        jsonDecode(responseEdir.body),
      );
      return edir;
    } else {
      print(responseEdir.statusCode);
      throw Exception("Could not fetch edir");
    }
  }

// Get all members
  Future<List<Member>> getAllMembers() async {
    Edir edir = await getEdir();
    final t = await token();

    final url = Uri.parse(
        "http://127.0.0.1:8000/api/v1/members/${edir.id}?skip=0&limit=10");

    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        "Content-Type": "application/json",
        'accept': 'application/json',
        'Authorization': 'Bearer $t',
      },
    );

    if (response.statusCode == 200) {
      final members = jsonDecode(response.body).cast<Map<String, dynamic>>();
      final membersList =
          members.map<Member>((json) => Member.fromJson(json)).toList();
      print(membersList);
      return membersList;
    } else {
      print(response.statusCode);
      throw Exception("Could not fetch members");
    }
  }

// Approve a member
  Future<String> approveMember(int memberId) async {
    print("approving..");
    Edir edir = await getEdir();
    final t = await token();

    final url = Uri.parse("$_baseUrl/$memberId");
    final http.Response response = await http.put(
      url,
      headers: <String, String>{
        "Content-Type": "application/json",
        'accept': 'application/json',
        'Authorization': 'Bearer $t'
      },
      body: jsonEncode(
        {"status": "a"},
      ),
    );

    if (response.statusCode == 200) {
      print("member approved");
      return "Member approved successfully.";
    } else {
      print(response.statusCode);

      throw Exception("Failed to approve Member.");
    }
  }

// Remove a member
  Future<String> removeMember(int memberId) async {
    final url = Uri.parse("$_baseUrl/$memberId");
    final http.Response response = await http.delete(
      url,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      return "Member Deleted successfully.";
    } else {
      throw Exception("Failed to Delete Member.");
    }
  }
}

void main() async {
  AdminMembersDataProvider adminMembersDataProvider =
      AdminMembersDataProvider();
  // User user = User(
  //     fullName: "liyu",
  //     phone: "09123459",
  //     role: "u",
  //     id: 2,
  //     email: "gmail.com",
  //     password: "323234");

  // await adminEventDataProvider.createEvent(event);
  List members = await adminMembersDataProvider.getAllMembers();
  for (Member member in members) {
    await adminMembersDataProvider.removeMember(member.id);
  }
}
