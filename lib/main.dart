import 'package:edir/admin/bloc/admin_member_bloc.dart';
import 'package:edir/admin/bloc/admin_payment_bloc.dart';
import 'package:edir/admin/data_provider/admin_members_data_provider.dart';
import 'package:edir/admin/repository/admin_members_repository.dart';
import 'package:edir/auth/bloc/user_bloc.dart';
import 'package:edir/auth/repository/user_repository.dart';
import 'package:edir/bloc_observer.dart';
import 'package:edir/core/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'admin/bloc/admin_event_bloc.dart';
import 'admin/data_provider/admin_event_data_provider.dart';
import 'admin/repository/admin_event_repository.dart';

void main() {
  // Bloc.observer = SimpleBlocObserver();
  // final AdminEventRepository eventRepository =
  //     AdminEventRepository(AdminEventDataProvider());
  AdminMembersRepository membersRepository =
      AdminMembersRepository(AdminMembersDataProvider());
  UserRepository userRepository = UserRepository();
  runApp(
    // AdminEventBloc and AdminPaymentBloc providers
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AdminEventBloc(),
        ),
        BlocProvider(
          create: (context) => AdminPaymentBloc(),
        ),
        BlocProvider(
          create: (context) =>
              AdminMemberBloc(membersRepository: membersRepository),
        ),
        BlocProvider(
          create: (context) => UserBloc(userRepository: userRepository),
        ),
      ],
      child: AppWidget(),
    ),
  );
}
