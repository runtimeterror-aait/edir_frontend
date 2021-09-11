import 'package:edir/admin/data_provider/admin_payment_data_provider.dart';
import 'package:edir/core/models/payment.dart';

class AdminPaymentRepository {
  AdminPaymentDataProvider paymentDataProvider = AdminPaymentDataProvider();

  Future<String> addPayment(int memberId, Payment payment) async {
    return await paymentDataProvider.addPayment(memberId, payment);
  }

  Future<List<Payment>> getAllPayments(int memberId) async {
    return await paymentDataProvider.getAllPayments(memberId);
  }

  Future<List<Payment>> getMemberPayments(int memberId, int edirId) async {
    return await paymentDataProvider.getMemberPayments(memberId, edirId);
  }

  Future<String> removePayment(int memberId) async {
    return await paymentDataProvider.removePayment(memberId);
  }
}
