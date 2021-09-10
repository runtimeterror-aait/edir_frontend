import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'admin_payment_event.dart';
part 'admin_payment_state.dart';

class AdminPaymentBloc extends Bloc<AdminPaymentEvent, AdminPaymentState> {
  AdminPaymentBloc() : super(AdminPaymentInitial());

  @override
  Stream<AdminPaymentState> mapEventToState(
    AdminPaymentEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
