import 'package:edir/admin/data_provider/admin_members_data_provider.dart';
import 'package:edir/core/models/member.dart';

class AdminMembersRepository {
  final AdminMembersDataProvider dataProvider;
  AdminMembersRepository(this.dataProvider);

  // Get all members
  Future<List<Member>> getAllMembers() async {
    return dataProvider.getAllMembers();
  }

// Approve a member
  Future<String> approveMember(int memberId) async {
    return dataProvider.approveMember(memberId);
  }

// Remove a member
  Future<String> removeMember(int memberId) async {
    return dataProvider.removeMember(memberId);
  }
}
