library woo_api;


export 'src/models/customer.dart'
    show
    CustomerCreate,
    CustomerCreateResponse,
    CustomerLoginResponse,
    BasicCustomerData,
    Links,
    Collection;

export 'src/models/coupon.dart' show Coupon, CouponResponse;
export 'src/models/orders.dart'
    show OrderCreate, OrderResponse, LineItem, LineItemPost,CouponLine, ShippingLine, Ing;
export 'src/models/products.dart' show Product, ProductCreate, ProductCategory;
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:woo_api/src/models/coupon.dart';
import 'package:woo_api/src/models/orders.dart';
import 'package:woo_api/src/models/products.dart';
import 'package:woo_api/src/models/customer.dart';

class WooApi {
  late String scheme;
  late String host;
  late String consumerKey;
  late String consumerSecret;

  static final WooApi _instance = WooApi._internal();

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory WooApi(
      {required String scheme,
        required String host,
        required String consumerKey,
        required String consumerSecret}) {
    _instance.scheme = scheme;
    _instance.host = host;
    _instance.consumerKey = consumerKey;
    _instance.consumerSecret = consumerSecret;
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  WooApi._internal();

//region Coupon

//TODO create a new coupon
//POST /coupons

//TODO retrieve a coupon
//GET /wp-json/wc/v3/coupons/<id>

//TODO List all coupons
//GET /wp-json/wc/v3/coupons
  Future<List<CouponResponse>> getCouponByCode(
      {required String code}) async {

    var client = http.Client();
    try {
      final url = Uri(
          scheme: scheme,
          host: host,
          path: '/wp-json/wc/v3/coupons',
          queryParameters: {"code": code}
      );

      var response = await client.get(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: '*/*',
          HttpHeaders.authorizationHeader:
          'Basic ${base64.encode(utf8.encode('$consumerKey:$consumerSecret'))}',
        },
      );

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return couponsResponseFromJson(response.body);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load coupon');
      }

    } finally {
      client.close();
    }
  }

//TODO Update a coupon
//PUT /wp-json/wc/v3/coupons/<id>

//TODO Delete a coupon
//DELETE /wp-json/wc/v3/coupons/<id>

//TODO Batch update coupons
// POST /wp-json/wc/v3/coupons/batch

//endregion

//region Customer

//TODO Create a customer [done]
//POST /wp-json/wc/v3/customers
  Future<CustomerCreateResponse> postCustomer(
      CustomerCreate customerCreate) async {
    // Map<String, String> requestHeaders = {
    //   'Content-type': 'application/json',
    //   'Accept': 'application/json',
    //   'Authorization': basicAuth
    // };

    final url = Uri(
      scheme: scheme,
      host: host,
      path: '/wp-json/wc/v3/customers',
    );

    var body = <String, dynamic>{};
    body['email'] = customerCreate.email;
    body['first_name'] = customerCreate.firstName;
    body['last_name'] = customerCreate.lastName;
    body['billing'] = customerCreate.billing;
    body['shipping'] = customerCreate.shipping;
    body['username'] = customerCreate.username;
    body['password'] = customerCreate.password;

    var client = http.Client();
    try {
      var response = await client.post(
        url,
        body: jsonEncode(body),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
          'Basic ${base64.encode(utf8.encode('$consumerKey:$consumerSecret'))}',
          HttpHeaders.acceptHeader:'application/json'
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return CustomerCreateResponse.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to post create');
      }
    }  finally {
      client.close();
    }
  }

//TODO customer login [done]
//POST /wp-json/wc/v3/customers
  Future<CustomerLoginResponse> customerLogin(
      {required String username, required String password}) async {
    final url = 'https://$host/wp-json/jwt-auth/v1/token';
    // final url2 = 'https://$host/wp-json/jwt-auth/v1/token?username=$username&password=$password';

    final body = jsonEncode({"username": username, "password": password});

    var client = http.Client();
    try {
      var response = await client.post(
        Uri.parse(url),
        body: body,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          // HttpHeaders.authorizationHeader:
          // 'Basic ${base64.encode(utf8.encode('$consumerKey:$consumerSecret'))}',
        },
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.

        return customerLoginResponseFromJson(response.body);
      } else {

        throw Exception('Failed to load orders');
      }

    } finally {
      client.close();
    }
  }

//TODO Retrieve a customer [done]
// GET /wp-json/wc/v3/customers/<id>
  Future<CustomerCreateResponse> getCustomerById(
      {required int customerId}) async {
    final url =
    Uri(scheme: scheme, host: host, path: '/wp-json/wc/v3/customers/$customerId');

    var client = http.Client();
    try {
      var response = await client.get(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
          'Basic ${base64.encode(utf8.encode('$consumerKey:$consumerSecret'))}',
        },
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.

        return customerCreateResponseFromJson(response.body);
      } else {

        throw Exception('Failed to load orders');
      }

    } finally {
      client.close();
    }
  }
//TODO List all customers
//GET /wp-json/wc/v3/customers

