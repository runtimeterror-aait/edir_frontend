part of 'admin_payment_bloc.dart';

abstract class AdminPaymentState extends Equatable {
  const AdminPaymentState();
  
  @override
  List<Object> get props => [];
}

class AdminPaymentInitial extends AdminPaymentState {}
