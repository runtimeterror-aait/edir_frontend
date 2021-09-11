part of 'admin_member_bloc.dart';

abstract class AdminMemberState extends Equatable {
  const AdminMemberState();

  @override
  List<Object> get props => [];
}

class AdminMemberInitial extends AdminMemberState {}

class MemberLoadingState extends AdminMemberState {}

// class MemberLoadingApprovalsState extends AdminMemberState {}

// class MemberLoadingMembersState extends AdminMemberState {}

class AllMembersLoadedState extends AdminMemberState {
  final List<Member> members;
  AllMembersLoadedState({required this.members});
}

class ApproveMemberState extends AdminMemberState {
  final Member member;

  ApproveMemberState({required this.member});
}


class MemberOperationFailedState extends AdminMemberState {
}
