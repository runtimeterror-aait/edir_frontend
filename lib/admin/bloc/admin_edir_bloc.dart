import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edir/core/models/edir.dart';
import 'package:equatable/equatable.dart';

part 'admin_edir_event.dart';
part 'admin_edir_state.dart';

class AdminEdirBloc extends Bloc<AdminEdirEvent, AdminEdirState> {
  AdminEdirBloc() : super(AdminEdirInitial());

  @override
  Stream<AdminEdirState> mapEventToState(
    AdminEdirEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
