// ignore_for_file: constant_identifier_names
// const String url = 'https://rawado.reigeeky.com';

String? url = '';

 class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}



 class Endpoints {
  Endpoints._();
  //backend_url
  // App Url

  static String signUp() => "/api/register";
  static String logIn() => "/api/login";


  // Customer API Url
}
