import 'dart:convert';
import 'orders.dart';

CustomerCreate customerCreateFromJson(String str) => CustomerCreate.fromJson(json.decode(str));

String customerCreateToJson(CustomerCreate data) => json.encode(data.toJson());

class CustomerCreate {
  final String email;
  final String firstName;
  final String lastName;
  final String username;
  final String password;
  final Ing billing;
  final Ing shipping;

  CustomerCreate({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.password,
    required this.billing,
    required this.shipping,
  });

  CustomerCreate copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? username,
    String? password,
    Ing? billing,
    Ing? shipping,
  }) =>
      CustomerCreate(
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        username: username ?? this.username,
        password: password ?? this.password,
        billing: billing ?? this.billing,
        shipping: shipping ?? this.shipping,
      );

  factory CustomerCreate.fromJson(Map<String, dynamic> json) => CustomerCreate(
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    username: json["username"],
    password: json["password"],
    billing: Ing.fromJson(json["billing"]),
    shipping: Ing.fromJson(json["shipping"])
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "username": username,
    "password": password,
    "billing": billing.toJson(),
    "shipping": shipping.toJson(),
  };
}



// To parse this JSON data, do
//
//     final customerCreateResponse = customerCreateResponseFromJson(jsonString);

CustomerCreateResponse customerCreateResponseFromJson(String str) => CustomerCreateResponse.fromJson(json.decode(str));

String customerCreateResponseToJson(CustomerCreateResponse data) => json.encode(data.toJson());

class CustomerCreateResponse {
  final int id;
  final DateTime dateCreated;
  final DateTime dateCreatedGmt;
  final DateTime dateModified;
  final DateTime dateModifiedGmt;
  final String email;
  final String firstName;
  final String lastName;
  final String role;
  final String username;
  final Ing billing;
  final Ing shipping;
  final bool isPayingCustomer;
  final String avatarUrl;
  final List<dynamic> metaData;
  final Links links;

  CustomerCreateResponse({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.username,
    required this.billing,
    required this.shipping,
    required this.isPayingCustomer,
    required this.avatarUrl,
    required this.metaData,
    required this.links,
  });

  CustomerCreateResponse copyWith({
    int? id,
    DateTime? dateCreated,
    DateTime? dateCreatedGmt,
    DateTime? dateModified,
    DateTime? dateModifiedGmt,
    String? email,
    String? firstName,
    String? lastName,
    String? role,
    String? username,
    Ing? billing,
    Ing? shipping,
    bool? isPayingCustomer,
    String? avatarUrl,
    List<dynamic>? metaData,
    Links? links,
  }) =>
      CustomerCreateResponse(
        id: id ?? this.id,
        dateCreated: dateCreated ?? this.dateCreated,
        dateCreatedGmt: dateCreatedGmt ?? this.dateCreatedGmt,
        dateModified: dateModified ?? this.dateModified,
        dateModifiedGmt: dateModifiedGmt ?? this.dateModifiedGmt,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        role: role ?? this.role,
        username: username ?? this.username,
        billing: billing ?? this.billing,
        shipping: shipping ?? this.shipping,
        isPayingCustomer: isPayingCustomer ?? this.isPayingCustomer,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        metaData: metaData ?? this.metaData,
        links: links ?? this.links,
      );

  factory CustomerCreateResponse.fromJson(Map<String, dynamic> json) => CustomerCreateResponse(
    id: json["id"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
    dateModified: DateTime.parse(json["date_modified"]),
    dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    role: json["role"],
    username: json["username"],
    billing: Ing.fromJson(json["billing"]),
    shipping: Ing.fromJson(json["shipping"]),
    isPayingCustomer: json["is_paying_customer"],
    avatarUrl: json["avatar_url"],
    metaData: List<dynamic>.from(json["meta_data"].map((x) => x)),
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_created": dateCreated.toIso8601String(),
    "date_created_gmt": dateCreatedGmt.toIso8601String(),
    "date_modified": dateModified.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt.toIso8601String(),
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "role": role,
    "username": username,
    "billing": billing.toJson(),
    "shipping": shipping.toJson(),
    "is_paying_customer": isPayingCustomer,
    "avatar_url": avatarUrl,
    "meta_data": List<dynamic>.from(metaData.map((x) => x)),
    "_links": links.toJson(),
  };
}

class Links {
  final List<Collection> self;
  final List<Collection> collection;

  Links({
    required this.self,
    required this.collection,
  });

  Links copyWith({
    List<Collection>? self,
    List<Collection>? collection,
  }) =>
      Links(
        self: self ?? this.self,
        collection: collection ?? this.collection,
      );

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
    collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
  };
}

class Collection {
  final String href;

  Collection({
    required this.href,
  });

  Collection copyWith({
    String? href,
  }) =>
      Collection(
        href: href ?? this.href,
      );

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}



class BasicCustomerData{
  final String email;
  final String firstName;
  final String lastName;
  final String username;
  final String password;


  BasicCustomerData({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.password
  });
}




// To parse this JSON data, do
//
//     final customerLoginResponse = customerLoginResponseFromJson(jsonString);



CustomerLoginResponse customerLoginResponseFromJson(String str) => CustomerLoginResponse.fromJson(json.decode(str));

String customerLoginResponseToJson(CustomerLoginResponse data) => json.encode(data.toJson());

class CustomerLoginResponse {
  bool? success;
  int? statusCode;
  String? code;
  String? message;
  Data? data;

  CustomerLoginResponse({
    this.success,
    this.statusCode,
    this.code,
    this.message,
    this.data,
  });

  factory CustomerLoginResponse.fromJson(Map<String, dynamic> json) => CustomerLoginResponse(
    success: json["success"],
    statusCode: json["statusCode"],
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? token;
  int? id;
  String? email;
  String? nicename;
  String? firstName;
  String? lastName;
  String? displayName;

  Data({
    this.token,
    this.id,
    this.email,
    this.nicename,
    this.firstName,
    this.lastName,
    this.displayName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    id: json["id"],
    email: json["email"],
    nicename: json["nicename"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    displayName: json["displayName"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "id": id,
    "email": email,
    "nicename": nicename,
    "firstName": firstName,
    "lastName": lastName,
    "displayName": displayName,
  };
}



