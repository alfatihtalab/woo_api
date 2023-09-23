<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

WooApi is a package for WooCommerce rest API (v3) plugin based on wordpress stores. which make web services and models much easier.
With WooApi you can not only output a response, but also retrieve modeled objects and their properties.

See also:

- [The official WooCommerce API docs](https://woocommerce.com/documentation/woocommerce/), which showcases how to use `woocommerc`
- [Postman API docs](https://www.postman.com/ernestoliberio/workspace/data/documentation/884924-86ebdce1-9ace-45de-91a7-6fb8a6af7ef8), which contains an implementation of that app using `postman` + [ChangeNotifier]



## Features

- Data from/to json has already been modeled
- A singleton class at the top of your app
- A vastly reduced boilerplate over making models
- Implementation by providing your credentials of the WooCommerce

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage


```dart
final wooApi = WooApi(
    scheme: 'HTTP_OR_HTTPS',
    host: 'www.yourwordpressdomain.com',
    consumerKey: 'YOUR_CONSUMER_KEY',
    consumerSecret: 'YOUR_SECRET_KEY');

final response = await wooApi.getProductById(140);
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
