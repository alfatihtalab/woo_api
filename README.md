

WooApi is a package for WooCommerce rest API (v3) plugin based on wordpress stores. which make web services and models much easier.
With WooApi you can not only output a response, but also retrieve modeled objects and their properties.

See also:

- [The official WooCommerce API docs](https://woocommerce.com/documentation/woocommerce/), which showcases how to use `woocommerc`
- [Postman API docs](https://www.postman.com/ernestoliberio/workspace/data/documentation/884924-86ebdce1-9ace-45de-91a7-6fb8a6af7ef8), which contains an implementation of that app using `postman`



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

```dart
void main()async{
  final wooApi = WooApi(
      scheme: 'YOUR_SCHEMA',
      host: 'www.yourwordpressdomain.com',
      consumerKey: 'YOUR_CONSUMER_KEY',
      consumerSecret: 'YOUR_SECRET_KEY');

  // use try catch to handel errors
  try{
    final response = await wooApi.getProductById(140);

  }catch(e){
  //   handel the errors
  }



}
```

## For more info

_@alfatihtalab_ |
[Linkedin](https://www.linkedin.com/in/alfatihtalab/) |
[Twitter](https://twitter.com/alfatihtalab) |
[Stackoverflow](https://stackoverflow.com/users/9351052/alfatih-eltayeb)
