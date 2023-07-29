import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/transaction_model.dart';
import '../../../services/transaction_service.dart';

class DashboardController extends GetxController with StateMixin<List<TransactionModel>> {

  final _transactionService = TransactionService();

  final userId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getAllTransaction();
  }

  Future<void> getAllTransaction() async {
    try {
      final pref = await SharedPreferences.getInstance();
      userId.value = pref.getString('id')!;
      final result = await _transactionService.getAllTransaction();
      change(result, status: RxStatus.success());
    } catch(e) {
      throw Exception(e);
    }
  }
}
