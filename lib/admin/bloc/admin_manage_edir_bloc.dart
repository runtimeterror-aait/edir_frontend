import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'admin_manage_edir_event.dart';
part 'admin_manage_edir_state.dart';

class AdminManageEdirBloc extends Bloc<AdminManageEdirEvent, AdminManageEdirState> {
  AdminManageEdirBloc() : super(AdminManageEdirInitial());

  @override
  Stream<AdminManageEdirState> mapEventToState(
    AdminManageEdirEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
