import 'dart:ui';

import 'package:edir/admin/bloc/admin_event_bloc.dart';
import 'package:edir/admin/bloc/admin_member_bloc.dart';
import 'package:edir/admin/data_provider/admin_event_data_provider.dart';
import 'package:edir/admin/data_provider/admin_members_data_provider.dart';
import 'package:edir/admin/repository/admin_members_repository.dart';
import 'package:edir/core/appbar.dart';
import 'package:edir/core/models/member.dart';
import 'package:edir/core/signin_and_register_form.dart';
import 'package:edir/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminManageMembersPage extends StatefulWidget with SignInAndRegisterForm {
  AdminManageMembersPage({Key? key}) : super(key: key);

  @override
  State<AdminManageMembersPage> createState() => _AdminManageMembersPageState();
}

class _AdminManageMembersPageState extends State<AdminManageMembersPage>
    with Styles {
  // AdminMembersRepository repository =
  //     AdminMembersRepository(AdminMembersDataProvider());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AdminMemberBloc>(context).add(GetAllMembersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Column(
        children: [
          Container(
            height: 300,
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Pending Approvals",
                      style: textStyle_2.copyWith(
                        color: MaterialStateColor.resolveWith(
                            (states) => Colors.amber),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.person_add, color: Colors.grey),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AdminMemberBloc>(context)
                          ..add(GetAllMembersEvent());
                      },
                      icon: Icon(
                        Icons.refresh,
                        color: Colors.amber,
                      ),
                    )
                  ],
                ),
                Divider(
                  height: 20,
                  color: Colors.amber,
                ),
                Expanded(
                  child: BlocBuilder<AdminMemberBloc, AdminMemberState>(
                    builder: (context, state) {
                      int pendingCounter = 0;

                      if (state is MemberLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.amber,
                          ),
                        );
                      } else if (state is AllMembersLoadedState) {
                        List<Member> members = state.members;
                        for (Member member in members) {
                          if (member.status == "p") {
                            pendingCounter++;
                          }
                        }
                        if (members.length == 0) {
                          return Center(
                            child: Text("No pending approvals."),
                          );
                        } else if (members.length > 0) {
                          return ListView(
                            padding: const EdgeInsets.all(10),
                            children: [
                              for (int i = members.length - 1; i >= 0; i--)
                                if (members[i].status == "p")
                                  PendingApproval(
                                    memberName: members[i].user.fullName,
                                    memberId: members[i].id,
                                  ),
                              if (pendingCounter == 0)
                                Center(
                                  child: Text(
                                    "No pending approvals.",
                                  ),
                                )
                            ],
                          );
                        }
                        return Center(
                          child: Text("No pending approvals."),
                        );
                      }
                      return Text(
                        "Couldn't fetch events.",
                        style: TextStyle(color: Colors.red),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Members",
                        style: textStyle_2.copyWith(
                          color: MaterialStateColor.resolveWith(
                              (states) => Colors.amber),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.people,
                        color: Colors.grey,
                      ),
                      Spacer(),
                    ],
                  ),
                  Divider(
                    height: 20,
                    color: Colors.amber,
                  ),
                  Expanded(
                    child: BlocBuilder<AdminMemberBloc, AdminMemberState>(
                      builder: (context, state) {
                        if (state is MemberLoadingState) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.amber,
                            ),
                          );
                        }

                        if (state is AllMembersLoadedState) {
                          List<Member> members = state.members;
                          if (members.length == 0) {
                            return Center(
                              child: Text(
                                "No members.",
                              ),
                            );
                          }
                          return ListView(
                            padding: const EdgeInsets.all(10),
                            children: [
                              for (int i = members.length - 1; i >= 0; i--)
                                if (state.members[i].status == "a")
                                  Members(
                                    memberName:
                                        "${state.members[i].user.fullName}",
                                    memberId: state.members[i].id,
                                  ),
                            ],
                          );
                        }
                        return Center(
                          child: Text(
                            "Couldn't fetch members.",
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PendingApproval extends StatelessWidget with SignInAndRegisterForm {
  PendingApproval({Key? key, required this.memberName, required this.memberId})
      : super(key: key);
  final String memberName;
  final int memberId;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "$memberName",
              style: TextStyle(color: Colors.grey.shade300),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<AdminMemberBloc>(context)
                    .add(ApproveMemberEvent(memberId: memberId));
              },
              child: Text(
                "Approve",
              ),
              style: raisedButtonStyleNormal.copyWith(
                elevation: MaterialStateProperty.resolveWith((states) => 0),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<AdminMemberBloc>(context)
                    .add(RemoveMemberEvent(memberId: memberId));
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.grey[200]),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.grey),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class Members extends StatelessWidget with SignInAndRegisterForm {
  Members({Key? key, required this.memberName, required this.memberId})
      : super(key: key);
  final String memberName;
  final int memberId;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "$memberName",
              style: TextStyle(color: Colors.grey.shade300),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<AdminMemberBloc>(context)
                    .add(RemoveMemberEvent(memberId: memberId));
              },
              child: Text(
                "Remove",
                style: TextStyle(color: Colors.grey[200]),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.red),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
