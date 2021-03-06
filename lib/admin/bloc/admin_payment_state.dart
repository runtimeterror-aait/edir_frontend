part of 'admin_payment_bloc.dart';

abstract class AdminPaymentState extends Equatable {
  const AdminPaymentState();

  @override
  List<Object> get props => [];
}

class AdminPaymentInitial extends AdminPaymentState {}

class PaymentsLoadingState extends AdminPaymentState {}

class AllPaymentsLoadedState extends AdminPaymentState {
  final List<Payment> payments;
  AllPaymentsLoadedState({required this.payments});
}

class GetMemberPaymentsState extends AdminPaymentState {
  final List<Payment> payments;
  GetMemberPaymentsState({required this.payments});
  @override
  List<Object> get props => [];
}

class AddPaymentState extends AdminPaymentState {}

class RemovePaymentState extends AdminPaymentState {}

class GetAllPaymentOperationFailedState extends AdminPaymentState {
  @override
  List<Object> get props => [];
}

class RemovePaymentOperationFailedState extends AdminPaymentState {
  @override
  List<Object> get props => [];
}

class AddPaymentOperationFailedState extends AdminPaymentState {
  @override
  List<Object> get props => [];
}

class GetMemberPaymentOperationFailedState extends AdminPaymentState {
  @override
  List<Object> get props => [];
}
