import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edir/admin/data_provider/admin_payment_data_provider.dart';
import 'package:edir/admin/repository/admin_payment_repository.dart';
import 'package:edir/auth/data_provider/user_provider.dart';
import 'package:edir/auth/models/member.dart';
import 'package:edir/core/models/payment.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'admin_payment_event.dart';
part 'admin_payment_state.dart';

class AdminPaymentBloc extends Bloc<AdminPaymentEvent, AdminPaymentState> {
  AdminPaymentBloc() : super(AdminPaymentInitial());
  AdminPaymentRepository paymentRepository = AdminPaymentRepository();
  @override
  Stream<AdminPaymentState> mapEventToState(
    AdminPaymentEvent event,
  ) async* {
    // TODO: implement mapEventToStat

    if (event is GetAllPaymentsEvent) {
      try {
        yield PaymentsLoadingState();
        List<Payment> payments =
            await paymentRepository.getAllPayments(event.memberId);

        yield AllPaymentsLoadedState(payments: payments);
      } catch (_) {
        yield GetAllPaymentOperationFailedState();
      }
    } else if (event is AddPaymentEvent) {
      try {
        yield PaymentsLoadingState();
        await paymentRepository.addPayment(event.memberId, event.payment);
        List<Payment> payments =
            await paymentRepository.getAllPayments(event.memberId);
        yield AllPaymentsLoadedState(payments: payments);
      } catch (_) {
        yield AddPaymentOperationFailedState();
      }
    } else if (event is RemovePaymentEvent) {
      try {
        yield PaymentsLoadingState();
        await paymentRepository.removePayment(event.memberId);
        List<Payment> payments =
            await paymentRepository.getAllPayments(event.memberId);
        yield AllPaymentsLoadedState(payments: payments);
      } catch (_) {
        yield RemovePaymentOperationFailedState();
      }
    } else if (event is GetMemberPaymentsEvent) {
      try {
        yield PaymentsLoadingState();
        UserDataProvider userDataProvider = UserDataProvider();
        Member member = await userDataProvider.getJoinedEdir();
        List<Payment> payments =
            await paymentRepository.getAllPayments(member.id!);
        yield GetMemberPaymentsState(payments: payments);
      } catch (_) {
        yield GetMemberPaymentOperationFailedState();
      }
    }
  }
}
