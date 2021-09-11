import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:edir/admin/bloc/admin_event_bloc.dart';
import 'package:edir/admin/bloc/admin_member_bloc.dart';
import 'package:test/test.dart';
import 'package:edir/admin/repository/admin_members_repository.dart';
import 'package:edir/admin/data_provider/admin_members_data_provider.dart';



void main(){
  group(
    'Admin Member Bloc', (){

      AdminMemberBloc adminMemberBloc = AdminMemberBloc(membersRepository: AdminMembersRepository(AdminMembersDataProvider()));

      blocTest<AdminMemberBloc, AdminMemberState>('emit [MemberLoadingState(), MemberOperationFailedState()] when GetAllMembersEvent is added',
        build: () => adminMemberBloc,
        act: (bloc) => bloc.add(GetAllMembersEvent()),
        expect: () => [MemberLoadingState(), MemberOperationFailedState()],
        // expect: () => [MemberLoadingState(), isA<AllMembersLoadedState>()],
      );


    });

}



