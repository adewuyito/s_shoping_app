// import 'dart:convert';

// // ignore: depend_on_referenced_packages
// // import 'package:http/http.dart' as http;

// class BHttpHelper {
//   static const String _baseUrl = 'https://base-url-here.com';

//   // Get method
//   static Future<Map<String, dynamic>> get(String endPoint) async {
//     final response = await http.get(Uri.parse('$_baseUrl/$endPoint'));
//     return _handleResponse(response);
//   }

//   // Post method
//   static Future<Map<String, dynamic>> post(String endPoint, dynamic data) async {
//     final response = await http.post(
//       Uri.parse('$_baseUrl/$endPoint'),
//       headers: {'content-Type': 'application/json'},
//       body: json.encode(data),
//     );
//     return _handleResponse(response);
//   }

//   // Put method
//   static Future<Map<String, dynamic>> put(String endPoint, dynamic data) async {
//     final response = await http.put(
//       Uri.parse('$_baseUrl/$endPoint'),
//       headers: {'content-Type': 'application/json'},
//       body: json.encode(data),
//     );
//     return _handleResponse(response);
//   }

//   // Delete method
//   static Future<Map<String, dynamic>> delete(String endPoint) async {
//     final response = await http.delete(Uri.parse('$_baseUrl/$endPoint'));
//     return _handleResponse(response);
//   }

//   // Handle http response
//   static Map<String, dynamic> _handleResponse(http.Response response) {
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     }
//     throw Exception('Failed to load data ${response.statusCode}');
//   }
// }
