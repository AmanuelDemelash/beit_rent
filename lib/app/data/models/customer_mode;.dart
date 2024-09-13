
import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  CustomerClass? customer;

  Customer({
    this.customer,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customer: CustomerClass.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "customer": customer!.toJson(),
  };
}

class CustomerClass {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? status;
  String? role;
  bool? hostingAccount;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CustomerClass({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.status,
    this.role,
    this.hostingAccount,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CustomerClass.fromJson(Map<String, dynamic> json) => CustomerClass(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    status: json["status"],
    role: json["role"],
    hostingAccount: json["hostingAccount"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
    "status": status,
    "role": role,
    "hostingAccount": hostingAccount,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };
}
