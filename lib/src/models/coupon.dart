
import 'dart:convert';

List<CouponResponse> couponsResponseFromJson(String str) => List<CouponResponse>.from(json.decode(str).map((x) => CouponResponse.fromJson(x)));

String couponsResponseToJson(List<CouponResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CouponResponse {
  int? id;
  String? code;
  String? amount;
  String? status;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  String? discountType;
  String? description;
  dynamic dateExpires;
  dynamic dateExpiresGmt;
  int? usageCount;
  bool? individualUse;
  List<dynamic>? productIds;
  List<dynamic>? excludedProductIds;
  dynamic usageLimit;
  dynamic usageLimitPerUser;
  dynamic limitUsageToXItems;
  bool? freeShipping;
  List<dynamic>? productCategories;
  List<dynamic>? excludedProductCategories;
  bool? excludeSaleItems;
  String? minimumAmount;
  String? maximumAmount;
  List<dynamic>? emailRestrictions;
  List<dynamic>? usedBy;
  List<MetaDatum>? metaData;
  Links? links;

  CouponResponse({
    this.id,
    this.code,
    this.amount,
    this.status,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.discountType,
    this.description,
    this.dateExpires,
    this.dateExpiresGmt,
    this.usageCount,
    this.individualUse,
    this.productIds,
    this.excludedProductIds,
    this.usageLimit,
    this.usageLimitPerUser,
    this.limitUsageToXItems,
    this.freeShipping,
    this.productCategories,
    this.excludedProductCategories,
    this.excludeSaleItems,
    this.minimumAmount,
    this.maximumAmount,
    this.emailRestrictions,
    this.usedBy,
    this.metaData,
    this.links,
  });

  factory CouponResponse.fromJson(Map<String, dynamic> json) => CouponResponse(
    id: json["id"],
    code: json["code"],
    amount: json["amount"],
    status: json["status"],
    dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
    dateCreatedGmt: json["date_created_gmt"] == null ? null : DateTime.parse(json["date_created_gmt"]),
    dateModified: json["date_modified"] == null ? null : DateTime.parse(json["date_modified"]),
    dateModifiedGmt: json["date_modified_gmt"] == null ? null : DateTime.parse(json["date_modified_gmt"]),
    discountType: json["discount_type"],
    description: json["description"],
    dateExpires: json["date_expires"],
    dateExpiresGmt: json["date_expires_gmt"],
    usageCount: json["usage_count"],
    individualUse: json["individual_use"],
    productIds: json["product_ids"] == null ? [] : List<dynamic>.from(json["product_ids"]!.map((x) => x)),
    excludedProductIds: json["excluded_product_ids"] == null ? [] : List<dynamic>.from(json["excluded_product_ids"]!.map((x) => x)),
    usageLimit: json["usage_limit"],
    usageLimitPerUser: json["usage_limit_per_user"],
    limitUsageToXItems: json["limit_usage_to_x_items"],
    freeShipping: json["free_shipping"],
    productCategories: json["product_categories"] == null ? [] : List<dynamic>.from(json["product_categories"]!.map((x) => x)),
    excludedProductCategories: json["excluded_product_categories"] == null ? [] : List<dynamic>.from(json["excluded_product_categories"]!.map((x) => x)),
    excludeSaleItems: json["exclude_sale_items"],
    minimumAmount: json["minimum_amount"],
    maximumAmount: json["maximum_amount"],
    emailRestrictions: json["email_restrictions"] == null ? [] : List<dynamic>.from(json["email_restrictions"]!.map((x) => x)),
    usedBy: json["used_by"] == null ? [] : List<dynamic>.from(json["used_by"]!.map((x) => x)),
    metaData: json["meta_data"] == null ? [] : List<MetaDatum>.from(json["meta_data"]!.map((x) => MetaDatum.fromJson(x))),
    links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "amount": amount,
    "status": status,
    "date_created": dateCreated?.toIso8601String(),
    "date_created_gmt": dateCreatedGmt?.toIso8601String(),
    "date_modified": dateModified?.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
    "discount_type": discountType,
    "description": description,
    "date_expires": dateExpires,
    "date_expires_gmt": dateExpiresGmt,
    "usage_count": usageCount,
    "individual_use": individualUse,
    "product_ids": productIds == null ? [] : List<dynamic>.from(productIds!.map((x) => x)),
    "excluded_product_ids": excludedProductIds == null ? [] : List<dynamic>.from(excludedProductIds!.map((x) => x)),
    "usage_limit": usageLimit,
    "usage_limit_per_user": usageLimitPerUser,
    "limit_usage_to_x_items": limitUsageToXItems,
    "free_shipping": freeShipping,
    "product_categories": productCategories == null ? [] : List<dynamic>.from(productCategories!.map((x) => x)),
    "excluded_product_categories": excludedProductCategories == null ? [] : List<dynamic>.from(excludedProductCategories!.map((x) => x)),
    "exclude_sale_items": excludeSaleItems,
    "minimum_amount": minimumAmount,
    "maximum_amount": maximumAmount,
    "email_restrictions": emailRestrictions == null ? [] : List<dynamic>.from(emailRestrictions!.map((x) => x)),
    "used_by": usedBy == null ? [] : List<dynamic>.from(usedBy!.map((x) => x)),
    "meta_data": metaData == null ? [] : List<dynamic>.from(metaData!.map((x) => x.toJson())),
    "_links": links?.toJson(),
  };
}

class Links {
  List<Collection>? self;
  List<Collection>? collection;

  Links({
    this.self,
    this.collection,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? [] : List<Collection>.from(json["self"]!.map((x) => Collection.fromJson(x))),
    collection: json["collection"] == null ? [] : List<Collection>.from(json["collection"]!.map((x) => Collection.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": self == null ? [] : List<dynamic>.from(self!.map((x) => x.toJson())),
    "collection": collection == null ? [] : List<dynamic>.from(collection!.map((x) => x.toJson())),
  };
}

class Collection {
  String? href;

  Collection({
    this.href,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class MetaDatum {
  int? id;
  String? key;
  dynamic value;

  MetaDatum({
    this.id,
    this.key,
    this.value,
  });

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
    id: json["id"],
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "key": key,
    "value": value,
  };
}

// To parse this JSON data, do
//
//     final coupon = couponFromJson(jsonString);

Coupon couponFromJson(String str) => Coupon.fromJson(json.decode(str));

String couponToJson(Coupon data) => json.encode(data.toJson());

class Coupon {
  String? code;

  Coupon({
    this.code,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
  };
}

