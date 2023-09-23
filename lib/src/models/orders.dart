
import 'dart:convert';



OrderCreate orderCreateFromJson(String str) => OrderCreate.fromJson(json.decode(str));

String orderCreateToJson(OrderCreate data) => json.encode(data.toJson());

class OrderCreate {
  String? paymentMethod;
  String? paymentMethodTitle;
  bool? setPaid;
  String? customerId;
  Ing? billing;
  Ing? shipping;
  List<LineItemPost>? lineItems;
  List<ShippingLine>? shippingLines;
  List<CouponLine>? couponLines;

  OrderCreate({
    this.paymentMethod,
    this.paymentMethodTitle,
    this.setPaid,
    this.customerId,
    this.billing,
    this.shipping,
    this.lineItems,
    this.shippingLines,
    this.couponLines,
  });

  factory OrderCreate.fromJson(Map<String, dynamic> json) => OrderCreate(
    paymentMethod: json["payment_method"],
    paymentMethodTitle: json["payment_method_title"],
    setPaid: json["set_paid"],
    customerId: json["customer_id"],
    billing: json["billing"] == null ? null : Ing.fromJson(json["billing"]),
    shipping: json["shipping"] == null ? null : Ing.fromJson(json["shipping"]),
    lineItems: json["line_items"] == null ? [] : List<LineItemPost>.from(json["line_items"]!.map((x) => LineItemPost.fromJson(x))),
    shippingLines: json["shipping_lines"] == null ? [] : List<ShippingLine>.from(json["shipping_lines"]!.map((x) => ShippingLine.fromJson(x))),
    couponLines: json["coupon_lines"] == null ? [] : List<CouponLine>.from(json["coupon_lines"]!.map((x) => CouponLine.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "payment_method": paymentMethod,
    "payment_method_title": paymentMethodTitle,
    "set_paid": setPaid,
    "customer_id": customerId,
    "billing": billing?.toJson(),
    "shipping": shipping?.toJson(),
    "line_items": lineItems == null ? [] : List<dynamic>.from(lineItems!.map((x) => x.toJson())),
    "shipping_lines": shippingLines == null ? [] : List<dynamic>.from(shippingLines!.map((x) => x.toJson())),
    "coupon_lines": couponLines == null ? [] : List<dynamic>.from(couponLines!.map((x) => x.toJson())),
  };
}

class CouponLine {
  String? code;

  CouponLine({
    this.code,
  });

  factory CouponLine.fromJson(Map<String, dynamic> json) => CouponLine(
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
  };
}



List<LineItem> lineItemFromJson(String str) => List<LineItem>.from(json.decode(str).map((x) => LineItem.fromJson(x)));

String lineItemToJson(List<LineItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


List<OrderResponse> ordersResponseFromJson(String str) => List<OrderResponse>.from(json.decode(str).map((x) => OrderResponse.fromJson(x)));

String ordersResponseToJson(List<OrderResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderResponse {
  int? id;
  int? parentId;
  String? status;
  String? currency;
  String? version;
  bool? pricesIncludeTax;
  DateTime? dateCreated;
  DateTime? dateModified;
  String? discountTotal;
  String? discountTax;
  String? shippingTotal;
  String? shippingTax;
  String? cartTax;
  String? total;
  String? totalTax;
  int? customerId;
  String? orderKey;
  Ing? billing;
  Ing? shipping;
  String? paymentMethod;
  String? paymentMethodTitle;
  String? transactionId;
  String? customerIpAddress;
  String? customerUserAgent;
  String? createdVia;
  String? customerNote;
  DateTime? dateCompleted;
  DateTime? datePaid;
  String? cartHash;
  String? number;
  List<MetaDatum>? metaData;
  List<LineItem>? lineItems;
  List<dynamic>? taxLines;
  List<ShippingLine>? shippingLines;
  List<dynamic>? feeLines;
  List<dynamic>? couponLines;
  List<dynamic>? refunds;
  String? paymentUrl;
  bool? isEditable;
  bool? needsPayment;
  bool? needsProcessing;
  DateTime? dateCreatedGmt;
  DateTime? dateModifiedGmt;
  DateTime? dateCompletedGmt;
  DateTime? datePaidGmt;
  String? currencySymbol;
  Links? links;

  OrderResponse({
    this.id,
    this.parentId,
    this.status,
    this.currency,
    this.version,
    this.pricesIncludeTax,
    this.dateCreated,
    this.dateModified,
    this.discountTotal,
    this.discountTax,
    this.shippingTotal,
    this.shippingTax,
    this.cartTax,
    this.total,
    this.totalTax,
    this.customerId,
    this.orderKey,
    this.billing,
    this.shipping,
    this.paymentMethod,
    this.paymentMethodTitle,
    this.transactionId,
    this.customerIpAddress,
    this.customerUserAgent,
    this.createdVia,
    this.customerNote,
    this.dateCompleted,
    this.datePaid,
    this.cartHash,
    this.number,
    this.metaData,
    this.lineItems,
    this.taxLines,
    this.shippingLines,
    this.feeLines,
    this.couponLines,
    this.refunds,
    this.paymentUrl,
    this.isEditable,
    this.needsPayment,
    this.needsProcessing,
    this.dateCreatedGmt,
    this.dateModifiedGmt,
    this.dateCompletedGmt,
    this.datePaidGmt,
    this.currencySymbol,
    this.links,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
    id: json["id"],
    parentId: json["parent_id"],
    status: json["status"],
    currency: json["currency"],
    version: json["version"],
    pricesIncludeTax: json["prices_include_tax"],
    dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
    dateModified: json["date_modified"] == null ? null : DateTime.parse(json["date_modified"]),
    discountTotal: json["discount_total"],
    discountTax: json["discount_tax"],
    shippingTotal: json["shipping_total"],
    shippingTax: json["shipping_tax"],
    cartTax: json["cart_tax"],
    total: json["total"],
    totalTax: json["total_tax"],
    customerId: json["customer_id"],
    orderKey: json["order_key"],
    billing: json["billing"] == null ? null : Ing.fromJson(json["billing"]),
    shipping: json["shipping"] == null ? null : Ing.fromJson(json["shipping"]),
    paymentMethod: json["payment_method"],
    paymentMethodTitle: json["payment_method_title"],
    transactionId: json["transaction_id"],
    customerIpAddress: json["customer_ip_address"],
    customerUserAgent: json["customer_user_agent"],
    createdVia: json["created_via"],
    customerNote: json["customer_note"],
    dateCompleted: json["date_completed"] == null ? null : DateTime.parse(json["date_completed"]),
    datePaid: json["date_paid"] == null ? null : DateTime.parse(json["date_paid"]),
    cartHash: json["cart_hash"],
    number: json["number"],
    metaData: json["meta_data"] == null ? [] : List<MetaDatum>.from(json["meta_data"]!.map((x) => MetaDatum.fromJson(x))),
    lineItems: json["line_items"] == null ? [] : List<LineItem>.from(json["line_items"]!.map((x) => LineItem.fromJson(x))),
    taxLines: json["tax_lines"] == null ? [] : List<dynamic>.from(json["tax_lines"]!.map((x) => x)),
    shippingLines: json["shipping_lines"] == null ? [] : List<ShippingLine>.from(json["shipping_lines"]!.map((x) => ShippingLine.fromJson(x))),
    feeLines: json["fee_lines"] == null ? [] : List<dynamic>.from(json["fee_lines"]!.map((x) => x)),
    couponLines: json["coupon_lines"] == null ? [] : List<dynamic>.from(json["coupon_lines"]!.map((x) => x)),
    refunds: json["refunds"] == null ? [] : List<dynamic>.from(json["refunds"]!.map((x) => x)),
    paymentUrl: json["payment_url"],
    isEditable: json["is_editable"],
    needsPayment: json["needs_payment"],
    needsProcessing: json["needs_processing"],
    dateCreatedGmt: json["date_created_gmt"] == null ? null : DateTime.parse(json["date_created_gmt"]),
    dateModifiedGmt: json["date_modified_gmt"] == null ? null : DateTime.parse(json["date_modified_gmt"]),
    dateCompletedGmt: json["date_completed_gmt"] == null ? null : DateTime.parse(json["date_completed_gmt"]),
    datePaidGmt: json["date_paid_gmt"] == null ? null : DateTime.parse(json["date_paid_gmt"]),
    currencySymbol: json["currency_symbol"],
    links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "status": status,
    "currency": currency,
    "version": version,
    "prices_include_tax": pricesIncludeTax,
    "date_created": dateCreated?.toIso8601String(),
    "date_modified": dateModified?.toIso8601String(),
    "discount_total": discountTotal,
    "discount_tax": discountTax,
    "shipping_total": shippingTotal,
    "shipping_tax": shippingTax,
    "cart_tax": cartTax,
    "total": total,
    "total_tax": totalTax,
    "customer_id": customerId,
    "order_key": orderKey,
    "billing": billing?.toJson(),
    "shipping": shipping?.toJson(),
    "payment_method": paymentMethod,
    "payment_method_title": paymentMethodTitle,
    "transaction_id": transactionId,
    "customer_ip_address": customerIpAddress,
    "customer_user_agent": customerUserAgent,
    "created_via": createdVia,
    "customer_note": customerNote,
    "date_completed": dateCompleted?.toIso8601String(),
    "date_paid": datePaid?.toIso8601String(),
    "cart_hash": cartHash,
    "number": number,
    "meta_data": metaData == null ? [] : List<dynamic>.from(metaData!.map((x) => x.toJson())),
    "line_items": lineItems == null ? [] : List<dynamic>.from(lineItems!.map((x) => x.toJson())),
    "tax_lines": taxLines == null ? [] : List<dynamic>.from(taxLines!.map((x) => x)),
    "shipping_lines": shippingLines == null ? [] : List<dynamic>.from(shippingLines!.map((x) => x.toJson())),
    "fee_lines": feeLines == null ? [] : List<dynamic>.from(feeLines!.map((x) => x)),
    "coupon_lines": couponLines == null ? [] : List<dynamic>.from(couponLines!.map((x) => x)),
    "refunds": refunds == null ? [] : List<dynamic>.from(refunds!.map((x) => x)),
    "payment_url": paymentUrl,
    "is_editable": isEditable,
    "needs_payment": needsPayment,
    "needs_processing": needsProcessing,
    "date_created_gmt": dateCreatedGmt?.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
    "date_completed_gmt": dateCompletedGmt?.toIso8601String(),
    "date_paid_gmt": datePaidGmt?.toIso8601String(),
    "currency_symbol": currencySymbol,
    "_links": links?.toJson(),
  };
}

class Ing {
  String? firstName;
  String? lastName;
  // String? company;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postcode;
  String? country;
  String? email;
  String? phone;

  Ing({
    this.firstName,
    this.lastName,
    // this.company,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.email,
    this.phone,
  });

  factory Ing.fromJson(Map<String, dynamic> json) => Ing(
    firstName: json["first_name"],
    lastName: json["last_name"],
    // company: json["company"],
    address1: json["address_1"],
    address2: json["address_2"],
    city: json["city"],
    state: json["state"],
    postcode: json["postcode"],
    country: json["country"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    // "company": company,
    "address_1": address1,
    "address_2": address2,
    "city": city,
    "state": state,
    "postcode": postcode,
    "country": country,
    "email": email,
    "phone": phone,
  };
}
//
// LineItemPost lineItemPostFromJson(String str) => LineItemPost.fromJson(json.decode(str));
//
// String lineItemPostToJson(LineItemPost data) => json.encode(data.toJson());

// class LineItemPost {
//   int? productId;
//   int? variationId;
//   int? quantity;
//
//   LineItemPost({
//     this.productId,
//     this.variationId,
//     this.quantity,
//   });
//
//   factory LineItemPost.fromJson(Map<String, dynamic> json) => LineItemPost(
//     productId: json["product_id"],
//     variationId: json["variation_id"],
//     quantity: json["quantity"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "product_id": productId,
//     "variation_id": variationId,
//     "quantity": quantity,
//   };
// }


class LineItemPost {
  // int? id;
  // String? name;
  int? productId;
  int? variationId;
  int? quantity;
  // int? taxClass;
  // String? subtotal;
  // String? subtotalTax;
  // String? total;
  // String? totalTax;
  // List<dynamic>? taxes;
  // List<dynamic>? metaData;
  // String? sku;
  // double? price;
  // Image? image;
  // dynamic parentName;

  LineItemPost({
    // this.id,
    // this.name,
    this.productId,
    this.variationId,
    this.quantity,
    // this.taxClass,
    // this.subtotal,
    // this.subtotalTax,
    // this.total,
    // this.totalTax,
    // this.taxes,
    // this.metaData,
    // this.sku,
    // this.price,
    // this.image,
    // this.parentName,
  });

  factory LineItemPost.fromJson(Map<String, dynamic> json) => LineItemPost(
    // id: json["id"],
    // name: json["name"],
    productId: json["product_id"],
    variationId: json["variation_id"],
    quantity: json["quantity"],
    // taxClass: json["tax_class"],
    // subtotal: json["subtotal"],
    // subtotalTax: json["subtotal_tax"],
    // total: json["total"],
    // totalTax: json["total_tax"],
    // taxes: json["taxes"] == null ? [] : List<dynamic>.from(json["taxes"]!.map((x) => x)),
    // metaData: json["meta_data"] == null ? [] : List<dynamic>.from(json["meta_data"]!.map((x) => x)),
    // sku: json["sku"],
    // price: json["price"]?.toDouble(),
    // image: json["image"] == null ? null : Image.fromJson(json["image"]),
    // parentName: json["parent_name"],
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    // "name": name,
    "product_id": productId,
    "variation_id": variationId,
    "quantity": quantity,
    // "tax_class": taxClass,
    // "subtotal": subtotal,
    // "subtotal_tax": subtotalTax,
    // "total": total,
    // "total_tax": totalTax,
    // "taxes": taxes == null ? [] : List<dynamic>.from(taxes!.map((x) => x)),
    // "meta_data": metaData == null ? [] : List<dynamic>.from(metaData!.map((x) => x)),
    // "sku": sku,
    // "price": price,
    // "image": image?.toJson(),
    // "parent_name": parentName,
  };
}

class LineItem {
  int? id;
  String? name;
  int? productId;
  int? variationId;
  int? quantity;
  String? taxClass;
  String? subtotal;
  String? subtotalTax;
  String? total;
  String? totalTax;
  List<dynamic>? taxes;
  List<dynamic>? metaData;
  String? sku;
  double? price;
  Image? image;
  dynamic parentName;

  LineItem({
    this.id,
    this.name,
    this.productId,
    this.variationId,
    this.quantity,
    this.taxClass,
    this.subtotal,
    this.subtotalTax,
    this.total,
    this.totalTax,
    this.taxes,
    this.metaData,
    this.sku,
    this.price,
    this.image,
    this.parentName,
  });

  factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
    id: json["id"],
    name: json["name"],
    productId: json["product_id"],
    variationId: json["variation_id"],
    quantity: json["quantity"],
    taxClass: json["tax_class"],
    subtotal: json["subtotal"],
    subtotalTax: json["subtotal_tax"],
    total: json["total"],
    totalTax: json["total_tax"],
    taxes: json["taxes"] == null ? [] : List<dynamic>.from(json["taxes"]!.map((x) => x)),
    metaData: json["meta_data"] == null ? [] : List<dynamic>.from(json["meta_data"]!.map((x) => x)),
    sku: json["sku"],
    price: json["price"]?.toDouble(),
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    parentName: json["parent_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "product_id": productId,
    "variation_id": variationId,
    "quantity": quantity,
    "tax_class": taxClass,
    "subtotal": subtotal,
    "subtotal_tax": subtotalTax,
    "total": total,
    "total_tax": totalTax,
    "taxes": taxes == null ? [] : List<dynamic>.from(taxes!.map((x) => x)),
    "meta_data": metaData == null ? [] : List<dynamic>.from(metaData!.map((x) => x)),
    "sku": sku,
    "price": price,
    "image": image?.toJson(),
    "parent_name": parentName,
  };
}

class Image {
  dynamic id;
  String? src;

  Image({
    this.id,
    this.src,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    src: json["src"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "src": src,
  };
}

class Links {
  List<Collection>? self;
  List<Collection>? collection;
  List<Collection>? customer;

  Links({
    this.self,
    this.collection,
    this.customer,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? [] : List<Collection>.from(json["self"]!.map((x) => Collection.fromJson(x))),
    collection: json["collection"] == null ? [] : List<Collection>.from(json["collection"]!.map((x) => Collection.fromJson(x))),
    customer: json["customer"] == null ? [] : List<Collection>.from(json["customer"]!.map((x) => Collection.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": self == null ? [] : List<dynamic>.from(self!.map((x) => x.toJson())),
    "collection": collection == null ? [] : List<dynamic>.from(collection!.map((x) => x.toJson())),
    "customer": customer == null ? [] : List<dynamic>.from(customer!.map((x) => x.toJson())),
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

class ShippingLine {
  int? id;
  String? methodTitle;
  String? methodId;
  String? instanceId;
  String? total;
  String? totalTax;
  List<dynamic>? taxes;
  List<dynamic>? metaData;

  ShippingLine({
    this.id,
    this.methodTitle,
    this.methodId,
    this.instanceId,
    this.total,
    this.totalTax,
    this.taxes,
    this.metaData,
  });

  factory ShippingLine.fromJson(Map<String, dynamic> json) => ShippingLine(
    id: json["id"],
    methodTitle: json["method_title"],
    methodId: json["method_id"],
    instanceId: json["instance_id"],
    total: json["total"],
    totalTax: json["total_tax"],
    taxes: json["taxes"] == null ? [] : List<dynamic>.from(json["taxes"]!.map((x) => x)),
    metaData: json["meta_data"] == null ? [] : List<dynamic>.from(json["meta_data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "method_title": methodTitle,
    "method_id": methodId,
    "instance_id": instanceId,
    "total": total,
    "total_tax": totalTax,
    "taxes": taxes == null ? [] : List<dynamic>.from(taxes!.map((x) => x)),
    "meta_data": metaData == null ? [] : List<dynamic>.from(metaData!.map((x) => x)),
  };
}

//
// List<ShippingLinePost> shippingLinePostFromJson(String str) => List<ShippingLinePost>.from(json.decode(str).map((x) => ShippingLinePost.fromJson(x)));
//
// String shippingLinePostToJson(List<ShippingLinePost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class ShippingLinePost {
//   String? methodId;
//   String? methodTitle;
//   String? total;
//
//   ShippingLinePost({
//     this.methodId,
//     this.methodTitle,
//     this.total,
//   });
//
//   factory ShippingLinePost.fromJson(Map<String, dynamic> json) => ShippingLinePost(
//     methodId: json["method_id"],
//     methodTitle: json["method_title"],
//     total: json["total"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "method_id": methodId,
//     "method_title": methodTitle,
//     "total": total,
//   };
// }
//


