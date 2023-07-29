import '../config/network.dart';
import '../models/transaction_model.dart';

class TransactionService {
  final network = Network();

  Future<List<TransactionModel>> getAllTransaction() async {
    try {
      final result = await network.getWithToken('app/scan-payment');
      return (result.data['data']['OUT'] as List)
          .map((x) => TransactionModel.fromJson(x))
          .toList();
    } catch(e) {
      throw Exception(e);
    }
  }

  Future<TransactionModel> scan(String receiverId, int amount) async {
    try {
      final result = await network.postWithToken("app/scan-payment/$receiverId", data: {"amount": amount});
      return TransactionModel.fromJson(result.data['data']);
    } catch(e) {
      throw Exception(e);
    }
  }
}