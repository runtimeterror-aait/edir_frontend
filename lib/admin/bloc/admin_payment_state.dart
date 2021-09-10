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

class AddPaymentState extends AdminPaymentState {}

class RemovePaymentState extends AdminPaymentState {}

class PaymentOperationFailedState extends AdminPaymentState {
  @override
  List<Object> get props => [];
}
