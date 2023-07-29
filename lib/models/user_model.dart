class UserModel {
  dynamic deletedAt;
  String? id;
  String? ktp;
  String? phonenumber;
  int? gender;
  String? birthDate;
  String? name;
  String? email;
  String? pinNumber;
  int? limitCredit;
  int? totalCredit;
  String? password;
  String? accountName;
  String? accountNumber;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? sentTransaction;
  dynamic? receiveedTransaction;

  UserModel({
    this.deletedAt,
    this.id,
    this.ktp,
    this.phonenumber,
    this.gender,
    this.birthDate,
    this.name,
    this.email,
    this.pinNumber,
    this.limitCredit,
    this.totalCredit,
    this.password,
    this.accountName,
    this.accountNumber,
    this.createdAt,
    this.updatedAt,
    this.sentTransaction,
    this.receiveedTransaction,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    deletedAt: json["DeletedAt"],
    id: json["ID"],
    ktp: json["KTP"],
    phonenumber: json["Phonenumber"],
    gender: json["Gender"],
    birthDate: json["BirthDate"],
    name: json["Name"],
    email: json["Email"],
    pinNumber: json["PinNumber"],
    limitCredit: json["LimitCredit"],
    totalCredit: json["TotalCredit"],
    password: json["Password"],
    accountName: json["AccountName"],
    accountNumber: json["AccountNumber"],
    createdAt: DateTime.parse(json["CreatedAt"]),
    updatedAt: DateTime.parse(json["UpdatedAt"]),
    sentTransaction: json["SentTransaction"],
    receiveedTransaction: json["ReceiveedTransaction"],
  );

  Map<String, dynamic> toJson() => {
    "KTP": ktp,
    "Name": name,
    "LoginPassword": password,
    "Phonenumber": phonenumber,
    "BirthDate": birthDate,
    "Gender": gender,
    "Email": email,
  };
}