//TODO Update a customer [done]
// PUT /wp-json/wc/v3/customers/<id>
  Future<CustomerCreateResponse> updateCustomer(
      {required int customerId,
        String? firstName,
        String? lastName,
        String? email,
        String? username,
        String? password,
        Ing? shipping,
        Ing? billing,
      }) async {
    Map<String, dynamic> payload = {};

    ({
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': username,
      'username': password,
      'shipping': shipping,
      'billing': billing,
    }).forEach((k, v) {
      if (v != null) payload[k] = v;
    });

    final url =
    Uri(scheme: scheme,
      host: host,
      path: '/wp-json/wc/v3/customers/$customerId',
      // queryParameters: payload
    );

    var client = http.Client();
    try {
      var response = await client.patch(
        url,
        body: jsonEncode(payload),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
          'Basic ${base64.encode(utf8.encode('$consumerKey:$consumerSecret'))}',
        },
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.

        return customerCreateResponseFromJson(response.body);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load orders');
      }

    } finally {
      client.close();
    }
  }

//TODO Delete a customer [done]
// DELETE /wp-json/wc/v3/customers/<id>
  Future<CustomerCreateResponse> deleteCustomer({required int customerId, bool? force})
  async {
    var client = http.Client();

    Map<String, dynamic> payload = {};

    ({'force': force}).forEach((k, v) {
      if (v != null) payload[k] = v.toString();
    });

    try {
      final url = Uri(
        scheme: scheme,
        host: host,
        path: '/wp-json/wc/v3/customers/$customerId',
      );

      var response = await client.delete(
        url,
        body: jsonEncode(payload),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
          'Basic ${base64.encode(utf8.encode('$consumerKey:$consumerSecret'))}',
        },
      );



      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return CustomerCreateResponse.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to delete the customer');
      }

    } finally {
      client.close();
    }
  }
//TODO Batch update customers
//POST /wp-json/wc/v3/customers/batch

//TODO Retrieve customer downloads
//GET /wp-json/wc/v3/customers/<id>/downloads

//endregion

//region Orders

//TODO Create a Orders [done]
//POST /wp-json/wc/v3/orders
  Future<OrderResponse> orderProducts(
      {required OrderCreate orderCreate}) async {
    // Map<String, dynamic> payload = {};

    var client = http.Client();
    try {
      // var baseUrlWithParam = '${scheme+host}/wc/v3/orders';

      // final url = Uri.parse(baseUrlWithParam);
      final url =
      Uri(scheme: scheme, host: host, path: '/wp-json/wc/v3/orders');

      var response = await client.post(
        url,
        body: json.encode(orderCreate),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
          'Basic ${base64.encode(utf8.encode('$consumerKey:$consumerSecret'))}',
        },
      );


      if (response.statusCode == 200 || response.statusCode == 201) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return OrderResponse.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to post create');
      }

    } finally {
      client.close();
    }
  }

//TODO Retrieve a Orders

//TODO List all Orders [done]
//GET /wp-json/wc/v3/orders
  Future<List<OrderResponse>> getOrders(
      {required int customerId,
        int? page,
        int? perPage,
        String? status}) async {
    Map<String, dynamic> payload = {};

    ({
      'page': page,
      'per_page': perPage,
      'customer': customerId,
      'status': status
    }).forEach((k, v) {
      if (v != null) payload[k] = v.toString();
    });

    var client = http.Client();
    try {
      final url = Uri(
        scheme: scheme,
        host: host,
        path: '/wp-json/wc/v3/orders',
        queryParameters: payload,
      );
      var response = await client.get(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
          'Basic ${base64.encode(utf8.encode('$consumerKey:$consumerSecret'))}',
        },
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return ordersResponseFromJson(response.body);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load orders');
      }

    } finally {
      client.close();
    }
  }

// GET /wp-json/wc/v3/orders/<id>

//TODO delete an Orders
// PUT /wp-json/wc/v3/orders/<id>
  Future<OrderResponse> deleteOrder({required int orderId, bool? force}) async {
    var client = http.Client();

    Map<String, dynamic> payload = {};

    ({'force': force}).forEach((k, v) {
      if (v != null) payload[k] = v.toString();
    });

    try {
      final url = Uri(
        scheme: scheme,
        host: host,
        path: '/wp-json/wc/v3/orders/$orderId',
      );

      var response = await client.delete(
        url,
        body: jsonEncode(payload),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
          'Basic ${base64.encode(utf8.encode('$consumerKey:$consumerSecret'))}',
        },
      );


      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return OrderResponse.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load orders');
      }

    } finally {
      client.close();
    }
  }

