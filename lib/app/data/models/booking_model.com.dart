
import 'dart:convert';

List<Booking> bookingFromJson(String str) => List<Booking>.from(json.decode(str).map((x) => Booking.fromJson(x)));

String bookingToJson(List<Booking> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Booking {
  String? id;
  Customer? customer;
  Property? property;
  List<dynamic>? bookingDays;
  DateTime? startDate;
  DateTime? endDate;
  String? status;
  bool? expired;
  bool? checkedIn;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Booking({
    this.id,
    this.customer,
    this.property,
    this.bookingDays,
    this.startDate,
    this.endDate,
    this.status,
    this.expired,
    this.checkedIn,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json["_id"],
    customer: Customer.fromJson(json["customer"]),
    property: Property.fromJson(json["property"]),
    bookingDays: List<dynamic>.from(json["bookingDays"].map((x) => x)),
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    status: json["status"],
    expired: json["expired"],
    checkedIn: json["checkedIn"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "customer": customer!.toJson(),
    "property": property!.toJson(),
    "bookingDays": List<dynamic>.from(bookingDays!.map((x) => x)),
    "startDate": startDate!.toIso8601String(),
    "endDate": endDate!.toIso8601String(),
    "status": status,
    "expired": expired,
    "checkedIn": checkedIn,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };
}

class Customer {
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

  Customer({
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

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
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

class Property {
  Room? bedRoom;
  Room? bathRoom;
  AbsoluteLocation? absoluteLocation;
  RelativeLocation? relativeLocation;
  Verification? verification;
  String? id;
  String? name;
  String? type;
  List<String>? image;
  Owner? owner;
  int? price;
  List<String>? features;
  List<FeaturesWithImage>? featuresWithImage;
  String? description;
  bool? approved;
  String? status;
  List<dynamic>? relatedProperty;
  int? averageRating;
  int? totalRating;
  List<dynamic>? review;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Property({
    this.bedRoom,
    this.bathRoom,
    this.absoluteLocation,
    this.relativeLocation,
    this.verification,
    this.id,
    this.name,
    this.type,
    this.image,
    this.owner,
    this.price,
    this.features,
    this.featuresWithImage,
    this.description,
    this.approved,
    this.status,
    this.relatedProperty,
    this.averageRating,
    this.totalRating,
    this.review,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    bedRoom: Room.fromJson(json["bedRoom"]),
    bathRoom: Room.fromJson(json["bathRoom"]),
    absoluteLocation: AbsoluteLocation.fromJson(json["absoluteLocation"]),
    relativeLocation: RelativeLocation.fromJson(json["relativeLocation"]),
    verification: Verification.fromJson(json["verification"]),
    id: json["_id"],
    name: json["name"],
    type: json["type"],
    image: List<String>.from(json["image"].map((x) => x)),
    owner: Owner.fromJson(json["owner"]),
    price: json["price"],
    features: List<String>.from(json["features"].map((x) => x)),
    featuresWithImage: List<FeaturesWithImage>.from(json["featuresWithImage"].map((x) => FeaturesWithImage.fromJson(x))),
    description: json["description"],
    approved: json["approved"],
    status: json["status"],
    relatedProperty: List<dynamic>.from(json["relatedProperty"].map((x) => x)),
    averageRating: json["averageRating"],
    totalRating: json["totalRating"],
    review: List<dynamic>.from(json["review"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "bedRoom": bedRoom!.toJson(),
    "bathRoom": bathRoom!.toJson(),
    "absoluteLocation": absoluteLocation!.toJson(),
    "relativeLocation": relativeLocation!.toJson(),
    "verification": verification!.toJson(),
    "_id": id,
    "name": name,
    "type": type,
    "image": List<dynamic>.from(image!.map((x) => x)),
    "owner": owner!.toJson(),
    "price": price,
    "features": List<dynamic>.from(features!.map((x) =>x)),
    "featuresWithImage": List<dynamic>.from(featuresWithImage!.map((x) => x.toJson())),
    "description": description,
    "approved": approved,
    "status": status,
    "relatedProperty": List<dynamic>.from(relatedProperty!.map((x) => x)),
    "averageRating": averageRating,
    "totalRating": totalRating,
    "review": List<dynamic>.from(review!.map((x) => x)),
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };
}

class AbsoluteLocation {
  String? type;
  List<double>? coordinates;
  String? address;
  String? description;

  AbsoluteLocation({
    this.type,
    this.coordinates,
    this.address,
    this.description,
  });

  factory AbsoluteLocation.fromJson(Map<String, dynamic> json) => AbsoluteLocation(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    address: json["address"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates!.map((x) => x)),
    "address": address,
    "description": description,
  };
}

class Room {
  List<String>? image;
  int? count;

  Room({
    this.image,
    this.count,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
    image: List<String>.from(json["image"].map((x) => x)),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "image": List<dynamic>.from(image!.map((x) => x)),
    "count": count,
  };
}


class FeaturesWithImage {
  String? name;
  List<String>? image;
  String? id;

  FeaturesWithImage({
    this.name,
    this.image,
    this.id,
  });

  factory FeaturesWithImage.fromJson(Map<String, dynamic> json) => FeaturesWithImage(
    name: json["name"],
    image: List<String>.from(json["image"].map((x) => x)),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": List<dynamic>.from(image!.map((x) => x)),
    "_id": id,
  };
}

class Owner {
  Verification? verification;
  String? id;
  String? firstName;
  String? notificationToken;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? image;
  String? govtId;
  String? status;
  String? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Owner({
    this.verification,
    this.id,
    this.firstName,
    this.notificationToken,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.image,
    this.govtId,
    this.status,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    verification: Verification.fromJson(json["verification"]),
    id: json["_id"],
    firstName: json["firstName"],
    notificationToken: json["notificationToken"],
    lastName: json["lastName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    image: json["image"],
    govtId: json["govtId"],
    status: json["status"],
    role: json["role"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "verification": verification!.toJson(),
    "_id": id,
    "firstName": firstName,
    "notificationToken": notificationToken,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
    "image": image,
    "govtId": govtId,
    "status": status,
    "role": role,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };
}

class Verification {
  String? status;
  String? title;
  String? description;

  Verification({
    this.status,
    this.title,
    this.description,
  });

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
    status:json["status"],
    title: json["title"],
    description:json["description"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "title":title,
    "description": description,
  };
}

class RelativeLocation {
  String? country;

  RelativeLocation({
    this.country,
  });

  factory RelativeLocation.fromJson(Map<String, dynamic> json) => RelativeLocation(
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
