class UserModel {
  final String? id;
  final String? ktp;
  final String? phoneNumber;
  final int? gender;
  final String? birthDate;
  final String? name;
  final String? email;
  final String? pinNumber;
  final String? password;

  UserModel({
    this.id, this.ktp, this.phoneNumber, this.gender, this.birthDate, this.name, this.email, this.pinNumber, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    ktp: json['ktp'],
    phoneNumber: json['phoneNumber'],
    gender: json['gender'],
    birthDate: json['birthDate'],
    name: json['name'],
    email: json['email'],
    password: json['passowrd'],
    pinNumber: json['pinNumber']
  );

  Map<String, dynamic> toJson() => {
    'ktpId': ktp,
    'username': name,
    'loginPassword': password,
    'phoneNumber': phoneNumber,
    'birthDate': birthDate,
    'gender': gender,
    'email': email,
  };
}