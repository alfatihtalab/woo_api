// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productsFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productsToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  int? id;
  String? name;
  String? slug;
  String? permalink;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  Type? type;
  Status? status;
  bool? featured;
  CatalogVisibility? catalogVisibility;
  String? description;
  String? shortDescription;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  bool? onSale;
  bool? purchasable;
  int? totalSales;
  bool? virtual;
  bool? downloadable;
  List<dynamic>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? externalUrl;
  String? buttonText;
  TaxStatus? taxStatus;
  String? taxClass;
  bool? manageStock;
  dynamic stockQuantity;
  Backorders? backorders;
  bool? backordersAllowed;
  bool? backordered;
  dynamic lowStockAmount;
  bool? soldIndividually;
  String? weight;
  Dimensions? dimensions;
  bool? shippingRequired;
  bool? shippingTaxable;
  String? shippingClass;
  int? shippingClassId;
  bool? reviewsAllowed;
  String? averageRating;
  int? ratingCount;
  List<dynamic>? upsellIds;
  List<dynamic>? crossSellIds;
  int? parentId;
  String? purchaseNote;
  List<Category>? categories;
  List<Category>? tags;
  List<ProductImage>? images;
  List<Attribute>? attributes;
  List<dynamic>? defaultAttributes;
  List<int>? variations;
  List<dynamic>? groupedProducts;
  int? menuOrder;
  String? priceHtml;
  List<int>? relatedIds;
  List<MetaDatum>? metaData;
  StockStatus? stockStatus;
  bool? hasOptions;
  Links? links;

  Product({
    this.id,
    this.name,
    this.slug,
    this.permalink,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.type,
    this.status,
    this.featured,
    this.catalogVisibility,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    this.onSale,
    this.purchasable,
    this.totalSales,
    this.virtual,
    this.downloadable,
    this.downloads,
    this.downloadLimit,
    this.downloadExpiry,
    this.externalUrl,
    this.buttonText,
    this.taxStatus,
    this.taxClass,
    this.manageStock,
    this.stockQuantity,
    this.backorders,
    this.backordersAllowed,
    this.backordered,
    this.lowStockAmount,
    this.soldIndividually,
    this.weight,
    this.dimensions,
    this.shippingRequired,
    this.shippingTaxable,
    this.shippingClass,
    this.shippingClassId,
    this.reviewsAllowed,
    this.averageRating,
    this.ratingCount,
    this.upsellIds,
    this.crossSellIds,
    this.parentId,
    this.purchaseNote,
    this.categories,
    this.tags,
    this.images,
    this.attributes,
    this.defaultAttributes,
    this.variations,
    this.groupedProducts,
    this.menuOrder,
    this.priceHtml,
    this.relatedIds,
    this.metaData,
    this.stockStatus,
    this.hasOptions,
    this.links,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        permalink: json["permalink"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        dateCreatedGmt: json["date_created_gmt"] == null
            ? null
            : DateTime.parse(json["date_created_gmt"]),
        dateModified: json["date_modified"] == null
            ? null
            : DateTime.parse(json["date_modified"]),
        dateModifiedGmt: json["date_modified_gmt"] == null
            ? null
            : DateTime.parse(json["date_modified_gmt"]),
        type: typeValues.map[json["type"]]!,
        status: statusValues.map[json["status"]]!,
        featured: json["featured"],
        catalogVisibility:
            catalogVisibilityValues.map[json["catalog_visibility"]]!,
        description: json["description"],
        shortDescription: json["short_description"],
        sku: json["sku"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        dateOnSaleFrom: json["date_on_sale_from"],
        dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
        dateOnSaleTo: json["date_on_sale_to"],
        dateOnSaleToGmt: json["date_on_sale_to_gmt"],
        onSale: json["on_sale"],
        purchasable: json["purchasable"],
        totalSales: json["total_sales"],
        virtual: json["virtual"],
        downloadable: json["downloadable"],
        downloads: json["downloads"] == null
            ? []
            : List<dynamic>.from(json["downloads"]!.map((x) => x)),
        downloadLimit: json["download_limit"],
        downloadExpiry: json["download_expiry"],
        externalUrl: json["external_url"],
        buttonText: json["button_text"],
        taxStatus: taxStatusValues.map[json["tax_status"]]!,
        taxClass: json["tax_class"],
        manageStock: json["manage_stock"],
        stockQuantity: json["stock_quantity"],
        backorders: backordersValues.map[json["backorders"]]!,
        backordersAllowed: json["backorders_allowed"],
        backordered: json["backordered"],
        lowStockAmount: json["low_stock_amount"],
        soldIndividually: json["sold_individually"],
        weight: json["weight"],
        dimensions: json["dimensions"] == null
            ? null
            : Dimensions.fromJson(json["dimensions"]),
        shippingRequired: json["shipping_required"],
        shippingTaxable: json["shipping_taxable"],
        shippingClass: json["shipping_class"],
        shippingClassId: json["shipping_class_id"],
        reviewsAllowed: json["reviews_allowed"],
        averageRating: json["average_rating"],
        ratingCount: json["rating_count"],
        upsellIds: json["upsell_ids"] == null
            ? []
            : List<dynamic>.from(json["upsell_ids"]!.map((x) => x)),
        crossSellIds: json["cross_sell_ids"] == null
            ? []
            : List<dynamic>.from(json["cross_sell_ids"]!.map((x) => x)),
        parentId: json["parent_id"],
        purchaseNote: json["purchase_note"],
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        tags: json["tags"] == null
            ? []
            : List<Category>.from(
                json["tags"]!.map((x) => Category.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<ProductImage>.from(
                json["images"]!.map((x) => ProductImage.fromJson(x))),
        attributes: json["attributes"] == null
            ? []
            : List<Attribute>.from(
                json["attributes"]!.map((x) => Attribute.fromJson(x))),
        defaultAttributes: json["default_attributes"] == null
            ? []
            : List<dynamic>.from(json["default_attributes"]!.map((x) => x)),
        variations: json["variations"] == null
            ? []
            : List<int>.from(json["variations"]!.map((x) => x)),
        groupedProducts: json["grouped_products"] == null
            ? []
            : List<dynamic>.from(json["grouped_products"]!.map((x) => x)),
        menuOrder: json["menu_order"],
        priceHtml: json["price_html"],
        relatedIds: json["related_ids"] == null
            ? []
            : List<int>.from(json["related_ids"]!.map((x) => x)),
        metaData: json["meta_data"] == null
            ? []
            : List<MetaDatum>.from(
                json["meta_data"]!.map((x) => MetaDatum.fromJson(x))),
        stockStatus: stockStatusValues.map[json["stock_status"]]!,
        hasOptions: json["has_options"],
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "permalink": permalink,
        "date_created": dateCreated?.toIso8601String(),
        "date_created_gmt": dateCreatedGmt?.toIso8601String(),
        "date_modified": dateModified?.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
        "type": typeValues.reverse[type],
        "status": statusValues.reverse[status],
        "featured": featured,
        "catalog_visibility":
            catalogVisibilityValues.reverse[catalogVisibility],
        "description": description,
        "short_description": shortDescription,
        "sku": sku,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "date_on_sale_from": dateOnSaleFrom,
        "date_on_sale_from_gmt": dateOnSaleFromGmt,
        "date_on_sale_to": dateOnSaleTo,
        "date_on_sale_to_gmt": dateOnSaleToGmt,
        "on_sale": onSale,
        "purchasable": purchasable,
        "total_sales": totalSales,
        "virtual": virtual,
        "downloadable": downloadable,
        "downloads": downloads == null
            ? []
            : List<dynamic>.from(downloads!.map((x) => x)),
        "download_limit": downloadLimit,
        "download_expiry": downloadExpiry,
        "external_url": externalUrl,
        "button_text": buttonText,
        "tax_status": taxStatusValues.reverse[taxStatus],
        "tax_class": taxClass,
        "manage_stock": manageStock,
        "stock_quantity": stockQuantity,
        "backorders": backordersValues.reverse[backorders],
        "backorders_allowed": backordersAllowed,
        "backordered": backordered,
        "low_stock_amount": lowStockAmount,
        "sold_individually": soldIndividually,
        "weight": weight,
        "dimensions": dimensions?.toJson(),
        "shipping_required": shippingRequired,
        "shipping_taxable": shippingTaxable,
        "shipping_class": shippingClass,
        "shipping_class_id": shippingClassId,
        "reviews_allowed": reviewsAllowed,
        "average_rating": averageRating,
        "rating_count": ratingCount,
        "upsell_ids": upsellIds == null
            ? []
            : List<dynamic>.from(upsellIds!.map((x) => x)),
        "cross_sell_ids": crossSellIds == null
            ? []
            : List<dynamic>.from(crossSellIds!.map((x) => x)),
        "parent_id": parentId,
        "purchase_note": purchaseNote,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "tags": tags == null
            ? []
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "attributes": attributes == null
            ? []
            : List<dynamic>.from(attributes!.map((x) => x.toJson())),
        "default_attributes": defaultAttributes == null
            ? []
            : List<dynamic>.from(defaultAttributes!.map((x) => x)),
        "variations": variations == null
            ? []
            : List<dynamic>.from(variations!.map((x) => x)),
        "grouped_products": groupedProducts == null
            ? []
            : List<dynamic>.from(groupedProducts!.map((x) => x)),
        "menu_order": menuOrder,
        "price_html": priceHtml,
        "related_ids": relatedIds == null
            ? []
            : List<dynamic>.from(relatedIds!.map((x) => x)),
        "meta_data": metaData == null
            ? []
            : List<dynamic>.from(metaData!.map((x) => x.toJson())),
        "stock_status": stockStatusValues.reverse[stockStatus],
        "has_options": hasOptions,
        "_links": links?.toJson(),
      };
}

class Attribute {
  int? id;
  String? name;
  int? position;
  bool? visible;
  bool? variation;
  List<String>? options;

  Attribute({
    this.id,
    this.name,
    this.position,
    this.visible,
    this.variation,
    this.options,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        visible: json["visible"],
        variation: json["variation"],
        options: json["options"] == null
            ? []
            : List<String>.from(json["options"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "visible": visible,
        "variation": variation,
        "options":
            options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
      };
}

enum Backorders { NO }

final backordersValues = EnumValues({"no": Backorders.NO});

enum CatalogVisibility { VISIBLE }

final catalogVisibilityValues =
    EnumValues({"visible": CatalogVisibility.VISIBLE});

class Category {
  int? id;
  String? name;
  String? slug;

  Category({
    this.id,
    this.name,
    this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Dimensions {
  String? length;
  String? width;
  String? height;

  Dimensions({
    this.length,
    this.width,
    this.height,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        length: json["length"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "length": length,
        "width": width,
        "height": height,
      };
}

class ProductImage {
  int? id;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;

  ProductImage({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        dateCreatedGmt: json["date_created_gmt"] == null
            ? null
            : DateTime.parse(json["date_created_gmt"]),
        dateModified: json["date_modified"] == null
            ? null
            : DateTime.parse(json["date_modified"]),
        dateModifiedGmt: json["date_modified_gmt"] == null
            ? null
            : DateTime.parse(json["date_modified_gmt"]),
        src: json["src"],
        name: json["name"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated?.toIso8601String(),
        "date_created_gmt": dateCreatedGmt?.toIso8601String(),
        "date_modified": dateModified?.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
        "src": src,
        "name": name,
        "alt": alt,
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
        self: json["self"] == null
            ? []
            : List<Collection>.from(
                json["self"]!.map((x) => Collection.fromJson(x))),
        collection: json["collection"] == null
            ? []
            : List<Collection>.from(
                json["collection"]!.map((x) => Collection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null
            ? []
            : List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": collection == null
            ? []
            : List<dynamic>.from(collection!.map((x) => x.toJson())),
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

class ValueClass {
  dynamic styleColor;
  List<dynamic>? vcGridId;

  ValueClass({
    this.styleColor,
    this.vcGridId,
  });

  factory ValueClass.fromJson(Map<String, dynamic> json) => ValueClass(
        styleColor: json["Style Color"],
        vcGridId: json["vc_grid_id"] == null
            ? []
            : List<dynamic>.from(json["vc_grid_id"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Style Color": styleColor,
        "vc_grid_id":
            vcGridId == null ? [] : List<dynamic>.from(vcGridId!.map((x) => x)),
      };
}

class StyleColorClass {
  List<String>? color;
  List<String>? image;

  StyleColorClass({
    this.color,
    this.image,
  });

  factory StyleColorClass.fromJson(Map<String, dynamic> json) =>
      StyleColorClass(
        color: json["color"] == null
            ? []
            : List<String>.from(json["color"]!.map((x) => x)),
        image: json["image"] == null
            ? []
            : List<String>.from(json["image"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "color": color == null ? [] : List<dynamic>.from(color!.map((x) => x)),
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
      };
}

enum Status { PUBLISH }

final statusValues = EnumValues({"publish": Status.PUBLISH});

enum StockStatus { INSTOCK }

final stockStatusValues = EnumValues({"instock": StockStatus.INSTOCK});

enum TaxStatus { TAXABLE }

final taxStatusValues = EnumValues({"taxable": TaxStatus.TAXABLE});

enum Type { VARIABLE, SIMPLE }

final typeValues =
    EnumValues({"simple": Type.SIMPLE, "variable": Type.VARIABLE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

List<ProductCategory> productCategoriesFromJson(String str) =>
    List<ProductCategory>.from(
        json.decode(str).map((x) => ProductCategory.fromJson(x)));

String productCategoriesToJson(List<ProductCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductCategory {
  final int? id;
  final String? name;
  final String? slug;
  final int? parent;
  final String? description;
  final Display? display;
  final Image? image;
  final int? menuOrder;
  final int? count;
  final Links? links;

  ProductCategory({
    this.id,
    this.name,
    this.slug,
    this.parent,
    this.description,
    this.display,
    this.image,
    this.menuOrder,
    this.count,
    this.links,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        parent: json["parent"],
        description: json["description"],
        display: displayValues.map[json["display"]]!,
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        menuOrder: json["menu_order"],
        count: json["count"],
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "parent": parent,
        "description": description,
        "display": displayValues.reverse[display],
        "image": image?.toJson(),
        "menu_order": menuOrder,
        "count": count,
        "_links": links?.toJson(),
      };
}

enum Display { DEFAULT }

final displayValues = EnumValues({"default": Display.DEFAULT});

class Image {
  final int? id;
  final DateTime? dateCreated;
  final DateTime? dateCreatedGmt;
  final DateTime? dateModified;
  final DateTime? dateModifiedGmt;
  final String? src;
  final String? name;
  final String? alt;

  Image({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        dateCreatedGmt: json["date_created_gmt"] == null
            ? null
            : DateTime.parse(json["date_created_gmt"]),
        dateModified: json["date_modified"] == null
            ? null
            : DateTime.parse(json["date_modified"]),
        dateModifiedGmt: json["date_modified_gmt"] == null
            ? null
            : DateTime.parse(json["date_modified_gmt"]),
        src: json["src"],
        name: json["name"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated?.toIso8601String(),
        "date_created_gmt": dateCreatedGmt?.toIso8601String(),
        "date_modified": dateModified?.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
        "src": src,
        "name": name,
        "alt": alt,
      };
}


ProductCreate productCreateFromJson(String str) => ProductCreate.fromJson(json.decode(str));

String productCreateToJson(ProductCreate data) => json.encode(data.toJson());

class ProductCreate {
  String name;
  String type;
  String regularPrice;
  String description;
  String shortDescription;
  List<Category> categories;
  List<Image> images;

  ProductCreate({
    required this.name,
    required this.type,
    required this.regularPrice,
    required this.description,
    required this.shortDescription,
    required this.categories,
    required this.images,
  });

  factory ProductCreate.fromJson(Map<String, dynamic> json) => ProductCreate(
    name: json["name"],
    type: json["type"],
    regularPrice: json["regular_price"],
    description: json["description"],
    shortDescription: json["short_description"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "regular_price": regularPrice,
    "description": description,
    "short_description": shortDescription,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}




List<ProductVariationResponse> productsVariationResponseFromJson(String str) => List<ProductVariationResponse>.from(json.decode(str).map((x) => ProductVariationResponse.fromJson(x)));

String productsVariationResponseToJson(List<ProductVariationResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductVariationResponse {
  int? id;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  String? description;
  String? permalink;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  bool? onSale;
  String? status;
  bool? purchasable;
  bool? virtual;
  bool? downloadable;
  List<dynamic>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? taxStatus;
  String? taxClass;
  bool? manageStock;
  dynamic stockQuantity;
  String? stockStatus;
  String? backorders;
  bool? backordersAllowed;
  bool? backordered;
  dynamic lowStockAmount;
  String? weight;
  Dimensions? dimensions;
  String? shippingClass;
  int? shippingClassId;
  Image? image;
  List<Attribute>? attributes;
  int? menuOrder;
  List<MetaDatum>? metaData;
  Links? links;

  ProductVariationResponse({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.description,
    this.permalink,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    this.onSale,
    this.status,
    this.purchasable,
    this.virtual,
    this.downloadable,
    this.downloads,
    this.downloadLimit,
    this.downloadExpiry,
    this.taxStatus,
    this.taxClass,
    this.manageStock,
    this.stockQuantity,
    this.stockStatus,
    this.backorders,
    this.backordersAllowed,
    this.backordered,
    this.lowStockAmount,
    this.weight,
    this.dimensions,
    this.shippingClass,
    this.shippingClassId,
    this.image,
    this.attributes,
    this.menuOrder,
    this.metaData,
    this.links,
  });

  ProductVariationResponse copyWith({
    int? id,
    DateTime? dateCreated,
    DateTime? dateCreatedGmt,
    DateTime? dateModified,
    DateTime? dateModifiedGmt,
    String? description,
    String? permalink,
    String? sku,
    String? price,
    String? regularPrice,
    String? salePrice,
    dynamic dateOnSaleFrom,
    dynamic dateOnSaleFromGmt,
    dynamic dateOnSaleTo,
    dynamic dateOnSaleToGmt,
    bool? onSale,
    String? status,
    bool? purchasable,
    bool? virtual,
    bool? downloadable,
    List<dynamic>? downloads,
    int? downloadLimit,
    int? downloadExpiry,
    String? taxStatus,
    String? taxClass,
    bool? manageStock,
    dynamic stockQuantity,
    String? stockStatus,
    String? backorders,
    bool? backordersAllowed,
    bool? backordered,
    dynamic lowStockAmount,
    String? weight,
    Dimensions? dimensions,
    String? shippingClass,
    int? shippingClassId,
    Image? image,
    List<Attribute>? attributes,
    int? menuOrder,
    List<MetaDatum>? metaData,
    Links? links,
  }) =>
      ProductVariationResponse(
        id: id ?? this.id,
        dateCreated: dateCreated ?? this.dateCreated,
        dateCreatedGmt: dateCreatedGmt ?? this.dateCreatedGmt,
        dateModified: dateModified ?? this.dateModified,
        dateModifiedGmt: dateModifiedGmt ?? this.dateModifiedGmt,
        description: description ?? this.description,
        permalink: permalink ?? this.permalink,
        sku: sku ?? this.sku,
        price: price ?? this.price,
        regularPrice: regularPrice ?? this.regularPrice,
        salePrice: salePrice ?? this.salePrice,
        dateOnSaleFrom: dateOnSaleFrom ?? this.dateOnSaleFrom,
        dateOnSaleFromGmt: dateOnSaleFromGmt ?? this.dateOnSaleFromGmt,
        dateOnSaleTo: dateOnSaleTo ?? this.dateOnSaleTo,
        dateOnSaleToGmt: dateOnSaleToGmt ?? this.dateOnSaleToGmt,
        onSale: onSale ?? this.onSale,
        status: status ?? this.status,
        purchasable: purchasable ?? this.purchasable,
        virtual: virtual ?? this.virtual,
        downloadable: downloadable ?? this.downloadable,
        downloads: downloads ?? this.downloads,
        downloadLimit: downloadLimit ?? this.downloadLimit,
        downloadExpiry: downloadExpiry ?? this.downloadExpiry,
        taxStatus: taxStatus ?? this.taxStatus,
        taxClass: taxClass ?? this.taxClass,
        manageStock: manageStock ?? this.manageStock,
        stockQuantity: stockQuantity ?? this.stockQuantity,
        stockStatus: stockStatus ?? this.stockStatus,
        backorders: backorders ?? this.backorders,
        backordersAllowed: backordersAllowed ?? this.backordersAllowed,
        backordered: backordered ?? this.backordered,
        lowStockAmount: lowStockAmount ?? this.lowStockAmount,
        weight: weight ?? this.weight,
        dimensions: dimensions ?? this.dimensions,
        shippingClass: shippingClass ?? this.shippingClass,
        shippingClassId: shippingClassId ?? this.shippingClassId,
        image: image ?? this.image,
        attributes: attributes ?? this.attributes,
        menuOrder: menuOrder ?? this.menuOrder,
        metaData: metaData ?? this.metaData,
        links: links ?? this.links,
      );

  factory ProductVariationResponse.fromJson(Map<String, dynamic> json) => ProductVariationResponse(
    id: json["id"],
    dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
    dateCreatedGmt: json["date_created_gmt"] == null ? null : DateTime.parse(json["date_created_gmt"]),
    dateModified: json["date_modified"] == null ? null : DateTime.parse(json["date_modified"]),
    dateModifiedGmt: json["date_modified_gmt"] == null ? null : DateTime.parse(json["date_modified_gmt"]),
    description: json["description"],
    permalink: json["permalink"],
    sku: json["sku"],
    price: json["price"],
    regularPrice: json["regular_price"],
    salePrice: json["sale_price"],
    dateOnSaleFrom: json["date_on_sale_from"],
    dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
    dateOnSaleTo: json["date_on_sale_to"],
    dateOnSaleToGmt: json["date_on_sale_to_gmt"],
    onSale: json["on_sale"],
    status: json["status"],
    purchasable: json["purchasable"],
    virtual: json["virtual"],
    downloadable: json["downloadable"],
    downloads: json["downloads"] == null ? [] : List<dynamic>.from(json["downloads"]!.map((x) => x)),
    downloadLimit: json["download_limit"],
    downloadExpiry: json["download_expiry"],
    taxStatus: json["tax_status"],
    taxClass: json["tax_class"],
    manageStock: json["manage_stock"],
    stockQuantity: json["stock_quantity"],
    stockStatus: json["stock_status"],
    backorders: json["backorders"],
    backordersAllowed: json["backorders_allowed"],
    backordered: json["backordered"],
    lowStockAmount: json["low_stock_amount"],
    weight: json["weight"],
    dimensions: json["dimensions"] == null ? null : Dimensions.fromJson(json["dimensions"]),
    shippingClass: json["shipping_class"],
    shippingClassId: json["shipping_class_id"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    attributes: json["attributes"] == null ? [] : List<Attribute>.from(json["attributes"]!.map((x) => Attribute.fromJson(x))),
    menuOrder: json["menu_order"],
    metaData: json["meta_data"] == null ? [] : List<MetaDatum>.from(json["meta_data"]!.map((x) => MetaDatum.fromJson(x))),
    links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_created": dateCreated?.toIso8601String(),
    "date_created_gmt": dateCreatedGmt?.toIso8601String(),
    "date_modified": dateModified?.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
    "description": description,
    "permalink": permalink,
    "sku": sku,
    "price": price,
    "regular_price": regularPrice,
    "sale_price": salePrice,
    "date_on_sale_from": dateOnSaleFrom,
    "date_on_sale_from_gmt": dateOnSaleFromGmt,
    "date_on_sale_to": dateOnSaleTo,
    "date_on_sale_to_gmt": dateOnSaleToGmt,
    "on_sale": onSale,
    "status": status,
    "purchasable": purchasable,
    "virtual": virtual,
    "downloadable": downloadable,
    "downloads": downloads == null ? [] : List<dynamic>.from(downloads!.map((x) => x)),
    "download_limit": downloadLimit,
    "download_expiry": downloadExpiry,
    "tax_status": taxStatus,
    "tax_class": taxClass,
    "manage_stock": manageStock,
    "stock_quantity": stockQuantity,
    "stock_status": stockStatus,
    "backorders": backorders,
    "backorders_allowed": backordersAllowed,
    "backordered": backordered,
    "low_stock_amount": lowStockAmount,
    "weight": weight,
    "dimensions": dimensions?.toJson(),
    "shipping_class": shippingClass,
    "shipping_class_id": shippingClassId,
    "image": image?.toJson(),
    "attributes": attributes == null ? [] : List<dynamic>.from(attributes!.map((x) => x.toJson())),
    "menu_order": menuOrder,
    "meta_data": metaData == null ? [] : List<dynamic>.from(metaData!.map((x) => x.toJson())),
    "_links": links?.toJson(),
  };
}