//TODO Update an Orders [done]
// DELETE /wp-json/wc/v3/orders/<id>
  Future<OrderResponse> updateOrder(
      {required int orderId,
        Ing? billing,
        Ing? shipping,
        List<LineItem>? lineItems,
        String? status}) async {
    Map<String, dynamic> payload = {};

    ({
      'shipping': shipping,
      'billing': billing,
      'line_items': lineItems,
      'status': status
    }).forEach((k, v) {
      if (v != null) payload[k] = v;
    });

    var client = http.Client();
    final url = Uri(
      scheme: scheme,
      host: host,
      path: '/wp-json/wc/v3/orders/$orderId',
    );
    try {
      var response = await client.patch(
        url,
        body: jsonEncode(payload),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
          'Basic ${base64.encode(utf8.encode('$consumerKey:$consumerSecret'))}',
        },
      );


      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return OrderResponse.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load orders');
      }

    } finally {
      client.close();
    }
  }

//TODO Batch update Orders
//POST /wp-json/wc/v3/orders/batch

//endregion

//region Products
//TODO Create an product
//POST /wp-json/wc/v3/products

//TODO Retrieve an product
// GET /wp-json/wc/v3/products/<id>
  Future<Product> getProductById(int productId)async {
    var client = http.Client();
    try {
      final url = Uri(
        scheme: scheme,
        host: host,
        path: '/wp-json/wc/v3/products/$productId',
      );

      var response = await client.get(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
          'Basic ${base64.encode(utf8.encode('$consumerKey:$consumerSecret'))}',
        },
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return Product.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load products');
      }

    } finally {
      client.close();
    }
  }

//TODO List all products [done]
//GET /wp-json/wc/v3/products
  Future<List<Product>> getAllProducts(
      {
        int? page,
        int? perPage,
        String? search,
        String? after,
        String? before,
        String? order,
        String? orderBy,
        String? slug,
        String? status,
        String? type,
        String? sku,
        String? category,
        String? tag,
        String? shippingClass,
        String? attribute,
        String? attributeTerm,
        String? taxClass,
        String? minPrice,
        String? maxPrice,
        String? stockStatus,
        List<int>? exclude,
        List<int>? parentExclude,
        List<int>? include,
        List<int>? parent,
        int? offset,
        bool? featured,
        bool? onSale}) async {
    Map<String, dynamic> payload = {};

    ({
      'page': page,
      'per_page': perPage,
      'search': search,
      'after': after,
      'before': before,
      'exclude': exclude,
      'include': include,
      'offset': offset,
      'order': order,
      'orderby': orderBy,
      'parent': parent,
      'parent_exclude': parentExclude,
      'slug': slug,
      'status': status,
      'type': type,
      'sku': sku,
      'featured': featured,
      'category': category,
      'tag': tag,
      'shipping_class': shippingClass,
      'attribute': attribute,
      'attribute_term': attributeTerm,
      'tax_class': taxClass,
      'on_sale': onSale,
      'min_price': minPrice,
      'max_price': maxPrice,
      'stock_status': stockStatus,
    }).forEach((k, v) {
      if (v != null) payload[k] = v.toString();
    });

    var client = http.Client();
    try {
      final url = Uri(
        scheme: scheme,
        host: host,
        path: '/wp-json/wc/v3/products',
        queryParameters: payload,
      );

      var response = await client.get(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
          'Basic ${base64.encode(utf8.encode('$consumerKey:$consumerSecret'))}',
        },
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return productsFromJson(response.body);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load products');
      }

    } finally {
      client.close();
    }
  }

//TODO Update a product
// PUT /wp-json/wc/v3/products/<id>

//TODO Delete a product
// DELETE /wp-json/wc/v3/products/<id>

//TODO Batch update product
//POST /wp-json/wc/v3/products/batch

//TODO retrieve product categories [done]
//POST /wp-json/wc/v3/products/categories
  Future<List<ProductCategory>> getProductCategories() async {
    var client = http.Client();
    try {
      final url = Uri(
        scheme: scheme,
        host: host,
        path: '/wp-json/wc/v3/products/categories',
        // queryParameters: payload,
      );

      var response = await client.get(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
          'Basic ${base64.encode(utf8.encode('$consumerKey:$consumerSecret'))}',
        },
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return productCategoriesFromJson(response.body);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load products');
      }
      // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      //
      // print(decodedResponse);
    } finally {
      client.close();
    }
  }

//endregion

//region Variations

// TODO get product variations [done]
//   /wp-json/wc/v3/products/<product_id>/variations
  Future<List<ProductVariationResponse>> getProductVariations(
      {required int productId, int? page, int perPage = 10}) async {
    var client = http.Client();
    try {
      Map<String, dynamic> payload = {};

      ({
        'page': page,
        'per_page': perPage,
      }).forEach((k, v) {
        if (v != null) payload[k] = v.toString();
      });
      final url = Uri(
        scheme: scheme,
        host: host,
        path: '/wp-json/wc/v3/products/$productId/variations',
        queryParameters: payload,
      );

      var response = await client.get(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
          'Basic ${base64.encode(utf8.encode('$consumerKey:$consumerSecret'))}',
        },
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return productsVariationResponseFromJson(response.body);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load products');
      }
      // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      //
      // print(decodedResponse);
    } finally {
      client.close();
    }
  }

//endregion
}
