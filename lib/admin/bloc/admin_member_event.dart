part of 'admin_member_bloc.dart';

abstract class AdminMemberEvent extends Equatable {
  const AdminMemberEvent();

  @override
  List<Object> get props => [];
}

class GetAllMembersEvent extends AdminMemberEvent {
  GetAllMembersEvent();

  @override
  List<Object> get props => [];
}

class ApproveMemberEvent extends AdminMemberEvent {
  final int memberId;
  ApproveMemberEvent({required this.memberId});

  @override
  List<Object> get props => [memberId];
}

// class ReloadMemberEvent extends AdminMemberEvent {
//   ReloadMemberEvent();

//   @override
//   List<Object> get props => [];
// }

// class ReloadApprovalsEvent extends AdminMemberEvent {
//   ReloadApprovalsEvent();
//   @override
//   List<Object> get props => [];
// }

class RemoveMemberEvent extends AdminMemberEvent {
  final int memberId;
  RemoveMemberEvent({required this.memberId});

  @override
  List<Object> get props => [memberId];
}
