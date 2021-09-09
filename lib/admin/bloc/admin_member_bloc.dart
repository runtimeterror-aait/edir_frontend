import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edir/admin/bloc/admin_event_bloc.dart';
import 'package:edir/admin/repository/admin_members_repository.dart';
import 'package:edir/admin/screens/admin_manage_edir/members/admin_manage_members_page.dart';
import 'package:edir/core/models/member.dart';
import 'package:equatable/equatable.dart';

part 'admin_member_event.dart';
part 'admin_member_state.dart';

class AdminMemberBloc extends Bloc<AdminMemberEvent, AdminMemberState> {
  AdminMemberBloc({required this.membersRepository})
      : super(AdminMemberInitial());
  AdminMembersRepository membersRepository;

  @override
  Stream<AdminMemberState> mapEventToState(
    AdminMemberEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetAllMembersEvent) {
      yield MemberLoadingState();

      List<Member> members = await membersRepository.getAllMembers();
      yield AllMembersLoadedState(members: members);
    } else if (event is ApproveMemberEvent) {
      yield MemberLoadingState();

      await membersRepository.approveMember(event.memberId);
      List<Member> members = await membersRepository.getAllMembers();
      yield AllMembersLoadedState(members: members);
    } else if (event is RemoveMemberEvent) {
      yield MemberLoadingState();

      await membersRepository.removeMember(event.memberId);
      List<Member> members = await membersRepository.getAllMembers();
      yield AllMembersLoadedState(members: members);
    }
  }
}
