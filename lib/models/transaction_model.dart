import 'package:scan2pay/models/user_model.dart';

class TransactionModel {
  dynamic deletedAt;
  int id;
  String transactionCode;
  String senderId;
  String receiverId;
  int amount;
  DateTime createdAt;
  DateTime updatedAt;
  UserModel? sender;
  UserModel? receiver;

  TransactionModel({
    this.deletedAt,
    required this.id,
    required this.transactionCode,
    required this.senderId,
    required this.receiverId,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
    this.sender,
    this.receiver
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    deletedAt: json["DeletedAt"],
    id: json["ID"],
    transactionCode: json["TransactionCode"],
    senderId: json["SenderID"],
    receiverId: json["ReceiverID"],
    amount: json["Amount"],
    createdAt: DateTime.parse(json["CreatedAt"]),
    updatedAt: DateTime.parse(json["UpdatedAt"]),
    sender: UserModel.fromJson(json['Sender']),
      receiver: UserModel.fromJson(json['Receiver'])
  );
}