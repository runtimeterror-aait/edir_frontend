part of 'admin_payment_bloc.dart';

abstract class AdminPaymentEvent extends Equatable {
  const AdminPaymentEvent();

  @override
  List<Object> get props => [];
}

class GetAllPaymentsEvent extends AdminPaymentEvent {
  final int memberId;
  GetAllPaymentsEvent({required this.memberId});
  @override
  List<Object> get props => [memberId];
}

class AddPaymentEvent extends AdminPaymentEvent {
  final int memberId;
  final Payment payment;
  AddPaymentEvent({required this.memberId, required this.payment});
  @override
  List<Object> get props => [memberId, payment];
}

class RemovePaymentEvent extends AdminPaymentEvent {
  final int memberId;
  RemovePaymentEvent({required this.memberId});
  @override
  List<Object> get props => [memberId];
}
