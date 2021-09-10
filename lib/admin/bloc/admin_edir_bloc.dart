import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edir/admin/bloc/admin_event_bloc.dart';
import 'package:edir/admin/repository/admin_edir_repository.dart';
import 'package:edir/core/models/edir.dart';
import 'package:equatable/equatable.dart';

part 'admin_edir_event.dart';
part 'admin_edir_state.dart';

class AdminEdirBloc extends Bloc<AdminEdirEvent, AdminEdirState> {
  AdminEdirBloc() : super(AdminEdirInitial());
  AdminEdirRepository adminEdirRepository = AdminEdirRepository();
  @override
  Stream<AdminEdirState> mapEventToState(
    AdminEdirEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetCurrentEdirEvent) {
      try {
        yield EdirsLoadingState();
        final Edir edir = await adminEdirRepository.getCurrentEdir();

        yield EdirsLoadedState(edir: edir);
      } catch (_) {
        yield EdirOperationFailedState();
      }
    } else if (event is UpdateEdirEvent) {
      try {
        yield EdirsLoadingState();
        await adminEdirRepository.updateEdir(event.edirInt, event.edir);

        final Edir edir = await adminEdirRepository.getCurrentEdir();
        yield EdirsLoadedState(edir: edir);
      } catch (_) {
        yield EdirOperationFailedState();
      }
    } else if (event is CreateEdirEvent) {
      try {
        yield EdirsLoadingState();
        await adminEdirRepository.createEdir(event.edir);

        final Edir edir = await adminEdirRepository.getCurrentEdir();
        yield EdirsLoadedState(edir: edir);
      } catch (_) {
        yield EdirOperationFailedState();
      }
    }
  }
}
